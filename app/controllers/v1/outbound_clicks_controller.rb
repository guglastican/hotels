module V1
  class OutboundClicksController < BaseController
    def track_click
      @outbound_click = OutboundClick.create(
        organization_id: params[:organization_id],
        subject_id: params[:subject_id],
        subject_type: params[:subject_type],
        url: params[:url],
      )

      redirect_to params[:url], allow_other_host: true
    end
  end
end
