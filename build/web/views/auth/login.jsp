<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="static/css/style.css" />
  </head>
  <body>
    <jsp:include page="../includes/navbar_mainpage.jsp"/>

    <div class="container main-content">
      <div class="auth-container">
        <h2>Login</h2>
        <form action="Login" method="POST">
          <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required />
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required />
          </div>
          <button type="submit" class="btn w-100">Login</button>
        </form>
        <p>Don't have an account? <a href="Register">Register here</a></p>
      </div>
    </div>

    <jsp:include page="../includes/footer.jsp"/>
  </body>
</html>
