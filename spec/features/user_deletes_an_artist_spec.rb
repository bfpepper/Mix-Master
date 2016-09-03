require "rails_helper"

RSpec.feature "User can delete an artist" do
  scenario "A User can delete an existing artist" do

    artist = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist)

    expect(current_path).to eq("/artists/#{artist.id}")
    expect(page).to have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")

    click_on "Delete"

    expect(current_path).to eq(artists_path)
    expect(page).not_to have_content "Bob Marley"
  end
end
