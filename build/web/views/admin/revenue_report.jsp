<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Revenue Report</title>
    <link rel="stylesheet" href="static/css/style.css" />
  </head>
  <body>
    <div class="admin-layout">
      <!-- Left Sidebar -->
      <jsp:include page="../includes/sidebar_admin.jsp"/>

      <!-- Main Content Area -->
      <main class="admin-main">
        <div class="container main-content full-width">
          <h2>Revenue Report</h2>

          <div class="filter-container">
            <form class="filter-form">
              <div class="form-group">
                <label for="startDate">From Date:</label>
                <input
                  type="date"
                  id="startDate"
                  name="startDate"
                  class="filter-input"
                />
              </div>
              <div class="form-group">
                <label for="endDate">To Date:</label>
                <input
                  type="date"
                  id="endDate"
                  name="endDate"
                  class="filter-input"
                />
              </div>
              <div class="form-group">
                <label for="period">Group By:</label>
                <select id="period" name="period" class="filter-input">
                  <option value="daily">Daily</option>
                  <option value="monthly">Monthly</option>
                </select>
              </div>
              <button type="submit" class="btn">Generate Report</button>
            </form>
          </div>

          <div class="dashboard-cards">
            <div class="card">
              <h3>Total Revenue</h3>
              <div class="value text-primary">$15,450</div>
              <p>For selected period</p>
            </div>
            <div class="card">
              <h3>Total Tickets</h3>
              <div class="value">1,245</div>
              <p>Checked out vehicles</p>
            </div>
          </div>

          <table class="data-table">
            <thead>
              <tr>
                <th>Date</th>
                <th>Tickets Issued</th>
                <th>Car Revenue</th>
                <th>Motorbike Revenue</th>
                <th>Total Revenue</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>2026-03-05</td>
                <td>150</td>
                <td>$800.00</td>
                <td>$450.00</td>
                <td><strong>$1,250.00</strong></td>
              </tr>
              <tr>
                <td>2026-03-04</td>
                <td>175</td>
                <td>$950.00</td>
                <td>$520.00</td>
                <td><strong>$1,470.00</strong></td>
              </tr>
              <tr>
                <td>2026-03-03</td>
                <td>140</td>
                <td>$750.00</td>
                <td>$400.00</td>
                <td><strong>$1,150.00</strong></td>
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
