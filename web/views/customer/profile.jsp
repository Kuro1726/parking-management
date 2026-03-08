<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Customer Profile</title>
    <link rel="stylesheet" href="static/css/style.css" />
  </head>
  <body>
    <div class="admin-layout">
      <!-- Left Sidebar -->
      <jsp:include page="../includes/sidebar_customer.jsp" />

      <!-- Main Content Area -->
      <main class="admin-main">
        <div class="container main-content width-full-max-none">
          <h2>My Profile & Vehicles</h2>

          <div class="d-flex gap-30">
            <div class="flex-1">
              <h3>Personal Information</h3>
              <form
                action="profile.jsp"
                method="post"
                class="profile-form-box"
              >
                <div class="form-group">
                  <label for="fullname">Full Name</label>
                  <input
                    type="text"
                    id="fullname"
                    name="fullname"
                    value="John Doe"
                    required
                  />
                </div>
                <div class="form-group">
                  <label for="email">Email Address</label>
                  <input
                    type="email"
                    id="email"
                    name="email"
                    value="john@example.com"
                    required
                  />
                </div>
                <div class="form-group">
                  <label for="phone">Phone Number</label>
                  <input
                    type="text"
                    id="phone"
                    name="phone"
                    value="123-456-7890"
                  />
                </div>
                <button type="submit" class="btn">Update Profile</button>
              </form>
            </div>

            <div class="flex-1">
              <div class="profile-vehicles-header">
                <h3>My Registered Vehicles</h3>
                <button class="btn btn-success btn-sm">+ Add Vehicle</button>
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
                      <button class="btn btn-danger btn-xs">Remove</button>
                    </td>
                  </tr>
                  <tr>
                    <td>29F1-123.45</td>
                    <td>Motorbike</td>
                    <td>
                      <button class="btn btn-danger btn-xs">Remove</button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </main>
    </div>

    <jsp:include page="../includes/footer.jsp"/>
  </body>
</html>
