<% String uri=request.getRequestURI();%>
    <nav class="navbar">
        <div class="container">
            <a href="./" class="navbar-brand"><i class="fa-solid fa-square-parking"></i> GreenGate Parking
                Management</a>
            <ul class="nav-links">
                <li><a href="Login" class="<%= uri.contains(" login") ? "active" : "" %>"><i
                            class="fa-solid fa-right-to-bracket"></i> Login</a></li>
                <li><a href="Register" class="<%= uri.contains(" register") ? "active" : "" %>"><i
                            class="fa-solid fa-user-plus"></i> Register</a></li>
            </ul>
        </div>
    </nav>