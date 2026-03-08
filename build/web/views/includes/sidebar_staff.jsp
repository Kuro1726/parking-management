<!-- Staff Navigation Bar Component -->
<%String uri=request.getRequestURI();%>
    <aside class="sidebar">
        <a href="VehicleIn" class="navbar-brand"><i class="fa-solid fa-user-gear"></i> Staff Panel</a>
        <ul class="nav-links">
            <li><a href="VehicleIn" class="<%= uri.contains(" vehicle_in") ? "active" : "" %>"><i
                        class="fa-solid fa-arrow-right-to-bracket"></i> Check-In</a></li>
            <li><a href="VehicleOut" class="<%= uri.contains(" vehicle_out") ? "active" : "" %>"><i
                        class="fa-solid fa-arrow-right-from-bracket"></i> Check-Out</a></li>
        </ul>
        <div class="sidebar-footer">
            <a href="Logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        </div>
    </aside>