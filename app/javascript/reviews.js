// app/javascript/reviews.js

document.addEventListener('turbo:load', function() {
  console.log('Turbo loaded'); // Debugging: Verify the script is being executed

  const typeRadios = document.querySelectorAll('input[name="review[reviewable_type]"]');
  const itemSelect = document.getElementById('review_reviewable_id');

  typeRadios.forEach(radio => {
    radio.addEventListener('change', function() {
      fetchItems(this.value);
    });
  });

  function fetchItems(type) {
    fetch(`/reviews/get_items?type=${type}`)
      .then(response => response.json())
      .then(data => {
        itemSelect.innerHTML = '';
        data.forEach(item => {
          const option = document.createElement('option');
          option.value = item.id;
          option.textContent = item.name;
          itemSelect.appendChild(option);
        });
      })
      .catch(error => console.error('Error fetching items:', error));
  }

  document.querySelectorAll('.btn-edit').forEach(button => {
    console.log('Attaching event listener to button:', button); // Debugging: Confirm listeners are attached
    button.addEventListener('click', function (event) {
      event.preventDefault();
      const reviewId = this.dataset.reviewId;
      console.log('Edit button clicked, review ID:', reviewId); // Debugging: Confirm the click event is fired
      const form = document.getElementById(`edit_review_${reviewId}`);
      if (form) {
        form.classList.toggle('hidden-form');
        console.log('Toggled form visibility for review ID:', reviewId); // Debugging: Confirm the form is toggled
      } else {
        console.log('Form not found for review ID:', reviewId); // Debugging: Check if the form exists
      }
    });
  });
});
