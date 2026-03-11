/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author Admin
 */
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

public class FormatCurrency {

    private static final Locale VIETNAM = new Locale("vi", "VN");
    private static final NumberFormat VND_FORMAT = NumberFormat.getInstance(VIETNAM);

    public static String formatVND(BigDecimal amount) {
        if (amount == null) {
            return "0 ₫";
        }
        return VND_FORMAT.format(amount) + "₫";
    }
}
