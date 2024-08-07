// app/javascript/reviews.js

document.addEventListener('turbo:load', function() {
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
});
