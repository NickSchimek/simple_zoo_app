require 'rails_helper'

RSpec.describe AnimalsController, type: :request do
  describe "update" do
    let(:update) { patch zoo_animal_url(zoo, animal), params: { animal: animal_attrs } }
    let(:user) { FactoryBot.create(:user)}
    let(:updated_name) { 'updated name' }
    let(:animal_attrs) { FactoryBot.attributes_for(:animal).merge(name: updated_name) }

    let(:zoo) { FactoryBot.create(:zoo) }
    let!(:animal) { FactoryBot.create(:animal, zoo: zoo) }

    describe 'when user is not authorized' do
      before(:each) { update }

      it "does not update the Animal" do
        animal.reload
        expect(animal.name).to_not eq(updated_name)
      end

      it "redirects to sign in page" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "when user is authorized" do
      before(:each) do
        sign_in user
        update
      end

      it "updates the requested animal" do
        animal.reload
        expect(animal.name).to eq(updated_name)
      end

      it "redirects to the animal" do
        animal.reload
        expect(response).to redirect_to(zoo_animal_url(animal.zoo, animal))
      end
    end
  end
end
