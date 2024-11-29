import { Application } from "@hotwired/stimulus"

Turbo.StreamActions.redirect = function () {
  Turbo.visit(this.target)
}

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// ViewComponents in app/views/components
import viewComponentControllers from "./../../views/components/**/controller.js"

viewComponentControllers.forEach((controller) => {
  const { name, module } = controller
  
  // Tidy up controller name
  // ..--..--views--components--video-reviewer--controller.js => video-reviewer
  const controllerName = name
    .replaceAll('..--..--views--components--', '')
    .replaceAll('--controller.js', '')
  
  application.register(controllerName, module.default)
})

export { application }
