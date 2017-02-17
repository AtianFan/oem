function removeDiv(){
	$("#videoDiv").remove();
	$("body").css("overflow","auto");
}
var video = {
	play:function(){
		var template = '<div id="videoDiv" style="position: absolute;left:0;top:0;width:100%;height:100%;z-index: 2000;background-color:rgba(0,0,0,255);">'+
		'<img id="closeBtn" onclick="removeDiv()" style="position:absolute;top:0;right:0;z-index:2001;" src="'+basePath+'newStyle/img/close.png"/>'+
		'<video id="playVideoId" src="'+basePath+'file/test.mp4" autoplay="autoplay" width="100%" '+
		'height="100%" style="position: absolute;left:0;top:0;" preload onClick="javaScript:playOrStop()" onkeydown="return onKeyListen(event)"></video></div>';
		$("body").append(template);
		document.getElementById("playVideoId").focus();
	}
};

function playOrStop(){
	var myVideo = document.getElementById("playVideoId");
	if (myVideo.paused){

		        myVideo.play();
		}
		    else{
		
		        myVideo.pause();
		}
}

function onKeyListen(e){
	if(e.keyCode == 32 && !window.event){// Netscape/Firefox/Opera
		var myVideo = document.getElementById("playVideoId");
		if (myVideo.paused){
		        myVideo.play();
			}
		    else{
			
		        myVideo.pause();
			}
		return false;
	}
}

