# frozen_string_literal: true

class UploadDropzone::Component < ApplicationViewComponent
  option :allowed_file_types, default: proc { [ "image/*" ] }
  option :button_text, default: proc { "Upload Files" }
  option :field_name, default: proc { nil }
  option :update_url, default: proc { nil }
end
