task :save_instagram, [:user_id] => :environment do |t, args|
  user = User.find(args)

  user_recent_media = Instagram.user_recent_media(user.instagram_user_id)

  user_recent_media.each do |item|
    comments = item.comments

    comments.data.each do |comment|
      if comment.from.id.to_i == user.instagram_abuser_id
        Event.create(content: comment.text)
      end
    end
  end
end
