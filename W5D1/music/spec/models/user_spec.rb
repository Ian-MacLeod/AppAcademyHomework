require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it do
    should validate_length_of(:password)
      .is_at_least(6)
  end

  EMAIL = "abc".freeze
  PASSWORD = "password".freeze
  WRONG_PASSWORD = "password2".freeze

  subject { User.new(email: EMAIL, password: PASSWORD) }
  describe "#is_passsword?" do
    it "returns true if password matches" do
      expect(subject.is_password?(PASSWORD)).to be(true)
    end

    it "returns false if password doesn't match" do
      expect(subject.is_password?(WRONG_PASSWORD)).to be(false)
    end
  end

  describe "#reset_session_token!" do
    it "changes the session_token" do
      initial_token = subject.session_token
      subject.reset_session_token!
      expect(subject.session_token).not_to eq(initial_token)
    end
  end

  describe "::find_by_credentials" do
    it "returns the user when the password is correct" do
      subject.save
      user = User.find_by_credentials(EMAIL, PASSWORD)
      expect(subject.id).to eq(user.id)
    end

    it "returns nil when the password is wrong" do
      subject.save
      user = User.find_by_credentials(EMAIL, WRONG_PASSWORD)
      expect(user).to be(nil)
    end
  end
end
