require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:cars).dependent(:destroy) }
  it { should validate_presence_of(:username) }
end
