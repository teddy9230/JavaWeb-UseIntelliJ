<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>商品列表</title>
</head>
<link rel="stylesheet" type="text/css" href="css/public.css">
<style type="text/css">
	table {
		border-collapse: collapse;
	}

	/*商品列表第1列*/
	.col1 {
		padding-top: 5px;
		border-top: 1px dashed #666666;
		text-indent: 40px
	}

	/*商品列表第2列*/
	.col2 {
		padding-top: 5px;
		border-top: 1px dashed #666666;
		text-align: right;
	}

	/*商品列表第3列*/
	.col3 {
		padding-top: 5px;
		border-top: 1px dashed #666666;
		text-align: center;
	}
</style>
<body>

<jsp:include page="header.jsp" flush="true">
    <jsp:param name="image" value="list.jpg" />
</jsp:include>

<hr width="100%" />
<div class="text3" align="center">請從商品列表中選擇喜愛的商品</div>
<br>
<table width="100%" border="0" align="center">
  <tr bgcolor="#b4c8ed">
    <th>商品名称</th>
    <th width="5%" >商品價格</th>
    <th width="15%" >添加到購物車</th>
  </tr>

  <c:forEach var="commodities" items="${commoditiesList}" varStatus="status">
    <tr
            <c:if test="${status.index % 2 == 0}">
              bgcolor='#ffffff'
            </c:if>
            <c:if test="${status.index % 2 != 0}">
              bgcolor='#edf8ff'
            </c:if>
    >
<%--      <td class="col1"><a href="controller?action=detail&id=${commodities.id}">${commodities.description}</a></td>--%>
<%--  <td class="col1"><a href="controller?action=detail&id=${commodities.id}">${commodities.description}</a></td>--%>
  <td class="col1"><a href="controller?action=detail&id=${commodities.id}">${commodities.description}</a></td>
  <td class="col2">${commodities.price}</td>
      <td class="col3"><a href="controller?action=add&pagename=list&commoditiesid=${commodities.id}&name=${commodities.name}&price=${commodities.price}">添加到購物車</a></td>
    </tr>
  </c:forEach>

</table>

<hr />
<div align="center">
  <ul class="pagination">

    <li><a href="controller?action=paging&page=prev">«</a></li>
    <c:forEach var="page" begin="1" end="${totalPageNumber}">
      <li><a
              <c:if test="${page == currentPage}">
                class="active"
              </c:if>
              href="controller?action=paging&page=${page}">${page}</a></li>
    </c:forEach>
    <li><a href="controller?action=paging&page=next">»</a></li>

  </ul>
</div>

<%@include file="footer.jsp"%>

</body>
</html>
