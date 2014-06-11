module Zangetsu
  module Devise
    module PermitUsernameAndLoginParameters
      # extends ................................................................

      extend ActiveSupport::Concern

      # includes ...............................................................
      # constants ..............................................................
      # additional config ......................................................

      included do
        before_filter :configure_permitted_parameters
      end

      # class methods ..........................................................
      # helper methods .........................................................
      # protected instance methods .............................................

      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
      end

      # private instance methods ...............................................
    end
  end
end

require Rails.root.join(*%w(config initializers devise))
DeviseController.send :include, Zangetsu::Devise::PermitUsernameAndLoginParameters
