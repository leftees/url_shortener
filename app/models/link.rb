require 'securerandom'
class Link < ActiveRecord::Base

  validates :shortened_url, uniqueness: true

  after_create :generate_shortened_url

  private
    def generate_shortened_url
      self.shortened_url = SecureRandom.urlsafe_base64(6).gsub(/-|_/, (97+rand(27)).chr)
      self.save
    end
end
