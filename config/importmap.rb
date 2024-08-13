# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin '@rails/ujs', to: '@rails--ujs.js' # @7.0.8
pin 'jquery' # @3.7.1

# custom
pin 'reviews', to: 'reviews.js'
pin "auto_dismiss_flash", to: "auto_dismiss_flash.js"
