require 'securerandom'
class Link < ActiveRecord::Base

  validates :shortened_url, uniqueness: true

  before_save :ensure_valid_uri

  after_create :generate_shortened_url

  private

    def ensure_valid_uri
      self.url.scan(URI.regexp).present?
    end

    def generate_shortened_url
      self.shortened_url = SecureRandom.urlsafe_base64(6).gsub(/-|_/, (97+rand(27)).chr)
      self.save
    end

end
