require 'rails_helper'

RSpec.describe Car, type: :model do
it { should have_many(:rentals).dependent(:destroy) }
it { should belong_to(:user) }
it { should validate_presence_of(:brand) }
it { should validate_presence_of(:model) }
it { should validate_presence_of(:seats_number) }
it { should validate_presence_of(:transmision) }
it { should validate_presence_of(:mileage) }
it { should validate_presence_of(:image) }
it { should validate_presence_of(:price_for_day) }
it { should validate_presence_of(:bags_number) }
end
