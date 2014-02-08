require "instagram"


# todo - this code happens once per app, where should it go?
Instagram.configure do |config|
  config.client_id = "8b3a480d182b4e14a723047650366dd0"
  config.client_secret = "d87fc76491454c609c66ed5ee246d369"
end



# todo - implement max_id to finish page
# todo - this needs a return value of loop param and array
def get_page(primary_user_id, correspondent_user_id, max_id, min_date)

#	Instagram.user_recent_media(34343544)[2].comments.data[1].from.username

	user_recent_media = Instagram.user_recent_media(primary_user_id)

	interactions = []

	user_recent_media.each do |item|
		# parse comments
		comments = item.comments

		# only pay attention to comments by primary user
		# if correspondent has initiated contact on this post
		# already

		correspondent_commented? = false

		comments.data.each do |comment|

			if comment.from.id == correspondent_user_id
				correspondent_commented? = true
				interaction = {
					from: correspondent_user_id,
					timestamp: comment.timestamp
				}

				interactions.push(interaction)
			end

			if correspondent_commented? && comment.from.id == primary_user_id
				interaction = {
					from: primary_user_id
					timestamp: comment.timestamp
				}
				interactions.push(interaction)
			end
		end
		# done with comments
	end

	interactions
end

def get_comment_interactions(primary_user_id, correspondent_username) 

	correspondent_user_id = get_user_id(correspondent_username)
	get_page(primary_user_id, correspondent_user_id, 0, 0)
end



# todo this is really tricky business logic, I think
# the UI may need to require getting an instagram handle
def get_user_id(username)
	Instagram.user_search(username)
end