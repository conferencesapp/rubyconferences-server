require "rails_helper"

describe "/api/v2/conferences" do
  describe "get conferences" do
    context "for JSON" do
      it "will render all required keys for v2" do
        create(:conference, :ruby)

        get "/api/v2/conferences", { tags: "ruby" }, token_auth

        expect(json.count).to eq(1)
        expect(json.first.keys).to eq(
          [
            "id",
            "name",
            "location",
            "description",
            "twitter_username",
            "start_date",
            "end_date",
            "website",
            "when",
            "logos",
            "latitude",
            "longitude",
            "cfp_end_at",
            "cfp_status"
          ]
        )
      end

      it "will render conferences tagged with given tags" do
        create(:conference, :ruby)
        create(:conference, :javascript)
        design_conference = create(:conference, :design)

        get "/api/v2/conferences", { tags: "ruby,javascript" }, token_auth

        ids = json.map { |key| key["id"] }
        expect(ids).not_to include(design_conference.id)
        expect(json.count).to eq(2)
      end

      it "will render upcoming conferences" do
        upcoming_ruby_conference = create(:conference, :ruby, :upcoming)
        create(:conference, :ruby, :past)

        get "/api/v2/conferences", { tags: "ruby" }, token_auth

        expect(json.count).to eq(1)
        expect(json.first["id"]).to eq(upcoming_ruby_conference.id)
        expect(json.first["name"]).to eq(upcoming_ruby_conference.name)
      end
    end
  end
end
