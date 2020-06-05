require 'rails_helper'

RSpec.describe AnimalsController, type: :request do
  describe "create" do
    let(:create) { post zoo_animals_url(zoo), params: { animal: animal_attrs } }
    let(:invalid_create) { post zoo_animals_url(zoo), params: { animal: { zoo_id: 'invalid' } } }

    let(:user) { FactoryBot.create(:user)}
    let(:zoo) { FactoryBot.create(:zoo) }
    let(:animal_attrs) { FactoryBot.attributes_for(:animal).merge(zoo_id: zoo.id) }

    describe 'when user is not authorized' do
      it "does not create a new Animal" do
        expect { create }.to change(Animal, :count).by(0)
      end

      it "redirets to sign in page" do
        create
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "when user is authorized" do
      before(:each) { sign_in user }

      context "with valid params" do
        it "creates a new Animal" do
          expect { create }.to change(Animal, :count).by(1)
        end

        it "redirects to the created animal" do
          create
          expect(response).to redirect_to(zoo_animal_path(zoo, Animal.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Animal" do
          expect { invalid_create }.to change(Animal, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          invalid_create
          expect(response).to be_successful
        end
      end
    end
  end
end
