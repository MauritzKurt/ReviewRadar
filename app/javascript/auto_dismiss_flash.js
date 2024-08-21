function setupAutoDismiss() {
  const alerts = document.querySelectorAll('.alert-dismissible');
  alerts.forEach(alert => {
    $(alert).delay(500).fadeTo(2500, 0, function() {
      $(this).slideUp(500, function() {
        $(this).remove();
      });
    });
  });
}

// Make the function globally accessible
window.setupAutoDismiss = setupAutoDismiss;

// Initial setup on page load
document.addEventListener('turbo:load', setupAutoDismiss);

// Handle Turbo Stream updates specifically
document.addEventListener('turbo:frame-render', setupAutoDismiss);
