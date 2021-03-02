$(document).on('ready turbolinks:load', function() {

    $('#tracker_id').on('keyup', function () {
        let trk_id = $(this).val();
        let button = $('#punch_button')
        $.ajax({
            method: 'GET',
            url: '/workers/track_user',
            data: { tracker_id: trk_id },
            dataType: 'json',
            success: function (response) {
                console.log(response.success)
              if(response.success){
                  button.val('Punch Out')
              }
              else{
                  if(button.val() === 'Punch Out'){
                      button.val('Punch In')
                  }
              }
            },
            error: function () {
                $('#flash_msg').html('Server error occurred. Please refresh the page.')
            },
        })
    });


});
