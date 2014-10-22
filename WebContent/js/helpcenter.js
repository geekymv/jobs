$(function(){    
    /*public*/
    (function(){
        var windowHeight=$(window).height();
        var containerHeight=$("#container").height();
        if(windowHeight-containerHeight>380){
            $("#container").css("min-height",windowHeight-380);
        }
    })();    
	$("li>h5",".foldList").bind("click",function(){
	    var li=$(this).parent();
		if(li.hasClass("fold")){
			li.removeClass("fold");
			$(this).find("b").removeClass("UI-bubble").addClass("UI-ask");
			li.find(".foldContent").slideDown();
		}else{
			li.addClass("fold");
			$(this).find("b").removeClass("UI-ask").addClass("UI-bubble");
			li.find(".foldContent").slideUp();
		}
	})   
})