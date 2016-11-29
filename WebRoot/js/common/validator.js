//匹配非负整数（正整数 + 0）
jQuery.validator.addMethod("isInt", function(value, element) {
	 var regex = /^[1-9]\d*|0$/;
	 return this.optional(element)||(regex.test(value));}, "请输入非负整数");
// 手机号码验证规则
jQuery.validator.addMethod("isMobile", function(value, element) {
	 var regex = /^1\d{10}$/;
	 return this.optional(element)||(regex.test(value));}, "手机号格式不正确");
// 身份证验证规则
jQuery.validator.addMethod("isRealCert", function(value, element) {
	 var regex = /^(\d{15}|\d{17}[\dXx])$/;
	 return this.optional(element)||(regex.test(value));}, "身份证号格式不正确,请重新输入");
// 验证金额 
jQuery.validator.addMethod("isMoney", function(value, element) {
	 var regex = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
	 return this.optional(element)||(regex.test(value));}, "您输入的金额格式不正确");
jQuery.validator.addMethod("isTxnPwd", function(value, element) {
	var regex = /^\d{6}$/;
	return this.optional(element) || (regex.test(value));}, "交易密码格式不正确，应为6位数字");
jQuery.validator.addMethod("isVerCode", function(value, element){
	var tel = /^[0-9]{6}$/;
	return this.optional(element) || (tel.test(value));}, "验证码格式不正确");
jQuery.validator.addMethod("isPayVerCode", function(value, element){
	var tel = /^[0-9]{1,6}$/;
	return this.optional(element) || (tel.test(value));}, "验证码不匹配");
//登陆密码验证规则
jQuery.validator.addMethod("isLoginPwd", function(value, element){
	var tel = /^.{6,20}$/;
	return this.optional(element) || (tel.test(value));}, "密码格式不正确");

$.validator.setDefaults({
    errorPlacement:function(error, element) {
    },
    onkeyup: false,
    onfocusout:false,
    focusInvalid: false
});


function formValidator(formId,submitCallback,showErrorCallback){
	var valid = $("#" + formId).validate({
		focusCleanup:true,
		focusInvalid:false,
		// suc方法
		success : function(label) {
		},
		ignore:".ignore",
		// 替换位置
		// 成功校验回调函数
		submitHandler : submitCallback,
		invalidHandler: function(form, validator) {
	        $.each(validator.invalid,function(key,value){
	        	showErrorCallback(value,key);
	            return false;
	        });
	    }
	});
	return valid;
}