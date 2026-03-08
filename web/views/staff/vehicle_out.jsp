<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Vehicle Check-Out</title>
  <link rel="stylesheet" href="static/css/style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>

<body>
  <div class="admin-layout">
    <!-- Left Sidebar -->
    <jsp:include page="../includes/sidebar_staff.jsp" />

    <!-- Main Content Area -->
    <main class="admin-main">
      <div class="container main-content width-full-max-none">
        <h2><i class="fa-solid fa-arrow-right-from-bracket"></i> Vehicle Check-Out</h2>

        <div class="checkout-layout">
          <div class="search-section">
            <form action="vehicle_out.jsp" method="get">
              <div class="form-group">
                <label for="plateSearch">Enter License Plate</label>
                <div class="d-flex gap-10">
                  <input type="text" id="plateSearch" name="plateSearch" placeholder="License Plate..." required
                    class="flex-1" />
                  <button type="submit" class="btn"><i class="fa-solid fa-magnifying-glass"></i> Search</button>
                </div>
              </div>
            </form>
          </div>

          <div class="invoice-section">
            <h3 class="invoice-header"><i class="fa-solid fa-file-invoice"></i> Invoice</h3>

            <p><strong>Ticket ID:</strong> TKT-987654</p>
            <p><strong>License Plate:</strong> 29A-123.45</p>
            <p><strong>Vehicle Type:</strong> Car</p>
            <p><strong>Check-In Time:</strong> 10:30 AM</p>
            <p><strong>Check-Out Time:</strong> 14:45 PM</p>
            <p><strong>Duration:</strong> 4 hours 15 mins</p>

            <div class="invoice-total-container">
              <h2 class="invoice-total-text">Total: $40.00</h2>
            </div>

            <div class="invoice-actions">
              <button class="btn btn-success btn-flex-large">
                Confirm Payment
              </button>
              <button class="btn btn-danger btn-flex-large">
                Mark as Lost Ticket
              </button>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
  <jsp:include page="../includes/footer.jsp" />
</body>

</html>