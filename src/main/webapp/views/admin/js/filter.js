const options = document.querySelectorAll('.option-filter'),
  itemsFilter = document.querySelectorAll('.filter-item');

  options.forEach((option, i) => {
    option.addEventListener('click', () => {
      // remove class active 
      options.forEach(option => {
        option.classList.remove('option--active');
      });
      // add class active
      option.classList.add('option--active');
      
      let dataFilter = option.getAttribute('data-filter');  
      itemsFilter.forEach(item => {
        item.classList.add('hidden');
        if((item.getAttribute('data-tag') === dataFilter) || (dataFilter === 'all')) {
          item.classList.remove('hidden');
        }
      });

    });
  });
