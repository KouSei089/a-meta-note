// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@fortawesome/fontawesome-free"
import jquery from "jquery"
window.$ = jquery

$(function() {
  console.log("Hello Rails7!");
})
