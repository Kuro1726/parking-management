<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manage Slots</title>
    <link rel="stylesheet" href="static/css/style.css" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  </head>
  <body>
    <div class="admin-layout">
      <!-- Left Sidebar -->
      <jsp:include page="../includes/sidebar_admin.jsp"/>

      <!-- Main Content Area -->
      <main class="admin-main">
        <div class="container main-content full-width">
          <div class="page-header">
            <h2><i class="fa-solid fa-car-side"></i> Slot Management</h2>
            <button class="btn btn-success"><i class="fa-solid fa-plus"></i> Add New Slot</button>
          </div>

          <div class="filter-section d-flex align-items-center gap-10">
            <label for="zoneFilter">Filter by Zone: </label>
            <select id="zoneFilter" class="filter-select">
              <option value="all">All Zones</option>
              <option value="A">Zone A</option>
              <option value="B">Zone B</option>
              <option value="M1">Zone M1</option>
            </select>
            <button class="btn btn-search">Search</button>
          </div>

          <table class="data-table">
            <thead>
              <tr>
                <th>Slot ID</th>
                <th>Zone</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>A-001</td>
                <td>Zone A</td>
                <td>
                  <span class="status-occupied">Occupied</span>
                </td>
                <td>
                  <button class="btn btn-sm"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                </td>
              </tr>
              <tr>
                <td>A-002</td>
                <td>Zone A</td>
                <td>
                  <span class="status-available">Available</span>
                </td>
                <td>
                  <button class="btn btn-sm"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                  <button class="btn btn-danger btn-sm"><i class="fa-solid fa-trash"></i> Delete</button>
                </td>
              </tr>
              <tr>
                <td>M1-050</td>
                <td>Zone M1</td>
                <td>
                  <span class="status-available">Available</span>
                </td>
                <td>
                  <button class="btn btn-sm"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                  <button class="btn btn-danger btn-sm"><i class="fa-solid fa-trash"></i> Delete</button>
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



