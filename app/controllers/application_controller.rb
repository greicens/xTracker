class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include EntriesHelper
  include EntriesSearchHelper
  include ReportsHelper
  def require_login
      if !current_user
        redirect_to login_path
      end
    end
end
