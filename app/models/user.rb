require 'rake'
load File.join(Rails.root, 'lib', 'tasks', 'instagram.rake')

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :get_instagram_ids, :get_gmail_token

  after_save :update_events

  private
  def get_instagram_ids
    if self.instagram_user
      self.instagram_user_id = ::Instagram.user_search(self.instagram_user).first.id
    end

    if self.instagram_abuser
      self.instagram_abuser_id = ::Instagram.user_search(self.instagram_abuser).first.id
    end
  end

  def get_gmail_token
    if self.gmail_user_token
    end
  end

  def update_events
    if self.instagram_user_id
      Rake::Task['save_instagram'].execute(self.id)
    end
  end
end
