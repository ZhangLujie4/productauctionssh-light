<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.model.Sysuser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Shouquan"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Gongneng"%>
<script type="text/javascript">
   $(function(){
	   $(".accordion-item .leftMenus dd").click(function(){
	    	  $(".accordion-item .leftMenus dd").removeClass("current");
	    	  $(this).addClass("current");
	   });
   })
</script>

<div class="accordion-group">
	<div
		style="height: 600px; background: url(images/content.gif) repeat-y; display: none;"
		class="accordion-item">
		<%
		     CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
			 Sysuser s = (Sysuser)session.getAttribute("admin");
			  %>
		<h3>权限操作</h3>
		<%
			 ArrayList<Shouquan> slist = (ArrayList<Shouquan>)dao.findByHql("from Shouquan where jsid='"+s.getUsertype()+"'");
			  %>
		<div class="leftMenus">
		      <% 
		      for(Shouquan ss:slist){
			  Gongneng gg = (Gongneng)dao.findById(ss.getGnid(),"Gongneng");
			  if (gg.getDelstatus().equals("0")) {
		       %>
		       <dd>
				<a  href="/productauctionssh/admin/<%=gg.getUrl() %>" target="main"><%=gg.getName() %></a>
				</dd>
				<%} }%>
		</div>
		
	</div>
</div>
