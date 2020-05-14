class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # protect_from_forgery with: :exception
  # before_action :authenticate_user!
end
