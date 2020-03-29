require 'rails_helper'

RSpec.describe User, type: :model do
  it "is vaild with name" do
    user = User.new(name: 'taro')
    expect(user).to be_valid
  end
end
