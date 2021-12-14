require 'rails_helper'

RSpec.describe Rental, type: :model do
it { should belong_to(:user) }
it { should belong_to(:car) }
it { should validate_presence_of(:start_date) }
it { should validate_presence_of(:end_date) }
it { should validate_presence_of(:user_id) }
it { should validate_presence_of(:car_id) }
it { should validate_presence_of(:city) }
end
