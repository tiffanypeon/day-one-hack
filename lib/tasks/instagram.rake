task :save_instagram, [:user_id] => :environment do |t, args|
  user = User.find(args)

  puts user.instagram_user_id
  puts user.instagram_abuser_id
end
