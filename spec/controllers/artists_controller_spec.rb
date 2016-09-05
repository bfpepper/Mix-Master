require "rails_helper"

RSpec.describe ArtistsController, type: :controller do
  describe "GET #index" do
    it "assigns all artists as @artists and renders index template" do
      artist = create(:artist)

      get(:index)

      expect(assigns(:artists)).to eq([artist])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested artist as @atrist and renders the show template" do
      artist = create(:artist)
      get(:show, {id: artist.to_param})
      expect(assigns(:artist)).to eq(artist)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new artist as @artist" do
      get :new
      expect(assigns(:artist)).to be_a_new(Artist)
    end
  end

  describe "GET #edit" do
    it "assigns the requested artist as @ artist" do
      artist = create(:artist)
      get :edit, {id: artist.to_param}
      expect(assigns(:artist)).to eq(artist)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new artist" do
        expect {post :create, {artist: attributes_for(:artist)}
      }.to change(Artist, :count).by(1)
    end

    it "assigns a newly created artist as @artist" do
      post :create, {artist: attributes_for(:artist)}
      expect(assigns(:artist)).to be_a(Artist)
      expect(assigns(:artist)).to be_persisted
    end

    it "redirects to a created artist" do
      post :create, {artist: attributes_for(:artist)}
      expect(response).to redirect_to(Artist.last)
    end
  end
end

    it "re-renders  the 'new' template" do
      post :create, {artist: attributes_for(:artist, name: nil)}
      expect(response).to  render_template("new")
    end

    describe "DELETE #destroy" do
      it "destroys the requested artist" do
        artist = create(:artist)
        expect {delete :destroy, {id: artist.to_param}
      }.to change(Artist, :count).by(-1)
    end

    it "redirects to the artist list" do
      artist = create(:artist)
      delete :destroy, {id: artist.to_param}
      expect(response).to redirect_to(artists_path)
    end
  end
end
