module LinksHelper
  BASE_URL = "my-awesome-urlshortner.com:3000"

  def display_name(link)
    BASE_URL + "/" +link.shortened_url
  end
end
