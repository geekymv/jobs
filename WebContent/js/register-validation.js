$(function() {
	$(".form-horizontal").validate({

		errorElement : "em", // 用来创建错误提示信息标签
		success : function(label) { // label指向上面那个错误信息标签em
			label.text(" ") // 清空错误提示信息
			.addClass("success");// 加上自定义的success类
		},
		rules : {
			number : {
				required : true,
				minlength : 8,
				maxlength : 8
			},
			password : {
				required : true,
				minlength : 3,
				maxlength : 20,
			},
			repassword : {
				required : true,
				equalTo : "#password"
			},
			name : {
				required : true
			},
			mobile : {
				required : true
			},
			college : {
				required : true
			},
			profession : {
				required : true
			}
		},
		messages : {
			number : {
				required : "请输入学号(8位数字)",
				minlength : "学号只能是8位数字",
				maxlength : "学号只能是8位数字"
			},
			password : {
				required : "请输入密码",
				minlength : $.validator.format("密码的长度不能小于{0}"),
				maxlength : "密码的长度不能大于20"
			},
			repassword : {
				required : "请输入确认密码",
				equalTo : "两次输入密码不一致"
			},
			name : {
				required : "请输入姓名",
			},
			mobile : {
				required : "请输入手机号码"
			},
			college : {
				required : "请输入学院名称"
			},
			profession : {
				required : "请输入专业名称"
			}

		}
	});
});