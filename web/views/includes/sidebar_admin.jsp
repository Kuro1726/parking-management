<!-- Admin Navigation Bar Component -->
<%String uri = request.getRequestURI();%>
<aside class="sidebar">
    <a href="Dashboard" class="navbar-brand">Admin Panel</a>
    <ul class="nav-links">
        <li><a href="Dashboard" class="<%= uri.contains("dashboard") ? "active" : "" %>">Dashboard</a></li>
        <li><a href="Users" class="<%= uri.contains("user_list") ? "active" : "" %>">Users</a></li>
        <li><a href="Zones" class="<%= uri.contains("zone_list") ? "active" : "" %>">Zones</a></li>
        <li><a href="Slots" class="<%= uri.contains("slot_list") ? "active" : "" %>">Slots</a></li>
        <li><a href="Pricing" class="<%= uri.contains("pricing_list") ? "active" : "" %>">Pricing</a></li>
        <li><a href="Report" class="<%= uri.contains("report") ? "active" : "" %>">Reports</a></li>
    </ul>
    <div class="sidebar-footer">
        <a href="Logout">Logout</a>
    </div>
</aside>
