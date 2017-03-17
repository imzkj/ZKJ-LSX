/*
	Copyright (C) 2009 - 2012
	Email:		wangking717@qq.com
	WebSite:	Http://wangking717.javaeye.com/
	Author:		wangking
*/
$(function(){
	$("[name='easyTip']").each(function(){
		$(this).addClass("onShow");
	});
	$("[reg]").blur(function(){
		validate($(this));
		//console.log($this);
	});
	
	$("[reg]").click(function(){
		$(this).nextAll("[name='easyTip']").eq(0).removeClass();
		$(this).nextAll("[name='easyTip']").eq(0).addClass("onFocus");				   
	});
	
	//$("form").submit(function(){return false;});
	
	/*$("form").submit(function(){
		var isSubmit = true;
		$("[reg]").each(function(){
			if(!validate($(this))){
				isSubmit = false;
			}
		});
		return isSubmit;
	});*/
	
});

function validate(obj){
	var reg = new RegExp(obj.attr("reg"));
//	var objValue = obj.attr("value"); 1.9 要用 prop
	var objValue = obj.prop("value");
	var tipObj = obj.nextAll("[name='easyTip']").eq(0);
	tipObj.removeClass();
	if(!reg.test(objValue)){
		tipObj.addClass("onError");
		return false;
	}else{
					tipObj.addClass("onCorrect");
			return true;
		}
}

/*Frank 2013-9-12 17:16:37
 * 阻止from提交
 * 参数： true false
 */
/*function falseSubmit(sbool){
	console.log(sbool);
	if (sbool) {
		$("form").submit(function(){
	console.log(sbool);
			return false;
		});
	}else{
		$("form").submit(function(){
	console.log(sbool);
			return true;
		});
	}
}
*/