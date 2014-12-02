class HomeController < ApplicationController
  layout false
  skip_before_filter :authenticate_user!
end
