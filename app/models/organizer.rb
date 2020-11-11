class Organizer < ApplicationRecord
    has_many :polls , :dependent => :destroy
    has_secure_token :access_token
    validates :name, presence: true
    validates :email, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
