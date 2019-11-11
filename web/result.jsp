<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Result</title>
    <style>
        body{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 90vh;
        }
        table{
            border-collapse: collapse;
            font-size: 3rem;

        }
        th,td{
            width: 2em;
            border: solid 2px black;
            text-align: center;
        }

        button{
            padding: 10px;
            margin-top: 2%;
            font-size: 2rem
        }
    </style>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>Y</th>
        <th>X</th>
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
        <td id="x-td"><%=request.getParameter("x")%></td>
        <td id="y-td"><%=request.getParameter("y")%></td>
        <td id="r-td"><%=request.getParameter("r")%></td>
        <td>
            <%=isIncluded ? "Входит" : "Не входит"%>
        </td>
        <%}%>
    </tr>
    </tbody>
</table>

<a href="index.jsp"><button>Back</button></a>
</body>
</html>
