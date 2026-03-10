/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dal.PricingDAO;
import dal.VehicleTypeDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import models.Pricing;
import models.User;

/**
 *
 * @author Admin
 */
public class PricingController extends HttpServlet {

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
            out.println("<title>Servlet PricingController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PricingController at " + request.getContextPath() + "</h1>");
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
            return;
        }
        if (user.getRoleID() != 1) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        loadPricing(request, response);
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
        String action = request.getParameter("action");
        
        BigDecimal hourlyRate = new BigDecimal(request.getParameter("hourlyRate"));
        BigDecimal dailyRate = new BigDecimal(request.getParameter("dailyRate"));
        String vehicleTypeName = request.getParameter("vehicleTypeName");
        
        VehicleTypeDAO vehicleDao = new VehicleTypeDAO();
        PricingDAO pricingDao = new PricingDAO();

        if ("add".equals(action)) {
            int typeID = vehicleDao.findOrCreateType(vehicleTypeName);
            Pricing newPricing = new Pricing(typeID, hourlyRate, dailyRate);
            boolean result = pricingDao.addPricing(newPricing);

            if (!result) {
                request.setAttribute("message", "Pricing for this vehicle type already exists!");
                loadPricing(request, response);
                return;
            }

            request.setAttribute("message", "Pricing added successfully");
            loadPricing(request, response);
        } else if ("edit".equals(action)) {
            int typeID = vehicleDao.findTypeIdByName(vehicleTypeName);
            Pricing newPricing = new Pricing(typeID, hourlyRate, dailyRate);
            pricingDao.updatePricing(newPricing);
            request.setAttribute("message", "Updated pricing successfully");
            request.setAttribute("vehicleTypeName", vehicleTypeName);
            loadPricing(request, response);
        } else if ("delete".equals(action)) {
            int typeID = vehicleDao.findTypeIdByName(vehicleTypeName);
            Pricing pricing = pricingDao.getPricingByTypeId(typeID);

            if (pricing == null) {
                request.setAttribute("message", "pricing doesn't exist");
                loadPricing(request, response);
                return;
            }

            pricingDao.deletePricing(pricing);
            request.setAttribute("message", "delete successfully");
            loadPricing(request, response);
        }
    }

    private void loadPricing(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PricingDAO pricingDao = new PricingDAO();
        ArrayList<Pricing> pricingList = pricingDao.getPricingList();
        request.setAttribute("pricingList", pricingList);
        request.getRequestDispatcher("views/admin/pricing_list.jsp").forward(request, response);
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
