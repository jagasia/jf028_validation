<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron text-center">
		<h1>Branch Page</h1>
		<p>created by JF027 and JF028 team!</p>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<form:form method="POST" modelAttribute="branch" action="/branch">
					<div>
					Id:<form:input path="bid" class="form-control"/>
					<form:errors path="bid" cssStyle="color:red" />
					</div>		
					
					Name:<form:input path="bname" class="form-control"/>
					City:<form:input path="bcity" class="form-control"/>
					<br/>
					<input type="submit" name="add" class="btn btn-success" value="Add" />&nbsp;
					<input type="submit" name="update" class="btn btn-warning" value="Update" />&nbsp;
					<input type="submit" name="delete" class="btn btn-danger" value="Delete" />&nbsp;
					
				</form:form>
			</div>
			<div class="col-sm-4"></div>
		</div>
		<hr/>

		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<TABLE class="table table-bordered table-striped table-hover">
					<THEAD>
						<TH>Branch ID</TH>
						<TH>Name</TH>
						<TH>City</TH>
						<TH></TH>
					</THEAD>
					<tbody>
						<c:forEach var="b" items="${branches }" >
							<tr>
								<td>${b.bid }</td>
								<td>${b.bname }</td>
								<td>${b.bcity }</td>
								<td><a class="btn btn-info" href="/branch/${b.bid }">Select</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</TABLE>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>

</body>
</html>