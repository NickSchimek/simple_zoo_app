require 'rails_helper'

RSpec.describe "animals/index", type: :view do
  let(:zoo) { FactoryBot.create(:zoo) }

  before(:each) do
    assign(:animals, [
      Animal.create!(
        name: "Name",
        bio: "Bio",
        zoo: zoo
      ),
      Animal.create!(name: "Name",bio: "Bio",zoo: zoo)
    ])
    @zoo = zoo
  end

  it "renders a list of animals" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Bio".to_s, count: 2
  end
end
