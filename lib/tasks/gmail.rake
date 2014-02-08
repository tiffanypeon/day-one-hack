desc "Log in to GMail, save last 100 messages into events hash"
	task :save_emails => :environment do
		require 'gmail'
		# Log in to gmail account
		gmail = Gmail.connect(username, password)
		#need to set up username, password in ENV
		emails = gmail.inbox.find(:from => abuser_email)
		#need to set up abuser_email in ENV
		gmail_hash = Hash.new

		emails.take(10).each do |email|
			gmail_hash[email.date] ||= email.body.raw_source
		end
	end
end