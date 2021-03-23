const initActivitysave = () => {
    // const suggestions = document.getElementById('p-suggestions');
    const selection = document.getElementById('a-selection');
    const button = document.getElementById('activities-select');
    if (button) {
      button.addEventListener("click", activitySelection );
    }

};

const activitySelection = () => {
    const selection = document.getElementById('a-selection');

    if (selection) {
        const selectedActivities = selection.querySelectorAll('.swap');
        console.log(selectedActivities);
        let arrayActivities = []
        selectedActivities.forEach((activity) => {
            arrayActivities.push(activity.dataset.activitiesId);
        });
        let counter = 1
        let char = []
        const url = arrayActivities.forEach((activity) => {
            char.push(`activity${counter}=${activity}`)
            counter += 1
        })
        window.location.href = `${window.location.origin}/roadbook?${char.join('&')}`
      }
};

export { initActivitysave };
