require 'rails_helper'

RSpec.describe "zoos/edit", type: :view do
  before(:each) do
    @zoo = assign(:zoo, Zoo.create!(
      name: "MyString",
      address: "MyString"
    ))
  end

  it "renders the edit zoo form" do
    render

    assert_select "form[action=?][method=?]", zoo_path(@zoo), "post" do

      assert_select "input[name=?]", "zoo[name]"

      assert_select "input[name=?]", "zoo[address]"
    end
  end
end
