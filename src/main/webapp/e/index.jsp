<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Notice"%>
<%@page import="java.util.ArrayList"%>

<%@page import="com.model.Goods"%>
<%@page import="com.model.Imgv"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.model.Jingjia"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link href="/productauctionssh/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="/productauctionssh/e/css/jquery.iFadeSlide.css" type="text/css"></link>

<script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>

 <script src="/productauctionssh/e/js/jquery.iFadeSldie.js" type="text/javascript"></script>
    
    

    <script type="text/javascript">
        $(function () {


            
            $('div#slide_c').iFadeSlide({
                field: $('div#slide_c img'),
                icocon: $('div.ico_c'),
                outTime: 100,
                inTime: 200
            });
            
            $(".collapsed").each(function(i,dom){
	             
	             
	             $(this).click(function(){
		             var blockid= $(this).attr("blockid");
		             if($("#"+blockid).is(":hidden")){
		               
		               $(this).attr("src","images/collapsed_no.gif");
		               $("#"+blockid).show();
		             
		             }else
		             {
		                $(this).attr("src","images/collapsed_yes.gif");
		               $("#"+blockid).hide(); 
		             }
	             });
	             
	         
	         
	         });
            
           $(".tabcontainer dl dt").each(function(index,dom){
               
               
                  $(this).mouseenter(function(){
                   
                      
                      $(".tabcontainer dl dt").removeClass("on");
                      $(this).addClass("on");
                      $(".tabcontainer dl dd").hide().eq(index).show();
                     
                  })
         })

        });
    </script>

</head>
<body>
<%
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
Notice notice = (Notice)dao.findById("1","Notice");
String stype = request.getParameter("stype")==null?"":request.getParameter("stype");
String type = request.getParameter("type")==null?"":request.getParameter("type");
 %>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap" style=" position: relative;">
		
		<div class="fn-left">
		
		     <div id="slide_c">
		     <%
		    ArrayList<Imgv> ilist = (ArrayList<Imgv>)dao.findByHql("from Imgv where 1=1");
		    for(Imgv imgv:ilist){
		      %>
		       <a target="_blank" href='#'><img alt="" title="" src="<%=imgv.getImg() %>"></a>
		       <%} %>
                <div class="ico_c">
                </div>
             </div>
          
		</div>
		
		<div class="sidebar fn-left"
			style="height:316px; width:262px; padding-right: 0px; background: #fff;">
			<h3>系统公告</h3>
			<%=notice.getTitle() %><br/>
			<%=notice.getContent() %>

		</div>

		

	</div>
	<div class="fn-clear">
	</div>
  
	<div class="fn-clear"></div>
	<div class="wrap">
	   <!-- 推荐拍品 -->
	     <div class="box">
           <div class="title"><strong>正在拍卖</strong></div>
           <div class="content">
             <div class="image-items"> 
             <%
             String hql="from Goods where delstatus='0' and shstatus='通过审核' and status='正在拍卖'";
             ArrayList<Goods> tjlist = (ArrayList<Goods>)dao.findByHql(hql);
             int i=0;
             for(Goods tjgoods:tjlist){
             i++;
             ArrayList<Jingjia> jlist = (ArrayList<Jingjia>)dao.findByHql("from Jingjia where gid='"+tjgoods.getId()+"'");
              %>
               <div class="image-item image-size">
                 <a href="goodsinfo.jsp?goodsid=<%=tjgoods.getId() %>"><img src="<%=tjgoods.getImg() %>"/> </a>
                   <div class="text-info" style="height: 50px;">
                     <dl>
                       <dt style="text-align: left">
                       <span>
                       <a href="goodsinfo.jsp?goodsid=<%=tjgoods.getId() %>"><%=tjgoods.getGoodsname() %></a>
                       </span>
                       <span style="float: right;">
                       <font style="color:#333333;">【浏览次数】<%=tjgoods.getCs() %>次</font>
                       </span>
                       </dt>
                       <dd style="text-align: right;"><font color="#D23030" style="font-size:15px;">￥</font>
                       <font color="#D23030" style="font-size:20px;"><b><%=tjgoods.getMaxprice() %></b></font><font color="#D23030" style="font-size:15px; display: block;float: left"><b><%if(jlist.size()!=0){%><%=jlist.size() %>次出价<%}else{ %>暂无竞价<%} %></b></font>
                       </dd>
                     </dl>
                   </div>
               </div>
                
               <%} %>
              </div>
           </div>
         </div>
	   <!-- end -->
	   
	  
	</div>
	
	
	


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
<script type="text/javascript">
var CID = "endtime";
if(window.CID != null)
{
    var iTime = document.getElementById(CID).innerText;
    var Account;
    RemainTime();
}
function RemainTime()
{
    var iDay,iHour,iMinute,iSecond;
    var sDay="",sHour="",sMinute="",sSecond="",sTime="";
    if (iTime >= 0)
    {
        iDay = parseInt(iTime/24/3600);
        if (iDay > 0)
        {
            sDay = iDay + "天";
        }
        iHour = parseInt((iTime/3600)%24);
        if (iHour > 0){
            sHour = iHour + "小时";
        }
        iMinute = parseInt((iTime/60)%60);
        if (iMinute > 0){
            sMinute = iMinute + "分钟";
        }
        iSecond = parseInt(iTime%60);
        if (iSecond >= 0){
            sSecond = iSecond + "秒";
        }
        if ((sDay=="")&&(sHour=="")){
            sTime="<span style='color:darkorange'>" + sMinute+sSecond + "</font>";
        }
        else
        {
            sTime=sDay+sHour+sMinute+sSecond;
        }
        if(iTime==0){
            clearTimeout(Account);
              sTime="<span style='color:green'>时间到了！</span>";

              
        }
        else
        {
            Account = setTimeout("RemainTime()",1000);
        }
        iTime=iTime-1;
    }
    else
    {
            sTime="<span style='color:red'>倒计时结束！</span>";
    }
    document.getElementById(CID).innerHTML = sTime;
}
</script>
</html>