<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Customer Profile</title>
        <link rel="stylesheet" href="static/css/style.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    </head>

    <body>
        <div class="admin-layout">
            <!-- Left Sidebar -->
            <jsp:include page="../includes/sidebar_customer.jsp" />

            <!-- Main Content Area -->
            <main class="admin-main">
                <div class="container main-content width-full-max-none">
                    <c:if test="${not empty successMsg}">
                        <div class="alert alert-success">${successMsg}</div>
                        <c:remove var="successMsg" scope="request" />
                    </c:if>
                    <c:if test="${not empty errorMsg}">
                        <div class="alert alert-danger">${errorMsg}</div>
                        <c:remove var="errorMsg" scope="request" />
                    </c:if>
                    
                    <h2><i class="fa-solid fa-id-card-clip"></i> My Profile & Vehicles</h2>

                    <div class="d-flex gap-30">
                        <div class="flex-1">
                            <h3><i class="fa-solid fa-user-pen"></i> Personal Information</h3>
                            <form action="Profile" method="POST" class="profile-form-box">
                                <input type="hidden" name="action" value="updateProfile">
                                <div class="form-group">
                                    <label for="fullname">Full Name</label>
                                    <input type="text" id="fullname" name="fullname" value="${user.fullName}" required />
                                </div>
                                <div class="form-group">
                                    <label for="email">Username</label>
                                    <input type="text" id="username" name="username" value="${user.username}" required />
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <input type="text" id="phone" name="phone" value="${user.phone}" />
                                </div>
                                <button type="submit" class="btn"><i class="fa-solid fa-floppy-disk"></i> Update Profile</button>
                            </form>

                            <h3 style="margin-top: 30px;"><i class="fa-solid fa-key"></i> Change Password</h3>
                            <form
                                action="Profile"
                                method="post"
                                class="profile-form-box"
                                >
                                <input type="hidden" name="action" value="changePassword">
                                <div class="form-group">
                                    <label for="current-password">Current Password</label>
                                    <input
                                        type="password"
                                        id="current-password"
                                        name="current_password"
                                        placeholder="Enter current password"
                                        required
                                        />
                                </div>
                                <div class="form-group">
                                    <label for="new-password">New Password</label>
                                    <input
                                        type="password"
                                        id="new-password"
                                        name="new_password"
                                        placeholder="Enter new password"
                                        required
                                        />
                                </div>
                                <div class="form-group">
                                    <label for="confirm-password">Confirm New Password</label>
                                    <input
                                        type="password"
                                        id="confirm-password"
                                        name="confirm_password"
                                        placeholder="Confirm new password"
                                        required
                                        />
                                </div>
                                <button type="submit" class="btn"><i class="fa-solid fa-floppy-disk"></i> Change Password</button>
                            </form>
                        </div>

                        <div class="flex-1">
                            <div class="profile-vehicles-header">
                                <h3><i class="fa-solid fa-car"></i> My Registered Vehicles</h3>
                                <button class="btn btn-success btn-sm"><i class="fa-solid fa-plus"></i> Add Vehicle</button>
                            </div>

                            <table class="data-table">
                                <thead>
                                    <tr>
                                        <th>License Plate</th>
                                        <th>Type</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>30A-999.99</td>
                                        <td>Car</td>
                                        <td>
                                            <button class="btn btn-danger btn-xs"><i class="fa-solid fa-trash-can"></i> Remove</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>29F1-123.45</td>
                                        <td>Motorbike</td>
                                        <td>
                                            <button class="btn btn-danger btn-xs"><i class="fa-solid fa-trash-can"></i> Remove</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <jsp:include page="../includes/footer.jsp" />
    </body>

</html>