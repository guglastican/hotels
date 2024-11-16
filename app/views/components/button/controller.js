import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  abortController = undefined

  // connect(){
  //   this.resetOrStartAbortController()

  //   // Request
  //   document.addEventListener("turbo:before-fetch-request",
  //     (e) => {
  //       this.disableButtton()
  //     },
  //     {
  //       signal: this.abortController.signal,
  //     },
  //   )

  //   // Response
  //   document.addEventListener("turbo:before-fetch-response",
  //     (e) => {
  //       this.enableButton()
  //     },
  //     {
  //       signal: this.abortController.signal,
  //     },
  //   )
  // }

  disconnect(){
    if (this.abortController){
      this.abortController.abort('Disconnected')
    }
  }

  resetOrStartAbortController(){
    if(this.abortController){
      delete this.abortController;
    }

    this.abortController = new AbortController();
  }

  disableButtton() {
    this.element.disabled = true;
    this.element.dataset.loading = true;
  }
  
  enableButton() {
    this.element.disabled = false;
    this.element.dataset.loading = false;
  }
}
