<!-- Customer Navigation Bar Component -->
<%String uri = request.getRequestURI();%>
<aside class="sidebar">
    <a href="Profile" class="navbar-brand">Customer Portal</a>
    <ul class="nav-links">
        <li><a href="Profile" class="<%= uri.contains("profile") ? "active" : "" %>">Profile</a></li>
        <li><a href="History" class="<%= uri.contains("history") ? "active" : "" %>">History</a></li>
    </ul>
    <div class="sidebar-footer">
        <a href="Logout">Logout</a>
    </div>
</aside>
