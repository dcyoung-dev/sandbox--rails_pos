// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Stimulus
import 'controllers'

// Bootstrap
import * as bootstrap from 'bootstrap'

window.Rails = require('@rails/ujs')
require('@hotwired/turbo-rails')
require('@rails/activestorage').start()
require('channels')
// require("trix")
// require("@rails/actiontext")
require('local-time').start()

// Start Rails UJS
window.Rails.start()

document.addEventListener('turbo:load', () => {
  const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })

  const popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })
})
