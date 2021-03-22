import Sortable from 'sortablejs';

const initSortableActivities = () => {
  const a_suggestions = document.getElementById('a-suggestions');
  if (a_suggestions) {
    console.log("Sortable sur les activités")
    Sortable.create(a_suggestions, {
      group: "activities",
      // swap: true,
      // swapClass: '.swap'
    });
    const a_selection = document.getElementById('a-selection');
    Sortable.create(a_selection, {
      group: "activities",
    });}
};

export { initSortableActivities };
