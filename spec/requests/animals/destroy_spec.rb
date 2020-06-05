require 'rails_helper'

RSpec.describe AnimalsController, type: :request do
  describe "destroy" do
    let(:destroy) { delete zoo_animal_url(zoo, animal) }
    let(:user) { FactoryBot.create(:user) }
    let(:zoo) { FactoryBot.create(:zoo) }
    let!(:animal) { FactoryBot.create(:animal, zoo: zoo) }

    context "when user is not authorized" do
      it "does not destroy the requested animal" do
        expect { destroy }.to change(Animal, :count).by(0)
      end

      it "redirectrs to sign in page" do
        destroy
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user is authorized" do
      before(:each) { sign_in user }

      it "destroys the requested animal" do
        expect { destroy }.to change(Animal, :count).by(-1)
      end

      it "redirects on to zoo index" do
        destroy
        expect(response).to redirect_to(zoo_animals_url(zoo))
      end
    end
  end
end
