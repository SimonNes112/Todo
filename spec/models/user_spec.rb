require 'rails_helper'

describe User do

    it 'user has a email' do
        user = User.new(email: "test@email.com")
        user.valid?

        puts user.errors.inspect

        expect(user.errors.key?(:email)).to be_falsey
    end

    it 'user has not a email' do
        user = User.new(email: "")
        user.valid?

        puts user.errors.inspect

        expect(user.errors.key?(:email)).to be_truthy
    end

    it 'user has a password' do
        user = User.new(password: "test1234")
        user.valid?

        puts user.errors.inspect

        expect(user.errors.key?(:password)).to be_falsey
    end

    it 'user has not a password' do
        user = User.new(password: "")
        user.valid?

        puts user.errors.inspect

        expect(user.errors.key?(:password)).to be_truthy
    end

    it 'password doesn`t have 6 characters' do
        user = FactoryBot.build(:user, password: "a" * 2)
        user.valid?

        puts user.errors.inspect

     #   expect(user.valid?).to be_falsey
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)") 
    end

    it 'password has 6 characters' do
        user = FactoryBot.build(:user, password: "a" * 6)
        user.valid?

        puts user.errors.inspect

     #   expect(user.valid?).to be_falsey
        expect(user.errors.key?(:password)).to be_falsey
    end

end