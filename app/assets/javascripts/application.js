//= require rails-ujs
//= require turbolinks

window.scrollPosition = {x: 0, y: 0} // Our 'old' scroll position
window.lastHref = null // Our 'old' page href

// Before visit, simply store scroll position & url/href
document.addEventListener('turbolinks:before-visit', function () {
  window.scrollPosition = {x: window.scrollX, y: window.scrollY}
  window.lastHref = window.location.href
}, false)

// After load
document.addEventListener('turbolinks:load', function () {
  // If we have a scroll position AND we're on the same page
  if (window.scrollPosition && (this.location.href == window.lastHref)) {
    // Scroll to our previous position
    window.scrollTo(window.scrollPosition.x, window.scrollPosition.y)
  }
}, false)