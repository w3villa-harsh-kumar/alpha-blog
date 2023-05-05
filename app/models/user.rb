class User < ActiveRecord::Base
    before_save { self.email = email.downcase } #before saving to db, convert email to lowercase

    #Validations
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #regex for email validation
    validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

    # Associations
    has_many :articles
end