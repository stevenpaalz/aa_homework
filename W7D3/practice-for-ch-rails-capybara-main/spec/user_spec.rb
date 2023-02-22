require 'rails_helper'

RSpec.describe User, type: :model do
    subject(:testuser) { User.create(email: 'Test', password: '123456')}

    describe 'validations' do
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:password_digest) }
        it { should validate_length_of(:password)}
    end

    describe '#is_password?' do
        
        it 'should return true when the password is correct' do
            expect(testuser.is_password?('123456')).to eq(true)
        end
        it 'should return false when the password is incorrect' do
            expect(testuser.is_password?('abcdef')).to eq(false)
        end
    end

    describe '#reset_session_token' do
        it "should alter the current session token saved in the database" do
            current_token = testuser.session_token
            testuser.reset_session_token!
            expect(testuser.session_token).to_not eq(current_token)
        end
        it "should return the user's new session token" do
            expect(testuser.reset_session_token!).to eq(testuser.session_token)
        end
    end

    describe 'User::find_by_credentials' do
        # it "should find the user based on the given credentials" do
        #     expect(User.find_by_credentials('Test','123456')).to be(testuser)
        # end
        it "should return nil when the user is not in the database" do
            expect(User.find_by_credentials('Nottest','123456')).to be(nil)
        end
    end
end

