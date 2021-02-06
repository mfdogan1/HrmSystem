<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<sec:authentication property="principal.authorities" var="authorities" />
<c:forEach items="${authorities}" var="authority" varStatus="vs">
    <c:set var="role" value="${authority.authority}"/>
</c:forEach>


<c:if test="${role eq 'ADMIN'}">

<div class="container-fluid">
    <div class="row">

        <jsp:include page="partial/sidebar.jsp">
            <jsp:param name="title" value="Main title" />
        </jsp:include>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

            <h5  class="p-3"> Hoşgeldiniz  <b> ${user.name} ${user.surname}</b> </h5>


            <hr>



            <div class="row mb-5">
                <div class="col-xl-6 col-md-12">
                    <h4 class="text-center p-2">Atama Bekleyen Görevler</h4>
                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th>Görev Başlığı</th>
                            <th>Görev Tanımı</th>
                            <th>Oluşturulma Tarihi</th>
                            <th>İşlem</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${stats.unAssignedWorks}" var="work">
                            <tr>
                                <td>${work.title}</td>
                                <td>${work.description}</td>
                                <td><fmt:formatDate type="both" value="${work.createdDate}" /></td>
                                <td>
                                    <c:if test="${work.user == null}">
                                        <a href="/work/assignWork/${work.id}" class="btn btn-success btn-sm text-left float-left">Personel Ata</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>

                <div class="col-xl-6 col-md-12">
                    <h4 class="text-center p-2">İzinli Personeller</h4>
                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th>Çalışan Ad Soyad</th>
                            <th>Çalışan Telefon</th>
                            <th>İzin Tarihi</th>
                            <th>İşlem</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${stats.offEmployees}" var="employee">
                            <tr>
                                <td>${employee.name} ${employee.surname}</td>
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


            <div class="row">
                <div class="col-xl-6 col-md-12">
                    <div class="card overflow-hidden">
                        <div class="card-content " style="background-color: #333333;color: white">
                            <div class="card-body cleartfix">
                                <div class="media align-items-stretch">
                                    <div class="align-self-center">
                                        <i class="icon-pencil primary font-large-2 mr-2"></i>
                                    </div>
                                    <div class="media-body">
                                        <h4><i class="fa fa-users" aria-hidden="true"></i> Toplam Çalışan</h4>
                                        <span><a href="/user/employees" class="text-white">Çalışanlara Git</a></span>
                                    </div>
                                    <div class="align-self-center">
                                        <h1>${stats.totalEmployees}</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-6 col-md-12">
                    <div class="card">
                        <div class="card-content" style="background-color: #333333;color: white">
                            <div class="card-body cleartfix">
                                <div class="media align-items-stretch">
                                    <div class="align-self-center">
                                        <i class="icon-speech warning font-large-2 mr-2"></i>
                                    </div>
                                    <div class="media-body">
                                        <h4><i class="fa fa-list-ol" aria-hidden="true"></i> Tamamlanan Görev Sayısı</h4>
                                        <span><a href="/work/works"  class="text-white" > Görevlere Git </a></span>
                                    </div>
                                    <div class="align-self-center">
                                        <h1>${stats.totalCompletedWorks}</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-5">

                <div class="col-xl-6 col-md-12">
                    <div class="card">
                        <div class="card-content" style="background-color:#333333 ;color: white">
                            <div class="card-body cleartfix">
                                <div class="media align-items-stretch">
                                    <div class="align-self-center">
                                        <h4><i class="fa fa-users" aria-hidden="true"></i> Departman Sayısı</h4>
                                        <span><a href="/department/" class="text-blue">Departmanlara Git</a></span>
                                    </div>
                                    <div class="media-body">
                                        <h1 class="mr-2 float-right">${stats.totalDepartments}</h1>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-wallet success font-large-2"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-6 col-md-12">
                    <div class="card">
                        <div class="card-content" style="background-color: #007F00;color: white">
                            <div class="card-body cleartfix">
                                <div class="media align-items-stretch">
                                    <div class="align-self-center">
                                        <h4> <i class="fa fa-credit-card" aria-hidden="true"></i> Ödenen Toplam Maaş</h4>
                                    </div>
                                    <div class="media-body">
                                        <h1 class="mr-2 float-right">
                                            <fmt:formatNumber type="number" maxFractionDigits="2" value="${stats.totalSalary}"/>
                                            &#8378; </h1>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-heart danger font-large-2"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>



        </main>
    </div>
