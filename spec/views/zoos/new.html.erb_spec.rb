require 'rails_helper'

RSpec.describe "zoos/new", type: :view do
  before(:each) do
    assign(:zoo, Zoo.new(
      name: "MyString",
      address: "MyString"
    ))
  end

  it "renders new zoo form" do
    render

    assert_select "form[action=?][method=?]", zoos_path, "post" do

      assert_select "input[name=?]", "zoo[name]"

      assert_select "input[name=?]", "zoo[address]"
    end
  end
end
