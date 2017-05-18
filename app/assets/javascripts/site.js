$(document).on('turbolinks:load', function(){
  $('.rating').raty( { path: '/images', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/images',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
  $('.img-zoom').elevateZoom();
});
