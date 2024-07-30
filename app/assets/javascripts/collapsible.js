document.addEventListener('DOMContentLoaded', () => {
  console.log("Collapsible script loaded."); // Debug message
  const collapsibleHeaders = document.querySelectorAll('.collapsible-header');

  collapsibleHeaders.forEach(header => {
    console.log("Attaching event listener to:", header); // Debug message
    header.addEventListener('click', () => {
      console.log("Header clicked:", header); // Debug message
      const content = header.nextElementSibling;
      if (content) {
        content.classList.toggle('hidden');
        header.classList.toggle('active');
      } else {
        console.warn("No content found for header:", header); // Warning message
      }
    });
  });
});
