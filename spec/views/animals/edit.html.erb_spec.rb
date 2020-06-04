require 'rails_helper'

RSpec.describe "animals/edit", type: :view do
  let(:zoo) { FactoryBot.create(:zoo) }

  before(:each) do
    @animal = assign(:animal, Animal.create!(
      name: "MyString",
      bio: "MyString",
      zoo: zoo
    ))
    assign(:zoo, zoo)
  end

  it "renders the edit animal form" do
    render

    assert_select "form[action=?][method=?]", zoo_animal_path(zoo, @animal), "post" do

      assert_select "input[name=?]", "animal[name]"

      assert_select "input[name=?]", "animal[bio]"

      assert_select "input[name=?]", "animal[zoo_id]"
    end
  end
end
