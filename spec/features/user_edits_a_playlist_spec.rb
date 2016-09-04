require "rails_helper"

RSpec.feature "User can edit playlist" do
  scenario "User can edit an existing palylist" do

    playlist = create(:playlist_with_songs)
    song = create(:song)
    old_song = playlist.songs.first.title

    visit playlist_path(playlist.id)

    click_link "Edit Playlist"
    fill_in "Name", with: "New Playlist"
    check "#{song.title}"
    uncheck old_song
    click_button "Update Playlist"

    expect(page).to have_content("New Playlist")
    expect(page).to have_content("#{song.title}")
    expect(page).to_not have_content(old_song)
  end
end
