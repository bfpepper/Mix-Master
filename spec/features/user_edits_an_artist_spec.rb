require 'rails_helper'

RSpec.feature "User can edit an artist" do
  scenario "A user can edit an existing artist" do

    artist_1 = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist_1)

    expect(current_path).to eq("/artists/#{artist_1.id}")
    expect(page).to have_content artist_1.name
    expect(page).to have_css("img[src=\"#{artist_1.image_path}\"]")

    click_on "Edit Artist"
    expect(current_path).to eq("/artists/#{artist_1.id}/edit")

    fill_in "artist_name", with: "Not Bob Marley"

    click_button "Update Artist"

    expect(current_path).to eq("/artists/#{artist_1.id}")
    expect(page).to have_content("Not Bob Marley")
    expect(page).to have_css("img[src=\"#{artist_1.image_path}\"]")
  end
end
