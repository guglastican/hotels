import { Controller } from "@hotwired/stimulus";
import Uppy from '@uppy/core';
import Dashboard from '@uppy/dashboard';
import { post } from '@rails/request.js'

import '@uppy/core/dist/style.min';
import '@uppy/dashboard/dist/style.min.css';

import ActiveStorageUpload from "../../../javascript/utils/uppy-activestorage-uploader";
import './styles.css'

export default class extends Controller {
  static targets = ["dashboardTrigger"];
  static values = {
    allowedFileTypes: Array,
    directUploadUrl: String,
    fieldName: String,
    updateUrl: String,
  }

  uppy = undefined

  connect() {
    this.uppy = new Uppy({
      allowMultipleUploads: true,
      autoProceed: false,
      // logger: this.debugLogger,
      restrictions: {
        allowedFileTypes: this.allowedFileTypesValue,
      },
    })
      .use(ActiveStorageUpload, {
        directUploadUrl: this.directUploadUrlValue,
      })
      .use(Dashboard, {
        target: this.element,
        theme: document.documentElement.classList.contains('dark') ? 'dark' : 'light',
        trigger: this.dashboardTriggerTarget,
      })
      .on('upload-success', this.uploadSuccess.bind(this))
  }

  disconnect(){
    if (this.uppy){
      this.uppy = undefined
    }
  }

  async uploadSuccess(file, response){
    const { signed_id } = response

    const formData = new FormData()
    formData.append(this.fieldNameValue, signed_id)

    await post(this.updateUrlValue, {
      body: formData,
      responseKind: 'turbo-stream',
    })
  }

  get debugLogger() {
    return {
      debug: (...args) => console.debug(`[Uppy]`, ...args),
      warn: (...args) => console.warn(`[Uppy]`, ...args),
      error: (...args) => console.error(`[Uppy]`, ...args),
    }
  }
}
