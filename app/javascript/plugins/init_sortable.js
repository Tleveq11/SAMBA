import Sortable from 'sortablejs';

const initSortable = () => {
  const suggestions = document.getElementById('p-suggestions');
  if (suggestions) {
    console.log("Sortable sur les emplacements")
    Sortable.create(suggestions, {
      group: "places",
      // swap: true,
      // swapClass: '.swap'
    });
    const selection = document.getElementById('p-selection');
    Sortable.create(selection, {
      group: "places",
      filter: ".first",
      filter: ".empty",
      swap: true,
      swapClass: 'swap'
    });}
};

export { initSortable };
