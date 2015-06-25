class ApplicationController < ActionController::Base
  before_filter :skip_devise_timeout, only: [:simulate_regular_401]
  before_filter :sign_in_user, only: [:index]
  before_filter :authenticate_user!, only: [:index, :simulate_devise_timeout]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  end

  def simulate_devise_timeout
    render nothing: true, status: 200
  end

  def simulate_regular_401
    render nothing: true, status: 401
  end

  private

  def sign_in_user
    user = User.first || User.create!(email: "e@mail.com", password: "1" * 8)
    sign_in(user)
  end

  def skip_devise_timeout
    request.env["devise.skip_timeout"] = true
  end
end
