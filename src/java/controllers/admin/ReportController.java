/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dal.ReportDAO;
import dal.VehicleTypeDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import models.Report;
import models.User;
import models.VehicleType;

/**
 *
 * @author Admin
 */
public class ReportController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReportController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
        }
        if (user.getRoleID() != 1) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        LocalDate now = LocalDate.now();

        LocalDate startOfMonth = now.withDayOfMonth(1);
        LocalDate endOfMonth = now.withDayOfMonth(now.lengthOfMonth());

        String startDate = startOfMonth.toString();
        String endDate = endOfMonth.toString();

        VehicleTypeDAO vehicleDao = new VehicleTypeDAO();
        ReportDAO reportDao = new ReportDAO();

        List<VehicleType> vehicleList = vehicleDao.getAllTypes();
        ArrayList<Report> reportList = reportDao.getDailyReport(vehicleList, startDate, endDate);
        Report totalAmountAndTickets = reportDao.getTotalAmountAndTickets(startDate, endDate);

        request.setAttribute("totalAmount", totalAmountAndTickets.getTotalAmount());
        request.setAttribute("totalTickets", totalAmountAndTickets.getTotalTickets());
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
        request.setAttribute("period", "daily");
        request.setAttribute("reportList", reportList);
        request.setAttribute("vehicleList", vehicleList);
        request.getRequestDispatcher("views/admin/revenue_report.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String period = request.getParameter("period");

        VehicleTypeDAO vehicleDao = new VehicleTypeDAO();
        ReportDAO reportDao = new ReportDAO();
        List<VehicleType> vehicleList = vehicleDao.getAllTypes();
        ArrayList<Report> reportList = new ArrayList<>();
        Report totalAmountAndTickets = reportDao.getTotalAmountAndTickets(startDate, endDate);

        if ("daily".equals(period)) {
            reportList = reportDao.getDailyReport(vehicleList, startDate, endDate);
        } else {
            reportList = reportDao.getMonthlyReport(vehicleList, startDate, endDate);
        }

        request.setAttribute("totalAmount", totalAmountAndTickets.getTotalAmount());
        request.setAttribute("totalTickets", totalAmountAndTickets.getTotalTickets());
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
        request.setAttribute("period", period);
        request.setAttribute("reportList", reportList);
        request.setAttribute("vehicleList", vehicleList);
        request.getRequestDispatcher("views/admin/revenue_report.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
