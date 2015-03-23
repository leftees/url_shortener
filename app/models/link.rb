require 'securerandom'
class Link < ActiveRecord::Base

  validates :shortened_url, uniqueness: true

  after_create :generate_shortened_url

  private
    def generate_shortened_url
      self.shortened_url = SecureRandom.urlsafe_base64(6).gsub(/-|_/, (97+rand(27)).chr)
      #  = loop do
      #   random_short_url = SecureRandom.urlsafe_base64(6).gsub(/-|_/, (97+rand(27)).chr)
      #   break random_short_url unless UrlShortener.exists?(shortened_url: random_short_url)        
      # end        
      self.save
    end
end
