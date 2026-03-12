<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="utils.FormatCurrency" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Revenue Report</title>
        <link rel="stylesheet" href="static/css/style.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    </head>
    <body>
        <div class="admin-layout">
            <!-- Left Sidebar -->
            <jsp:include page="../includes/sidebar_admin.jsp"/>

            <!-- Main Content Area -->
            <main class="admin-main">
                <div class="container main-content full-width">
                    <h2><i class="fa-solid fa-chart-line"></i> Revenue Report</h2>

                    <div class="filter-container">
                        <form class="filter-form" action="Report" method="POST">
                            <div class="form-group">
                                <label for="startDate">From Date:</label>
                                <input
                                    type="date"
                                    id="startDate"
                                    name="startDate"
                                    class="filter-input"
                                    value="${startDate}"
                                    required
                                    />
                            </div>
                            <div class="form-group">
                                <label for="endDate">To Date:</label>
                                <input
                                    type="date"
                                    id="endDate"
                                    name="endDate"
                                    class="filter-input"
                                    value="${endDate}"
                                    required
                                    />
                            </div>
                            <div class="form-group">
                                <label for="period">Group By:</label>
                                <select id="period" name="period" class="filter-input">
                                    <option value="daily" ${period == "daily" ? 'selected' : ''}>Daily</option>
                                    <option value="monthly" ${period == "monthly" ? 'selected' : ''}>Monthly</option>
                                </select>
                            </div>
                            <button type="submit" class="btn">Generate Report</button>
                        </form>
                    </div>

                    <div class="dashboard-cards">
                        <div class="card">
                            <h3>Total Revenue</h3>
                            <div class="value text-primary">${FormatCurrency.formatVND(totalAmount)}</div>
                            <p>For selected period</p>
                        </div>
                        <div class="card">
                            <h3>Total Tickets</h3>
                            <div class="value">${totalTickets}</div>
                            <p>Checked out vehicles</p>
                        </div>
                    </div>

                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Total Tickets</th>
                                <th>Top Parked Vehicle</th>
                                <th>Top Vehicle Revenue</th>
                                <th>Total Revenue</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${reportList != null || !reportList.isEmpty()}">
                                <c:forEach var="r" items="${reportList}">
                                    <tr>
                                        <td>${period == "daily" ? r.date : r.month}</td>
                                        <td>${r.totalTickets}</td>
                                        <td>${r.topVehicle}</td>
                                        <td>${FormatCurrency.formatVND(r.topRevenue)}</td>
                                        <td><strong>${FormatCurrency.formatVND(r.totalAmount)}</strong></td>
                                        <td>
                                            <button class="btn btn-info btn-sm"
                                                    data-revenue='${r.vehicleRevenueList}'
                                                    data-types='${r.vehicleTypeList}'
                                                    data-tickets='${r.totalTicketsByVehicleType}'
                                                    onclick="openDetailModal(this)">
                                                <i class="fa-solid fa-circle-info"></i> View Details
                                            </button>

                                            <input type="hidden" class="revenue" value="${r.vehicleRevenueList}">
                                            <input type="hidden" class="types" value="${r.vehicleTypeList}">
                                            <input type="hidden" class="tickets" value="${r.totalTicketsByVehicleType}">
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                </div>

                <jsp:include page="../includes/footer.jsp"/>
            </main>
        </div>

        <!-- Detail Zone Modal -->
        <div id="detailModal" class="modal">
            <div class="modal-content" style="width: 1000px;">
                <span class="close-btn" onclick="closeModal('detailModal')">&times;</span>
                <h3 style="margin-top: 0; color: #333; border-bottom: 2px solid #4CAF50; padding-bottom: 10px;">Report Details
                </h3>
                <div
                    style="background: #f9f9f9; padding: 15px; border-radius: 8px; border-left: 4px solid #4CAF50; margin-top: 15px;">
                    <!--                    <p style="margin: 8px 0;"><strong>Zone Name:</strong> <span id="detailZoneName"></span></p>
                                        <p style="margin: 8px 0;"><strong>Vehicle Types:</strong> <span id="detailVehicleTypes"></span></p>
                                        <p style="margin: 8px 0;"><strong>Capacity:</strong> <span id="detailCapacity"></span> slots</p>
                                        <p style="margin: 8px 0;"><strong>Description:</strong> <span id="detailDescription"></span></p>-->
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Vehicle Type</th>
                                <th>Total Tickets</th>
                                <th>Total Revenue</th>
                            </tr>
                        </thead>
                        <tbody id="reportDetails">
                        </tbody>
                    </table>
                </div>
                <div style="margin-top: 20px; text-align: right;">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('detailModal')">Close</button>
                </div>
            </div>
        </div>
        <script src="static/js/admin_edit.js"></script>
    </body>
</html>


