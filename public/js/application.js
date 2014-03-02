$(document).ready(function() {
  
  //Add photos to album
  $('.photo').on('click', function(event){
  	event.preventDefault();

  	$(this).toggleClass('add-to-album');
  });


  $('#album-edit').on('submit', function(event){
			event.preventDefault();

			var url = $(this).attr('action');
			var photos = $('.add-to-album').toArray()
			// var data = {
			// 	photos: photos
			// 	// photos: $(this).serialize()
			// }

			console.log(photos)
			// $.post(url, photos);
			// console.log(url)
			
	});
});
