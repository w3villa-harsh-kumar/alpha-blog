class User < ActiveRecord::Base
    before_save { self.email = email.downcase } #before saving to db, convert email to lowercase

    #Validations
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #regex for email validation
    validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

    # Associations
    has_many :articles, dependent: :destroy #if user is deleted, all articles associated with user are deleted

    # Password encryption
    has_secure_password #adds password_digest column to db and allows us to save a securely hashed password_digest attribute to the database
end