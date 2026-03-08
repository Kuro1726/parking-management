<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pricing Configuration</title>
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
            <h2>Pricing Configuration</h2>
            <button class="btn btn-success">+ Add New Pricing Rule</button>
          </div>

          <table class="data-table">
            <thead>
              <tr>
                <th>Vehicle Type</th>
                <th>Time Period</th>
                <th>Base Price</th>
                <th>Hourly Rate</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Motorbike</td>
                <td>06:00 - 18:00</td>
                <td>$5.00</td>
                <td>$1.00</td>
                <td>
                  <button class="btn btn-sm">Edit</button>
                </td>
              </tr>
              <tr>
                <td>Motorbike</td>
                <td>18:00 - 06:00</td>
                <td>$10.00</td>
                <td>$2.00</td>
                <td>
                  <button class="btn btn-sm">Edit</button>
                </td>
              </tr>
              <tr>
                <td>Car</td>
                <td>06:00 - 18:00</td>
                <td>$20.00</td>
                <td>$5.00</td>
                <td>
                  <button class="btn btn-sm">Edit</button>
                </td>
              </tr>
              <tr>
                <td>Car</td>
                <td>18:00 - 06:00</td>
                <td>$30.00</td>
                <td>$10.00</td>
                <td>
                  <button class="btn btn-sm">Edit</button>
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
