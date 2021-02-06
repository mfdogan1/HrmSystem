<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/dashbord.css">
</head>
<body>


<div class="container-fluid">
    <div class="row">
        <jsp:include page="partial/sidebar.jsp">
            <jsp:param name="title" value="Main title" />
        </jsp:include>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

            <h5 class="text-center">İzinler</h5>

            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th>Çalışan Ad Soyad</th>
                            <th>Çalışan Mail</th>
                            <th>Çalışan Telefon</th>
                            <th>Çalışan Durumu</th>
                            <th>Çalışan Departmanı</th>
                            <th>Çalışan Rolü</th>
                            <th>İşlem</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${employees}" var="employee">
                            <tr>
                                <td>${employee.name} ${employee.surname}</td>
                                <td>${employee.email}</td>
                                <td>${employee.phone}</td>
                                <td>
                                    <c:if test="${employee.isOff == 1}">
                                        <fmt:formatDate type="both" value="${employee.startOffDate}" /> ' den beri
                                        <span class="badge badge-danger">İzinde  </span>
                                    </c:if>
                                    <c:if test="${employee.isOff == 0}">
                                        <span class="badge badge-success">Uygun</span>
                                    </c:if>
                                </td>
                                <td>${employee.department.name}</td>
                                <td>${employee.role.name}</td>
                                <td>
                                    <c:if test="${employee.isOff == 1}">
                                        <a href="/user/takeOff/${employee.id}" class="btn btn-danger btn-sm">İzni Bitir</a>
                                    </c:if>
                                    <c:if test="${employee.isOff == 0}">
                                        <a href="/user/takeOff/${employee.id}" class="btn btn-info btn-sm">İzin Ver</a>
                                    </c:if>

                                </td>
                            </tr>
                        </c:forEach>



                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</div>



<jsp:include page="partial/footer.jsp">
    <jsp:param name="title" value="Main title" />
</jsp:include>

</body>
</html>