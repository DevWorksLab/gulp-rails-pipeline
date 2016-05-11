$(document).ready(function(){

  // Check Boxes of Single Select Boxes
  $(":checkbox").click(function(){
    var boxes = $( "input[name=" + "'" + this.name + "'" + "]:checked" );
    $(boxes).prop('checked', false);
    $(this).prop('checked', true);
    // if ( $length.length > 2 ) {
    //   $(":checkbox:checked").attr("disabled", true);
    // } else {
    //   $(":checkbox").removeAttr("disabled");
    // }
  });
});
