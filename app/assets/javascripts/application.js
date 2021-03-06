//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap/alert
//= require bootstrap.min

function dismissAlertAfterTime(timespan) {
  $('.alert').each(function(i, e) {
    if($(e).find('.close').length > 0) setTimeout(function() {
     $(e).alert('close');
    }, timespan);
  });
}

function insertAutoDismissAlert(notice_message) {
  $(notice_message).insertBefore(".container .content");
  dismissAlertAfterTime(2000);
}

dismissAlertAfterTime(3000);