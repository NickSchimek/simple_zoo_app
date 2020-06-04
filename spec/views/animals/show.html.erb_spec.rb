require 'rails_helper'

RSpec.describe "animals/show", type: :view do
  let(:zoo) { FactoryBot.create(:zoo) }

  before(:each) do
    @animal = assign(:animal, Animal.create!(
      name: "Name",
      bio: "Bio",
      zoo: zoo
    ))
    @zoo = zoo
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Bio/)
    expect(rendered).to match(//)
  end
end
