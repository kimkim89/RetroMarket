<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<title>Settings | AdminKit Demo</title>

	<link href="${contextPath}/resources/assets/admin/css/app.css" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<%@ include file="./include/sidebar.jsp" %>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3">Settings</h1>

					<div class="row">
						<div class="col-md-3 col-xl-2">

							<div class="card">
								<div class="card-header">
									<h5 class="card-title mb-0">Profile Settings</h5>
								</div>

								<div class="list-group list-group-flush" role="tablist">
									<a class="list-group-item list-group-item-action active" data-toggle="list" href="#account" role="tab">
          Account
        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#password" role="tab">
          Password
        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">
          Privacy and safety
        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">
          Email notifications
        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">
          Web notifications
        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">
          Widgets
        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">
          Your data
        </a>
									<a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">
          Delete account
        </a>
								</div>
							</div>
						</div>

						<div class="col-md-9 col-xl-10">
							<div class="tab-content">
								<div class="tab-pane fade show active" id="account" role="tabpanel">

									<div class="card">
										<div class="card-header">

											<h5 class="card-title mb-0">Public info</h5>
										</div>
										<div class="card-body">
											<form>
												<div class="row">
													<div class="col-md-8">
														<div class="mb-3">
															<label class="form-label" for="inputUsername">Username</label>
															<input type="text" class="form-control" id="inputUsername" placeholder="Username">
														</div>
														<div class="mb-3">
															<label class="form-label" for="inputUsername">Biography</label>
															<textarea rows="2" class="form-control" id="inputBio" placeholder="Tell something about yourself"></textarea>
														</div>
													</div>
													<div class="col-md-4">
														<div class="text-center">
															<img alt="Charles Hall" src="img/avatars/avatar.jpg" class="rounded-circle img-responsive mt-2" width="128" height="128" />
															<div class="mt-2">
																<span class="btn btn-primary"><i class="fas fa-upload"></i> Upload</span>
															</div>
															<small>For best results, use an image at least 128px by 128px in .jpg format</small>
														</div>
													</div>
												</div>

												<button type="submit" class="btn btn-primary">Save changes</button>
											</form>

										</div>
									</div>

									<div class="card">
										<div class="card-header">

											<h5 class="card-title mb-0">Private info</h5>
										</div>
										<div class="card-body">
											<form>
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="inputFirstName">First name</label>
														<input type="text" class="form-control" id="inputFirstName" placeholder="First name">
													</div>
													<div class="mb-3 col-md-6">
														<label class="form-label" for="inputLastName">Last name</label>
														<input type="text" class="form-control" id="inputLastName" placeholder="Last name">
													</div>
												</div>
												<div class="mb-3">
													<label class="form-label" for="inputEmail4">Email</label>
													<input type="email" class="form-control" id="inputEmail4" placeholder="Email">
												</div>
												<div class="mb-3">
													<label class="form-label" for="inputAddress">Address</label>
													<input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
												</div>
												<div class="mb-3">
													<label class="form-label" for="inputAddress2">Address 2</label>
													<input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
												</div>
												<div class="row">
													<div class="mb-3 col-md-6">
														<label class="form-label" for="inputCity">City</label>
														<input type="text" class="form-control" id="inputCity">
													</div>
													<div class="mb-3 col-md-4">
														<label class="form-label" for="inputState">State</label>
														<select id="inputState" class="form-control">
                    <option selected>Choose...</option>
                    <option>...</option>
                  </select>
													</div>
													<div class="mb-3 col-md-2">
														<label class="form-label" for="inputZip">Zip</label>
														<input type="text" class="form-control" id="inputZip">
													</div>
												</div>
												<button type="submit" class="btn btn-primary">Save changes</button>
											</form>

										</div>
									</div>

								</div>
								<div class="tab-pane fade" id="password" role="tabpanel">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">Password</h5>

											<form>
												<div class="mb-3">
													<label class="form-label" for="inputPasswordCurrent">Current password</label>
													<input type="password" class="form-control" id="inputPasswordCurrent">
													<small><a href="#">Forgot your password?</a></small>
												</div>
												<div class="mb-3">
													<label class="form-label" for="inputPasswordNew">New password</label>
													<input type="password" class="form-control" id="inputPasswordNew">
												</div>
												<div class="mb-3">
													<label class="form-label" for="inputPasswordNew2">Verify password</label>
													<input type="password" class="form-control" id="inputPasswordNew2">
												</div>
												<button type="submit" class="btn btn-primary">Save changes</button>
											</form>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-left">
							<p class="mb-0">
								<a href="index.html" class="text-muted"><strong>AdminKit Demo</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-right">
							<ul class="list-inline">
								<li class="list-inline-item">
									<a class="text-muted" href="#">Support</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="#">Help Center</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="#">Privacy</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="#">Terms</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="${contextPath}/resources/admin/js/app.js"></script>

</body>

</html>