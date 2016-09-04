require "rails_helper"

RSpec.feature "User can view all playlists" do
  scenario "A user can view all created playlists" do

    playlists = create_list(:playlist, 3)


    playlists.each do |playlist|
      visit playlists_path
      expect(page).to have_content(playlist.name)
      click_link("#{playlist.name}")
      expect(current_path).to eq(playlist_path(playlist.id))
    end

  end
end
