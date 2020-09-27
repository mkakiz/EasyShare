require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name, email, and password" do
    user = User.new(
      name: "user01",
      email: "user01@example.com",
      password: "123456",
    )
    expect(user).to be_valid
  end

  it "is invalid without name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    User.create(
      name: "user01",
      email: "user01@example.com",
      password: "123456",
    )
    user = User.new(
      name: "user01",
      email: "user01@example.com",
      password: "123456",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end

describe User do
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is invalid without name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "user01@example.com")
    user = FactoryBot.build(:user, email: "user01@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end



end
