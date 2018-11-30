<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="position:relative;width:930px;">
<div id="objDivScrollBanner" style="position:absolute;top:250px;left:937px;width:32px;height:239px">
<!-- TV-CM노출 --><div><a href="/shop/collection-template/collection_templateTypeF.jsp?shop_id=2008102978"><img src="http://image.cjmall.com/new2008/main/floting_1023_kbcard.gif"></a></div>
</div>
</div>
<script language="javascript">
// 퀵메뉴  위치 및 움직임
var quick = null;
var y_quick = 0;
var time_id = null;
var cnt_move = 0;

function moveSmooth()
{
 clearInterval( time_id );
 cnt_move = 50;
 time_id = setInterval( moveSmoothDetail , 10 );
}

function moveSmoothDetail()
{
 if ( cnt_move <= 0 )
 {
  clearInterval( time_id );
  time_id = null;
  cnt_move = 0;
  return;
 }
 
 quick.style.top = ( parseInt( quick.style.top , 10 ) + ( y_quick - parseInt( quick.style.top , 10 ) ) / 10 ) + "px";
 cnt_move--;
}

function initPos(top_pos)
{
 quick.style.top = top_pos + "px";
}

function keepQuickPosition(obj_div, top_pos)
{
 quick = document.getElementById(obj_div); 

    var scroll_top = 0;

 if ( document.getElementById("miniCartBody") != null ) 
  scroll_top = document.getElementById("miniCartBody").scrollTop;
 else
  scroll_top = document.body.scrollTop > 0 ? document.body.scrollTop : document.documentElement.scrollTop;

 window.status = y_quick + "/" + scroll_top;

 if ( y_quick != parseInt( scroll_top , 10 ) + top_pos )
 {      
  moveSmooth();    
 }
 
 y_quick = parseInt( scroll_top , 10 ) + top_pos ;
}

function scrollLayer_miniCart(obj_div, top_pos)
{
 keepQuickPosition(obj_div, top_pos);
 initPos(top_pos);

 if ( navigator.userAgent.indexOf('Firefox') >= 0 )
 {  
  if ( window.addEventListener )
  {
   window.addEventListener( "resize" , keepQuickPosition , false );
   window.addEventListener( "resizestart" , keepQuickPosition , false );
   window.addEventListener( "resizeend" , keepQuickPosition , false );
   window.addEventListener( "scroll" , keepQuickPosition , false );
  }
 }
 else
 {
  var obj_body = null;
  
  if ( document.getElementById("miniCartBody") != null ) obj_body = document.getElementById("miniCartBody");
  else             obj_body = document.body;
  
  obj_body.onresize = obj_body.onresizestart = obj_body.onresizeend = obj_body.onscroll = function() { keepQuickPosition(obj_div, top_pos); }
 }
}
/// 위치 및 움직임

scrollLayer_miniCart('objDivScrollBanner', 250);

</script>
</body>
</html>