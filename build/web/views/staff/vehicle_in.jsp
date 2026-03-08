<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!doctype html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Vehicle Check-In</title>
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
            <h2><i class="fa-solid fa-arrow-right-to-bracket"></i> Vehicle Check-In</h2>

            <div class="check-in-layout">
              <div class="form-section">
                <form action="vehicle_in.jsp" method="post">
                  <div class="form-group">
                    <label for="licensePlate">License Plate *</label>
                    <input type="text" id="licensePlate" name="licensePlate" placeholder="e.g. 29A-123.45" required />
                  </div>
                  <div class="form-group">
                    <label for="vehicleType">Vehicle Type *</label>
                    <select id="vehicleType" name="vehicleType" required>
                      <option value="motorbike">Motorbike</option>
                      <option value="car">Car</option>
                    </select>
                  </div>
                  <button type="button" class="btn mb-15">
                    Search Available Slots
                  </button>
                  <button type="submit" class="btn btn-success btn-full-large">
                    Confirm Check-In & Print Ticket
                  </button>
                </form>
              </div>

              <div class="slots-section">
                <h3><i class="fa-solid fa-lightbulb"></i> Available Slots Suggestion</h3>
                <p>
                  Based on vehicle type, here are the nearest available slots:
                </p>
                <ul class="slots-list">
                  <li class="slot-item">
                    <input type="radio" id="slot-a012" name="assignedSlot" value="A-012" class="mr-10" required />
                    <label class="slot-label">
                      <strong>A-012</strong> <span>Zone A (Cars)</span>
                    </label>
                  </li>
                  <li class="slot-item">
                    <input type="radio" id="slot-a015" name="assignedSlot" value="A-015" class="mr-10" required />
                    <label class="slot-label">
                      <strong>A-015</strong> <span>Zone A (Cars)</span>
                    </label>
                  </li>
                  <li class="slot-item">
                    <input type="radio" id="slot-m1089" name="assignedSlot" value="M1-089" class="mr-10" required />
                    <label class="slot-label">
                      <strong>M1-089</strong> <span>Zone M1 (Motorbikes)</span>
                    </label>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </main>
      </div>

      <jsp:include page="../includes/footer.jsp" />
    </body>

    </html>