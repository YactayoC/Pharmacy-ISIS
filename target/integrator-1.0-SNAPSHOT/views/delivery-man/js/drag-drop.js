/* ========== Drag adn drop ========== */
const dropItems = document.querySelector('#drop-items');

new Sortable(dropItems, {
  animation: 350,
});