	task :save_emails => :environment do
		username = # email username
		password = # password for email account, will eventually be set as ENV var
		abuser_email = # abuser email address
		# Log in to gmail account
		gmail = Gmail.connect(username, password)
		#need to set up username, password in ENV
		emails = gmail.inbox.find(:from => abuser_email).reverse

		#need to set up abuser_email in ENV
		gmail_hash = Hash.new

		emails.take(10).each do |email|
			Event.create(:content_created_at => email.date, :content => email.body.raw_source)
		end

	end
