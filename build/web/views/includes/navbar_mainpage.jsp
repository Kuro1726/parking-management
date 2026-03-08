<% String uri = request.getRequestURI();%>
<nav class="navbar">
    <div class="container">
        <a href="./" class="navbar-brand">GreenGate Park</a>
        <ul class="nav-links">
            <li><a href="Login" class="<%= uri.contains("login") ? "active" : "" %>">Login</a></li>
            <li><a href="Register" class="<%= uri.contains("register") ? "active" : "" %>">Register</a></li>
        </ul>
    </div>
</nav>