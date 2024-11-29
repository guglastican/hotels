module V1
  module Dashboard
    class ImagesController < DashboardController
      def create_from_file
        @image = Image.new(
          file: params.dig(:image, :file),
          organization_id: params[:organization_id],
          subject_id: params[:subject_id],
          subject_type: params[:subject_type],
        )
        authorize @image, :create?

        respond_to do |format|
          if @image.save
            format.turbo_stream do
              turbo_actions = [
                turbo_stream.action(:append, "toast_container") {
                  ::Toast::Component.new(notice: "Image was successfully created.").render_in(view_context)
                },
                turbo_stream.action(:append, "images") {
                  ::Dashboard::ImageThumb::Component.new(image: @image).render_in(view_context)
                }
              ]

              render turbo_stream: turbo_actions
            end
          end
        end
      end
    end
  end
end
