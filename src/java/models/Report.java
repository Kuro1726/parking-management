/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Report {

    private Date date;
    private int totalTickets;
    private ArrayList<BigDecimal> vehicleRevenueList;
    private ArrayList<String> vehicleTypeList;
    private ArrayList<Integer> totalTicketsByVehicleType;
    private BigDecimal totalAmount;
    private String month;
    private String topVehicle;
    private BigDecimal topRevenue;

    public Report() {
        vehicleRevenueList = new ArrayList<>();
        vehicleTypeList = new ArrayList<>();
        totalTicketsByVehicleType = new ArrayList<>();
    }

    public Report(Date date, int totalTickets, ArrayList<BigDecimal> vehicleRevenueList, BigDecimal totalAmount) {
        this.date = date;
        this.totalTickets = totalTickets;
        this.vehicleRevenueList = vehicleRevenueList;
        this.totalAmount = totalAmount;
    }
    
    public Report(String month, int totalTickets, ArrayList<BigDecimal> vehicleRevenueList, BigDecimal totalAmount) {
        this.month = month;
        this.totalTickets = totalTickets;
        this.vehicleRevenueList = vehicleRevenueList;
        this.totalAmount = totalAmount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getTotalTickets() {
        return totalTickets;
    }

    public void setTotalTickets(int totalTickets) {
        this.totalTickets = totalTickets;
    }

    public ArrayList<BigDecimal> getVehicleRevenueList() {
        return vehicleRevenueList;
    }

    public void setVehicleRevenueList(ArrayList<BigDecimal> vehicleRevenueList) {
        this.vehicleRevenueList = vehicleRevenueList;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getTopVehicle() {
        return topVehicle;
    }

    public void setTopVehicle(String topVehicle) {
        this.topVehicle = topVehicle;
    }

    public BigDecimal getTopRevenue() {
        return topRevenue;
    }

    public void setTopRevenue(BigDecimal topRevenue) {
        this.topRevenue = topRevenue;
    }

    public ArrayList<String> getVehicleTypeList() {
        return vehicleTypeList;
    }

    public void setVehicleTypeList(ArrayList<String> vehicleTypeList) {
        this.vehicleTypeList = vehicleTypeList;
    }

    public ArrayList<Integer> getTotalTicketsByVehicleType() {
        return totalTicketsByVehicleType;
    }

    public void setTotalTicketsByVehicleType(ArrayList<Integer> totalTicketsByVehicleType) {
        this.totalTicketsByVehicleType = totalTicketsByVehicleType;
    }

    
}
