// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require_tree .
import { Turbo } from "@hotwired/turbo-rails"
import "controllers"

Turbo.session.drive = false

import jquery from "jquery";
window.jQuery = jquery;
window.$ = jquery;
import Rails from "@rails/ujs"
Rails.start();
import "@hotwired/turbo-rails"
