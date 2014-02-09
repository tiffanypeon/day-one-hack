task :save_instagram, [:user_id] => :environment do |t, args|
  user = User.find(args)

  user_recent_media = Instagram.user_recent_media(user.instagram_user_id)

  user_recent_media.each do |item|
    comments = item.comments

    comments.data.each do |comment|
      puts comment.inspect
      if comment.from.id.to_i == user.instagram_abuser_id
        Event.find_or_create_by(
          content_source: 'instagram',
          content: comment.text,
          person: comment.from.username,
          content_created_at: Time.at(comment.created_time.to_i)
        )
      end
    end
  end
end
