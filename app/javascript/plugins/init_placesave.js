const initPlacesave = () => {
    // const suggestions = document.getElementById('p-suggestions');
    const selection = document.getElementById('p-selection');
    const button = document.getElementById('places-select');
    if (button) {
      button.addEventListener("click", placeSelection );
    }

};

const placeSelection = () => {
    const selection = document.getElementById('p-selection');

    if (selection) {
        const selectedPlaces = selection.querySelectorAll('.swap');
        console.log(selectedPlaces);
        let arrayPlaces = []
        selectedPlaces.forEach((place) => {
            arrayPlaces.push(place.dataset.placeId);
        });
        let counter = 1
        let char = []
        const url = arrayPlaces.forEach((place) => {
            char.push(`location${counter}=${place}`)
            counter += 1
        })
        window.location.href = `${window.location.origin}/activities?${char.join('&')}`
      }
};

export { initPlacesave };
