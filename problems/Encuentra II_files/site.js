﻿$(document).ready(function(){if($(".messageLink").click(function(n){n.preventDefault();$("#btn-reply").attr("href",$(this).attr("data-replylink"));$.ajax({url:this.href,type:"GET",success:function(n){$("#message-label").html("Message from "+n.USER1+" to "+n.USER2);$("#message-body").html(n.BODY);$("#messageModal").modal()},error:function(n){alert(n)}})}),$(".deleteLink").click(function(n){n.preventDefault();$("#deleteFormModal")[0].action=this.href;$("#deleteModal").modal()}),$(".time")){var t=$(".time").attr("data-d"),i=$(".time").attr("data-h"),r=$(".time").attr("data-m"),u=$(".time").attr("data-s"),f=$(".time").attr("data-total"),e=t*86400+i*3600+r*60+u*1;function o(){e=e-1;u=u-1;u<0&&(u=59,r=r-1);r<0&&(r=59,i=i-1);i<0&&(i=23,t=t-1);n="";t<0?($(".time").hide(),$("#timebanner").hide(),$("#label").html("Ended"),clearTimeout(o)):(n=t==1?"1 day":t>0?t+" days":(i<10?"0":"")+i+":"+(r<10?"0":"")+r+":"+(u<10?"0":"")+u,$(".time").html(n),percent=0,long=$("#timebanner").width(),f>0&&(percent=(f-e)/f*long),$("#bartime")&&$("#bartime").css("width",percent),$("#timebanner").show(1),setTimeout(o,1e3))}o()}$(".user-autocomplete").typeahead({source:function(n,t){$.ajax({url:$(".user-autocomplete").attr("data-url"),data:{q:n},type:"GET",dataType:"html",success:function(n){n=$.parseJSON(n);t(n)}})}});$(".problem-autocomplete").typeahead({source:function(n,t){$.ajax({url:$(".problem-autocomplete").attr("data-url"),data:{q:n},type:"GET",dataType:"html",success:function(n){n=$.parseJSON(n);t(n)}})}})});
/*
//# sourceMappingURL=site.min.js.map
*/