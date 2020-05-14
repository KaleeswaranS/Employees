class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

add_flash_types :success, :warning, :dander, :info
end
