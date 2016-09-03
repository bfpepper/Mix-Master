require 'rails_helper'

RSpec.feature "User can view all artists" do
  scenario "they see all the artists on one page." do
      artist_1 = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
      artist_2 = Artist.create(name: "Skindred", image_path: "http://assets.blabbermouth.net/media/skindredband2015_638.jpg")

      visit '/artists'

      expect(page).to have_content "Skindred"

      click_link "Bob Marley"

      expect(page).to have_content "Bob Marley"
      expect(page).to have_css("img[src=\"#{artist_1.image_path}\"]")
  end
end
