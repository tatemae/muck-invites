jQuery(document).ready(function() {
	apply_invite_methods();
});

function apply_invite_methods(){
	setup_invite_submit();
	hide_invite_boxes();
	apply_invite_hover();
	apply_activity_hover();
	jQuery('.activity-no-invites').hide();
	
	jQuery('.activity-has-invites').find('textarea').click(function(){
		show_invite_box(this);
	});
	jQuery('.activity-has-invites').find('textarea').blur(function(){
		textarea = jQuery(this);
		if (textarea.val() == ''){
			hide_invite_boxes();
		}
	});
	
	jQuery(".make-invite").unbind();
	jQuery('.make-invite').click(function(){
		var id = this.id.replace('make_invite_activity_', '');
		var invite_box = jQuery('#invite_activity_' + id);
		invite_box.find('textarea').removeClass('min');
		invite_box.find('textarea').addClass('max');
		invite_box.show();
		invite_box.find('textarea').get(0).focus();
		invite_box.find('textarea').blur(function(){
			if (jQuery(this).val() == ''){
				jQuery(this).closest('.activity-invite').hide();
			}
		});
		return false;
	});
}

function setup_invite_submit(){
	jQuery(".invite-submit").unbind();
	jQuery(".invite-submit").click(function() {
    jQuery(this).hide();
		jQuery(this).parents('.invite-form-wrapper').siblings('.actor-icon').hide();
		jQuery(this).siblings('textarea').hide();
		jQuery(this).parent().append('<p class="invite-loading"><img src="/images/spinner.gif" alt="loading..." /> ' + ADD_COMMENT_MESSAGE + '</p>');
		var form = jQuery(this).parents('form');
    jQuery.post(form.attr('action'), form.serialize() + '&format=json',
      function(data){
        var json = eval('(' + data + ')');
        if(!json.success){
          jQuery.jGrowl.info(json.message);
        } else {
					jQuery('.invite-loading').remove();
					jQuery('.activity-has-invites').find('textarea').show();
					var invite_box = jQuery('#invite_activity_' + json.parent_id);
					invite_box.before(json.html);
					invite_box.removeClass('activity-no-invites');
					invite_box.addClass('activity-has-invites');
					invite_box.find('textarea').show();
					apply_invite_methods();
				}
      });
    return false;
  });
}

function hide_invite_boxes(){
	jQuery('.activity-has-invites').children('.actor-icon').hide();
	jQuery('.activity-has-invites').find('.button').hide();
	jQuery('.activity-has-invites').find('textarea').val(COMMENT_PROMPT);
	jQuery('.activity-has-invites').find('textarea').addClass('min');
}

function show_invite_box(obj){
	textarea = jQuery(obj);
	textarea.addClass('max');
	textarea.removeClass('min');
	textarea.closest('.invite-form-wrapper').siblings('.actor-icon').show();
	textarea.siblings('.button').show();
	if (textarea.val() == COMMENT_PROMPT) {
		textarea.val('');
	}
}

function get_latest_activity_id(){
  var activities = jQuery('#activity-feed-content').children('.activity');
  if(activities.length > 0){
    return activities[0].id.replace('activity_', '');
  } else {
    return '';
  }
}

function update_feed(request){
  jQuery('#activity-feed-content').prepend(request);
}

function apply_activity_hover(){
	jQuery('.activity-content').hover(
     function () { jQuery(this).addClass('activity-hover'); }, 
     function () { jQuery(this).removeClass('activity-hover'); } );
}

function apply_invite_hover(){
	jQuery('.activity-invite').hover(
     function () { jQuery(this).addClass('invite-hover'); }, 
     function () { jQuery(this).removeClass('invite-hover'); } );
}