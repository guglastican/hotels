import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'
import { put } from '@rails/request.js'

export default class extends Controller {
  static values = {
    updateUrl: String,
  }

  connect(){
    this.sortable = Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this),
    })
  }

  async onEnd(e){
    await this.sortComplete(this.sortable.toArray())
  }

  async sortComplete(sortedIds){
    if (this.hasUpdateUrlValue){
      await put(this.updateUrlValue, {
        contentType: 'application/json',
        body: JSON.stringify({
          sorted_ids: sortedIds,
        }),
        responseKind: 'turbo-stream',
      })
    }
  }
}
