import Sortable from 'sortablejs/modular/sortable.complete.esm.js';

const initSortable = () => {
  const suggestions = document.getElementById('p-suggestions');
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
  });
};

export { initSortable };