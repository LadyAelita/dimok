$(document).ready(function () {
	// Enable Bootstrap tooltips
	$('[data-toggle="tooltip"]').tooltip();

	// Disable navigation hack
	// TODO: Make this into a plugin so that it's done during the build instead
	let tocSelector = $('disableToc');
	if (tocSelector.length > 0) {
		$('disableToc').remove();
		$('div.col-md-3').remove();
		$('div.col-md-9').attr('class', 'class-md-12');
	}
});
