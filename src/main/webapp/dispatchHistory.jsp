<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Dispatch History</h2>

<table border="1">
    <tr>
        <th>Item ID</th>
        <th>Quantity</th>
        <th>Dispatch Date</th>
    </tr>
    <c:forEach var="log" items="${dispatchLogs}">
        <tr>
            <td>${log.itemId}</td>
            <td>${log.quantity}</td>
            <td>${log.dispatchDate}</td>
        </tr>
    </c:forEach>
</table>


</body>
</html>