</div>

</c:if>

<c:if test="${role eq 'EMPLOYEE'}">

    <div class="container-fluid">
        <div class="row">

            <jsp:include page="partial/sidebar.jsp">
                <jsp:param name="title" value="Main title" />
            </jsp:include>

            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

                <h5  class="p-3"> Hoşgeldiniz  <b> ${user.name} ${user.surname} </b> </h5>


                <c:if test="${user.isOff != 0}">
                    <div class="alert alert-primary p-2 mt-2" role="alert">
                        <h6 class="text-center">Şuan izindesiniz
                            <br>İzin Başlama Tarihi =  <fmt:formatDate type="both" value="${user.startOffDate}" />
                        </h6>
                    </div>

                </c:if>


                <hr>



                <div class="row mb-5">
                    <div class="col-xl-6 col-md-12 offset-3">
                        <h4 class="text-center p-2">Aktif Görevler</h4>
                        <table class="table table-striped">
                            <thead class="thead-dark">
                            <tr>
                                <th>Görev Başlığı</th>
                                <th>Görev Açıklaması</th>
                                <th>Görev Durumu</th>
                                <th>İşlem</th>
                            </tr>
                            </thead>
                            <tbody>


                            <c:forEach items="${works}" var="work">
                                <tr>
                                    <td><strong>${work.title}</strong> </td>
                                    <td>${work.description}</td>
                                    <td>
                                        <c:if test="${work.isCompleted == 0}">
                                            <span class="badge badge-danger">Tamamlanmadı</span>
                                        </c:if>
                                        <c:if test="${work.isCompleted == 1}">
                                            <span class="badge badge-success">Tamamlandı</span>
                                        </c:if>
                                    </td>
                                    <td width="20%">
                                        <a class="btn btn-sm btn-success" href="/updateWork/${work.id}">Tamamlandı Olarak İşaretle</a>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>

                        <c:if test="${empty works}">
                            <h5 class="text-center text-info">Aktif göreviniz bulunmamaktadır.</h5>
                        </c:if>

                    </div>
                </div>

                <div class="row mt-5">

                    <div class="col-xl-6 col-md-12">
                        <div class="card">
                            <div class="card-content" style="background-color:#333333 ;color: white">
                                <div class="card-body cleartfix">
                                    <div class="media align-items-stretch">
                                        <div class="align-self-center">
                                            <h4><i class="fa fa-users" aria-hidden="true"></i> Tamamlanan Görev Sayısı</h4>
                                            <span><a href="/completedworks" class="text-blue">Tamamlanan Görevlere Git</a></span>
                                        </div>
                                        <div class="media-body">
                                            <h1 class="mr-2 float-right">${workCount}</h1>
                                        </div>
                                        <div class="align-self-center">
                                            <i class="icon-wallet success font-large-2"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-6 col-md-12">
                        <div class="card">
                            <div class="card-content" style="background-color: #007F00;color: white">
                                <div class="card-body cleartfix">
                                    <div class="media align-items-stretch">
                                        <div class="align-self-center">
                                            <h4> <i class="fa fa-credit-card" aria-hidden="true"></i> Maaş</h4>
                                        </div>
                                        <div class="media-body">
                                            <h1 class="mr-2 float-right">
                                                <fmt:formatNumber type="number" maxFractionDigits="2" value="${user.salary}"/>
                                                &#8378; </h1>
                                        </div>
                                        <div class="align-self-center">
                                            <i class="icon-heart danger font-large-2"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>



            </main>
        </div>
    </div>

</c:if>



<jsp:include page="partial/footer.jsp">
    <jsp:param name="title" value="Main title" />
</jsp:include>

</body>
</html>