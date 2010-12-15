(function(){

	if(!window.HPS) {window.HPS = {}} //Create Namespace

	//Opens all hrefs with rel="external" attribute in separate window - target=_blank doesn't validate
	window.HPS.externalLinks = function(){		
		if (!document.getElementsByTagName) { 
			return; 
		}
		var anchors = document.getElementsByTagName("a");
		for (var i=0; i<anchors.length; i++) {
			var anchor = anchors[i];
			if (anchor.getAttribute("href") && anchor.getAttribute("rel") == "external") {
				anchor.target = "_blank";
			}
		} 
	}
	
	window.HPS.showComponentsModal = function(){
		$('#dialog').jqm({ajax:'@href',  trigger: 'a.showDialog'});
		$('#dialog').jqm();
	}
	
	window.HPS.Form = {
	  focus:function(){
	    $('#user_email').focus();
	  },
	  hilite:function(){
	    $('.input').focus(function(){
	      $(this).parent().addClass('hilite');  
	    });
	    $('.input').blur(function(){
        $(this).parent().removeClass('hilite');
	    });
	  },
	  validate:function(){
      $('#new_user').validate({
           rules: {
             'user[email]': {
               required: true,
               email: true,
               remote: {
                 url: '/check_email',
                 type: 'post',
                 data: {
                   username: function(){
                     return $('#user_email').val();
                   }
                 }
               }
             },
             'user[password]': {
               required: true,
               minlength: 6
             },
             'user[password_confirmation]': {
               required: true,
               equalTo: "#user_password"
             }
           },
           messages: {
             'user[email]': {
               required: "Please enter your email address",
               email: "Please enter a valid email address",
               remote: "That email address is already being used"
             },
             'user[password]': {
               required: "Please provide a password",
               minLength: "Your password must be at least 5 characters long"
             },
             'user[password_confirmation]': {
               required: "Confirm your password",
               equalTo: "Please enter the same password as above"
             }
           }
      });
	  }
	}
	
	window.HPS.createTrendsChart = function(){
    $.jqplot('chartdiv',  [[[1, 2],[3,5.12],[5,13.1],[7,33.6],[9,85.9],[11,719.9]]],
    { title:'Average Load Time',
      series:[{color:'#FA2'}]
    });
	}
	
	
})();
		
$(document).ready (function() {
	window.HPS.externalLinks();
	window.HPS.showComponentsModal();
	window.HPS.Form.hilite();
	window.HPS.Form.focus();
  window.HPS.Form.validate();
  window.HPS.createTrendsChart();
});