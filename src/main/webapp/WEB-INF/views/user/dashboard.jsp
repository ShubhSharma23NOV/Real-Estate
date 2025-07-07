// Initialize favorite buttons
document.addEventListener('DOMContentLoaded', function() {
    const favoriteButtons = document.querySelectorAll('.property-fav');
    favoriteButtons.forEach(button => {
        button.addEventListener('click', function() {
            const propertyCard = this.closest('.property-card');
            const propertyId = propertyCard.getAttribute('data-property-id');
            const isFavorited = this.classList.contains('favorited');
            const newFavStatus = !isFavorited;

            const fetchUrl = `/user/property/${propertyId}/favorite`;
            console.log('Favorite AJAX:', { propertyId, fetchUrl, newFavStatus });

            fetch(fetchUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest'
                },
                body: JSON.stringify({ fav: newFavStatus })
            })
            .then(response => {
                if (response.ok) {
                    // Toggle the heart icon visually
                    this.classList.toggle('favorited', newFavStatus);
                    const icon = this.querySelector('i');
                    if (newFavStatus) {
                        icon.classList.remove('far');
                        icon.classList.add('fas');
                    } else {
                        icon.classList.remove('fas');
                        icon.classList.add('far');
                    }
                } else {
                    alert('Failed to update favorite status.');
                }
            })
            .catch(() => alert('Failed to update favorite status.'));
        });
    });
}); 