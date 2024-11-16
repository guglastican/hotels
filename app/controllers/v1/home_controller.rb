module V1
  class HomeController < BaseController
    skip_before_action :authenticate

    def index
    end
  end
end