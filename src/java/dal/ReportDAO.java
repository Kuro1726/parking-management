/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import models.Pricing;
import models.Report;
import models.VehicleType;

/**
 *
 * @author Admin
 */
public class ReportDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public ArrayList<Report> getDailyReport(List<VehicleType> vehicleList, String startDate, String endDate) {
        ArrayList<Report> reportList = new ArrayList<>();

        try {
            StringBuilder sumQuery = new StringBuilder();

            for (VehicleType v : vehicleList) {
                sumQuery.append(
                        "SUM(CASE WHEN vt.TypeName = '")
                        .append(v.getTypeName())
                        .append("' THEN tr.TotalAmount ELSE 0 END) AS [")
                        .append(v.getTypeName())
                        .append("], ");
            }

            String strSQL = """
                            SELECT 
                                CAST(tr.ExitTime AS DATE) AS [Date],
                                COUNT(t.TicketID) AS TotalTickets,
                            """ + sumQuery + """
                                             SUM(tr.TotalAmount) AS TotalRevenue
                                             
                                             FROM Transactions tr
                                             JOIN Tickets t ON tr.TicketID = t.TicketID
                                             JOIN VehicleTypes vt ON t.TypeID = vt.TypeID
                                             
                                             WHERE CAST(tr.ExitTime AS DATE) 
                                             BETWEEN ? AND ?
                                             
                                             GROUP BY CAST(tr.ExitTime AS DATE)
                                             
                                             ORDER BY [Date];
                                             """;
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, startDate);
            stm.setString(2, endDate);
            rs = stm.executeQuery();

            while (rs.next()) {
                Report report = new Report();
                ArrayList<BigDecimal> vehicleRevenueList = report.getVehicleRevenueList();
                Date date = rs.getDate("Date");
                int totalTickets = rs.getInt("TotalTickets");

                for (VehicleType v : vehicleList) {
                    BigDecimal vehicleRevenue = rs.getBigDecimal(v.getTypeName());
                    vehicleRevenueList.add(vehicleRevenue);
                }

                BigDecimal totalRevenue = rs.getBigDecimal("TotalRevenue");

                report.setDate(date);
                report.setTotalTickets(totalTickets);
                report.setTotalAmount(totalRevenue);
                reportList.add(report);
            }

            return reportList;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public ArrayList<Report> getMonthlyReport(List<VehicleType> vehicleList, String startDate, String endDate) {
        ArrayList<Report> reportList = new ArrayList<>();

        try {
            StringBuilder sumQuery = new StringBuilder();

            for (VehicleType v : vehicleList) {
                sumQuery.append(
                        "SUM(CASE WHEN vt.TypeName = '")
                        .append(v.getTypeName())
                        .append("' THEN tr.TotalAmount ELSE 0 END) AS [")
                        .append(v.getTypeName())
                        .append("], ");
            }

            String strSQL = """
                            SELECT 
                                FORMAT(tr.ExitTime, 'yyyy-MM') AS [Month],
                                COUNT(t.TicketID) AS TotalTickets,
                            """ + sumQuery + """
                                             SUM(tr.TotalAmount) AS TotalRevenue
                                             
                                             FROM Transactions tr
                                             JOIN Tickets t ON tr.TicketID = t.TicketID
                                             JOIN VehicleTypes vt ON t.TypeID = vt.TypeID
                                             
                                             WHERE CAST(tr.ExitTime AS DATE) 
                                             BETWEEN ?
                                             AND ?
                                             GROUP BY FORMAT(tr.ExitTime, 'yyyy-MM')
                                             ORDER BY [Month];
                                             """;
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, startDate);
            stm.setString(2, endDate);
            rs = stm.executeQuery();

            while (rs.next()) {
                Report report = new Report();
                ArrayList<BigDecimal> vehicleRevenueList = report.getVehicleRevenueList();
                String month = rs.getString("month");
                int totalTickets = rs.getInt("TotalTickets");

                for (VehicleType v : vehicleList) {
                    BigDecimal vehicleRevenue = rs.getBigDecimal(v.getTypeName());
                    vehicleRevenueList.add(vehicleRevenue);
                }

                BigDecimal totalRevenue = rs.getBigDecimal("TotalRevenue");

                report.setMonth(month);
                report.setTotalTickets(totalTickets);
                report.setTotalAmount(totalRevenue);
                reportList.add(report);
            }

            return reportList;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public Report getTotalAmountAndTickets(String startDate, String endDate) {
        try {
            String strSQL = """
                            select sum(TotalAmount)  as TotalAmount, count(TicketID) as totalTickets from Transactions tr WHERE CAST(tr.ExitTime AS DATE) BETWEEN ? AND ?
                            """;

            stm = connection.prepareStatement(strSQL);
            stm.setString(1, startDate);
            stm.setString(2, endDate);
            rs = stm.executeQuery();
            Report report = new Report();

            while (rs.next()) {

                BigDecimal totalAmount = rs.getBigDecimal("totalAmount");
                int totalTickets = rs.getInt("totalTickets");

                report.setTotalAmount(totalAmount);
                report.setTotalTickets(totalTickets);

            }

            return report;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
