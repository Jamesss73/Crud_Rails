// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//= require rails-ujs
//= require turbolinks
//= require_tree .

//NO funciona la parte de la notificacion pora cuando se elimina y se edita el elemento
document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const deleted = urlParams.get('deleted');
  
    if (deleted) {
      Toastify({
        text: "Producto eliminado correctamente",
        duration: 3000, // Duración en milisegundos
        gravity: "top", // Posición de la notificación (top, bottom, left, right)
        backgroundColor: "#5cb85c", // Color de fondo
        stopOnFocus: true // Detener la notificación cuando el usuario haga clic en ella
      }).showToast();
    }
  });
  
  