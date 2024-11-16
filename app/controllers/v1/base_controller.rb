module V1
  class BaseController < ApplicationController
    layout "v1/layouts/application"

    skip_before_action :authenticate
    before_action :authenticate_without_redirect
    # prepend_view_path "app/views/app"
  end
end
