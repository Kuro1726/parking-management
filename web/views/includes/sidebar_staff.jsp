<!-- Staff Navigation Bar Component -->
<%String uri = request.getRequestURI();%>
<aside class="sidebar">
    <a href="VehicleIn" class="navbar-brand">Staff Panel</a>
    <ul class="nav-links">
        <li><a href="VehicleIn" class="<%= uri.contains("vehicle_in") ? "active" : "" %>">Check-In</a></li>
        <li><a href="VehicleOut" class="<%= uri.contains("vehicle_out") ? "active" : "" %>">Check-Out</a></li>
    </ul>
    <div class="sidebar-footer">
        <a href="Logout">Logout</a>
    </div>
</aside>
