require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/new (#new)" do
    it "renders the new template" do
      get new_user_url
      expect(response.body).to include("Sign Up!")
    end
  end


  describe "POST /users (#create)" do
    context "with invalid params" do
      it "validates the presence of the user's email" do
        post users_url, params: { user: {password: "123456"}}
        expect(response.body).to include('New User')
        # expect(response.body).to include('Email must be present')
      end

      it "validates that the password is at least 6 characters long" do
        post users_url, params: { user: {email: "newuser@email.com", password: "12345"}}
        expect(response.body).to include('New User')
        # expect(response.body).to include('Password must be at least 6 characters long')
      end
    end

    context "with valid params" do
      it "redirects user to root page on success" do
        post users_url, params: { user: {email: "newuser@email.com", password: "123456"}}
        expect(response).to redirect_to(root_url)
      end
    end
  end
end