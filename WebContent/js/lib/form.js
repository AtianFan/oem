var Form = {
	addFileInput:function($form){
		var $iframe = $('<iframe id="iframe_{iframeId}" height="37px" src="uploadFile.jsp?id={iframeId}" frameborder=0></iframe>');
		$form.append($iframe);
		return $iframe;
	}
};