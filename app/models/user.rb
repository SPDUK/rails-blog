# frozen_string_literal: true

class User < ActiveRecord::Base
  # User has many articles
  has_many :articles

  before_save { self.email = email.downcase }
  # User.username - required, unique case insensitive, length 3-20
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 20 }

  # User.email - required, unique case insensitive, length max 164, must be email
  validates :email, presence: true, length: { maximum: 164 },
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
end