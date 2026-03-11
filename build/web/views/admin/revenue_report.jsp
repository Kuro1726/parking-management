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
                                    <c:if test="${vehicleList != null || !vehicleList.isEmpty()}">
                                        <c:forEach var="v" items="${vehicleList}">
                                        <th>${v.typeName}</th>
                                        </c:forEach>
                                    </c:if>
                                <th>Total Revenue</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${reportList != null || !reportList.isEmpty()}">
                                <c:forEach var="r" items="${reportList}">
                                    <tr>
                                        <td>${period == "daily" ? r.date : r.month}</td>
                                        <td>${r.totalTickets}</td>
                                        <c:forEach var="rev" items="${r.vehicleRevenueList}">
                                            <td>${FormatCurrency.formatVND(rev)}</td>
                                        </c:forEach>
                                        <td><strong>${FormatCurrency.formatVND(r.totalAmount)}</strong></td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                </div>

                <jsp:include page="../includes/footer.jsp"/>
            </main>
        </div>
        <script src="static/js/admin_edit.js"></script>
    </body>
</html>


