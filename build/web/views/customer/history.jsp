<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Parking History</title>
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
        <h2><i class="fa-solid fa-clipboard-list"></i> Parking History & Invoices</h2>

        <table class="data-table">
          <thead>
            <tr>
              <th>Ticket ID</th>
              <th>Date</th>
              <th>License Plate</th>
              <th>Check-In</th>
              <th>Check-Out</th>
              <th>Fee</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>TKT-00123</td>
              <td>2026-03-05</td>
              <td>30A-999.99</td>
              <td>08:15 AM</td>
              <td>17:30 PM</td>
              <td>$45.00</td>
              <td>
                <span class="text-success fw-bold">Paid</span>
              </td>
            </tr>
            <tr>
              <td>TKT-00101</td>
              <td>2026-03-04</td>
              <td>29F1-123.45</td>
              <td>09:00 AM</td>
              <td>12:00 PM</td>
              <td>$5.00</td>
              <td>
                <span class="text-success fw-bold">Paid</span>
              </td>
            </tr>
            <tr>
              <td>TKT-00250</td>
              <td>2026-03-06</td>
              <td>30A-999.99</td>
              <td>08:00 AM</td>
              <td>--:--</td>
              <td>-</td>
              <td>
                <span class="text-danger fw-bold">Parking</span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </main>
  </div>

  <jsp:include page="../includes/footer.jsp" />
</body>

</html>