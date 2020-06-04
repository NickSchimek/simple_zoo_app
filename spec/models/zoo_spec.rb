require 'rails_helper'

RSpec.describe Zoo, type: :model do
  it { is_expected.to have_many(:animals) }
end
