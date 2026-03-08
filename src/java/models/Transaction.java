/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class Transaction {
    private int transID;
    private int ticketID;
    private LocalDateTime exitTime;
    private BigDecimal totalAmount;
    private String paymentMethod;
    private int staffID;
    private LocalDateTime createdAt;

    public Transaction() {
    }

    public Transaction(int transID, int ticketID, LocalDateTime exitTime, BigDecimal totalAmount, String paymentMethod, int staffID, LocalDateTime createdAt) {
        this.transID = transID;
        this.ticketID = ticketID;
        this.exitTime = exitTime;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.staffID = staffID;
        this.createdAt = createdAt;
    }

    public int getTransID() {
        return transID;
    }

    public void setTransID(int transID) {
        this.transID = transID;
    }

    public int getTicketID() {
        return ticketID;
    }

    public void setTicketID(int ticketID) {
        this.ticketID = ticketID;
    }

    public LocalDateTime getExitTime() {
        return exitTime;
    }

    public void setExitTime(LocalDateTime exitTime) {
        this.exitTime = exitTime;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getStaffID() {
        return staffID;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
    
    
}
