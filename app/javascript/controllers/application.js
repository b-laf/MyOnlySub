import { Application } from "@hotwired/stimulus"
// # pour sortable
import Sortable from 'stimulus-sortable'
import ContentLoader from 'stimulus-content-loader'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application


// # pour sortable
application.register('sortable', Sortable)


//pour loader
application.register('content-loader', ContentLoader)

export { application }
