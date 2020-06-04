require 'rails_helper'

RSpec.describe Animal, type: :model do
  it { is_expected.to belong_to(:zoo) }
end
