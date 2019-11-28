<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Result</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="js/resultPage.js"></script>
    <link rel="stylesheet" href="styles/resultPage.css">
</head>
<body onload="onDocLoad()">

<%
    if(!(Boolean) application.getAttribute("isUserInput")){
        application.setAttribute("isUserInput", true);
        //is-included=true&x=-0.719178&y=0.1427&r=1.0
        application.setAttribute("lastRightParameters", request.getParameter("is-included") + "&" + request.getParameter("x") + "&" + request.getParameter("y")
        + "&" + request.getParameter("r"));
    }else{
        String reqParams = request.getParameter("is-included") + "&" + request.getParameter("x") + "&" + request.getParameter("y")
                + "&" + request.getParameter("r");
        if(!application.getAttribute("lastRightParameters").toString().equals(reqParams))
            out.print("<script>blockHackerAttack()</script>");
    }
%>

<table id="resultTable">
    <thead>
    <tr>
        <th>X</th>
        <th>Y</th>
        <th>R</th>
        <th>Попадание</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <%
            Boolean isIncluded = Boolean.valueOf(request.getParameter("is-included"));
            if(isIncluded != null){
                %>
        <td id="x-td"><%=request.getParameter("x").replaceAll("<", "&lt").replaceAll(">", "&gt")%></td>
        <td id="y-td"><%=request.getParameter("y").replaceAll("<", "&lt").replaceAll(">", "&gt")%></td>
        <td id="r-td"><%=request.getParameter("r").replaceAll("<", "&lt").replaceAll(">", "&gt")%></td>
        <td>
            <%=isIncluded ? "Входит" : "Не входит"%>
        </td>
        <%}%>
    </tr>
    </tbody>
</table>

<a id="backButton" href="index.jsp"><button>Back</button></a>
</body>
</html>
