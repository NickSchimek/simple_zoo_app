require 'rails_helper'

RSpec.describe "animals/new", type: :view do
  let(:zoo) { FactoryBot.create(:zoo) }

  before(:each) do
    assign(:animal, Animal.new(
      name: "MyString",
      bio: "MyString",
      zoo: nil
    ))
    @zoo = zoo
  end

  it "renders new animal form" do
    render

    assert_select "form[action=?][method=?]", zoo_animals_path(zoo), "post" do

      assert_select "input[name=?]", "animal[name]"

      assert_select "input[name=?]", "animal[bio]"

      assert_select "input[name=?]", "animal[zoo_id]"
    end
  end
end
