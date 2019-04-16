# frozen_string_literal: true

class CustomFailure < Devise::FailureApp
  def redirect_url
    home_index_url
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
