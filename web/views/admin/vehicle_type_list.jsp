<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Manage Vehicle Types</title>
  <link rel="stylesheet" href="static/css/style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>

<body>
  <div class="admin-layout">
    <!-- Left Sidebar -->
    <jsp:include page="../includes/sidebar_admin.jsp" />

    <!-- Main Content Area -->
    <main class="admin-main">
      <div class="container main-content full-width">
        <div class="page-header gap-10">
          <h2><i class="fa-solid fa-car-side"></i> Vehicle Types Management</h2>
          <a href="Zones" class="btn btn-secondary"><i class="fa-solid fa-arrow-left"></i> Back to Zones</a>
        </div>

        <c:if test="${not empty sessionScope.successMsg}">
          <div class="alert alert-success">${sessionScope.successMsg}</div>
          <c:remove var="successMsg" scope="session" />
        </c:if>
        <c:if test="${not empty sessionScope.errorMsg}">
          <div class="alert alert-danger">${sessionScope.errorMsg}</div>
          <c:remove var="errorMsg" scope="session" />
        </c:if>

        <div style="background: #f8f9fa; padding: 20px; border-radius: 8px; margin-bottom: 25px; border: 1px solid #e9ecef;">
          <h3 style="margin-top:0; margin-bottom: 15px; font-size: 16px; color:#555;">Add New Vehicle Type</h3>
          <form action="Zones" method="POST" style="display: flex; gap: 15px; margin:0; align-items: center;">
            <input type="hidden" name="action" value="addType">
            <input type="text" name="typeName" placeholder="Enter vehicle type name..." required class="filter-input" style="flex:1;">
            <button type="submit" class="btn btn-success"><i class="fa-solid fa-plus"></i> Add Type</button>
          </form>
        </div>

        <table class="data-table">
          <thead>
            <tr>
              <th style="width: 15%;">Type ID</th>
              <th style="width: 55%;">Type Name</th>
              <th style="width: 30%; text-align: center;">Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:choose>
              <c:when test="${empty vehicleTypesList}">
                <tr>
                  <td colspan="3" style="text-align: center;">No vehicle types found.</td>
                </tr>
              </c:when>
              <c:otherwise>
                <c:forEach items="${vehicleTypesList}" var="t">
                  <tr>
                    <td style="font-weight: bold;">${t.typeID}</td>
                    <td>
                      <form action="Zones" method="POST" style="display:inline; margin:0;" id="formEditType${t.typeID}">
                        <input type="hidden" name="action" value="editType">
                        <input type="hidden" name="typeID" value="${t.typeID}">
                        <input type="text" name="typeName" value="${t.typeName}" required class="filter-input">
                      </form>
                    </td>
                    <td style="text-align: center; white-space: nowrap;">
                      <button type="button" class="btn btn-sm btn-info" onclick="document.getElementById('formEditType${t.typeID}').submit();" title="Save Changes"><i class="fa-solid fa-save"></i> Save</button>
                      <form action="Zones" method="POST" style="display:inline; margin:0;" onsubmit="return confirm('Ensure no zones or slots are using this type before deleting. Continue?');">
                        <input type="hidden" name="action" value="deleteType">
                        <input type="hidden" name="typeID" value="${t.typeID}">
                        <button type="submit" class="btn btn-sm btn-danger" title="Delete Type"><i class="fa-solid fa-trash"></i> Delete</button>
                      </form>
                    </td>
                  </tr>
                </c:forEach>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </div>

      <jsp:include page="../includes/footer.jsp" />
    </main>
  </div>
</body>

</html>
