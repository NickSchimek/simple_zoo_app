require 'rails_helper'

RSpec.describe "zoos/index", type: :view do
  before(:each) do
    assign(:zoos, [
      Zoo.create!(
        name: "Name",
        address: "Address"
      ),
      Zoo.create!(
        name: "Name",
        address: "Address"
      )
    ])
  end

  it "renders a list of zoos" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
  end
end
