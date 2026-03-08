<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manage Users</title>
    <link rel="stylesheet" href="static/css/style.css" />
  </head>
  <body>
    <div class="admin-layout">
      <!-- Left Sidebar -->
      <jsp:include page="../includes/sidebar_admin.jsp"/>

      <!-- Main Content Area -->
      <main class="admin-main">
        <div class="container main-content full-width">
          <div class="page-header">
            <h2>User Management</h2>
            <div class="d-flex gap-10 align-items-center">
              <input
                type="text"
                placeholder="Enter Username"
                class="search-input"
              />
              <button class="btn">Search</button>
              <button class="btn btn-success">+ Add New User</button>
            </div>
          </div>

          <table class="data-table">
            <thead>
              <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Username</th>
                <th>Role</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>Admin User</td>
                <td>admin</td>
                <td>Admin</td>
                <td>Active</td>
                <td>
                  <button class="btn btn-sm">Edit</button>
                </td>
              </tr>
              <tr>
                <td>2</td>
                <td>Staff One</td>
                <td>staff01</td>
                <td>Staff</td>
                <td>Active</td>
                <td>
                  <button class="btn btn-sm">Edit</button>
                  <button class="btn btn-danger btn-sm">Delete</button>
                </td>
              </tr>
              <tr>
                <td>3</td>
                <td>Customer John</td>
                <td>john_doe</td>
                <td>Customer</td>
                <td>Active</td>
                <td>
                  <button class="btn btn-sm">Edit</button>
                  <button class="btn btn-danger btn-sm">Delete</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <jsp:include page="../includes/footer.jsp"/>
      </main>
    </div>
    <script src="static/js/admin_edit.js"></script>
  </body>
</html>
