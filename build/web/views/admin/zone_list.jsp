<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Manage Zones</title>
  <link rel="stylesheet" href="static/css/style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>

<body>
  <div class="admin-layout">
    <!-- Left Sidebar -->
    <jsp:include page="../includes/sidebar_admin.jsp" />

    <!-- Main Content Area -->
    <main class="admin-main">
      <div class="container main-content full-width">
        <div class="page-header">
          <h2><i class="fa-solid fa-layer-group"></i> Zone Management</h2>
          <div class="d-flex gap-10 align-items-center">
            <input type="text" placeholder="Enter Vehicle Type" class="search-input" />
            <button class="btn"><i class="fa-solid fa-magnifying-glass"></i> Search</button>
            <button class="btn btn-success"><i class="fa-solid fa-plus"></i> Add New Zone</button>
          </div>
        </div>

        <table class="data-table">
          <thead>
            <tr>
              <th>Zone Code</th>
              <th>Description</th>
              <th>Vehicle Type</th>
              <th>Capacity</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>A</td>
              <td>Basement 1 - Regular Cars</td>
              <td>Car</td>
              <td>200</td>
              <td>
                <button class="btn btn-sm"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                <button class="btn btn-danger btn-sm"><i class="fa-solid fa-trash"></i> Delete</button>
              </td>
            </tr>
            <tr>
              <td>B</td>
              <td>Ground Floor - VIP Cars</td>
              <td>Car</td>
              <td>50</td>
              <td>
                <button class="btn btn-sm"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                <button class="btn btn-danger btn-sm"><i class="fa-solid fa-trash"></i> Delete</button>
              </td>
            </tr>
            <tr>
              <td>M1</td>
              <td>Parking Yard - Motorbikes</td>
              <td>Motorbike</td>
              <td>250</td>
              <td>
                <button class="btn btn-sm"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                <button class="btn btn-danger btn-sm"><i class="fa-solid fa-trash"></i> Delete</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <jsp:include page="../includes/footer.jsp" />
    </main>
  </div>
  <script src="static/js/admin_edit.js"></script>
</body>

</html>

