/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author TNO
 */
public class GetDataUtils {

    public static String formatToVND(int amount) {
        // Sử dụng Locale của Việt Nam để định dạng tiền tệ
        Locale vietnam = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(vietnam);
        // Định dạng số tiền
        return currencyFormatter.format(amount);
    }

    public static int parsePrice(String priceString) {
        // Loại bỏ tất cả các ký tự không phải là số
        String numericString = priceString.replaceAll("[^\\d]", "");

        // Chuyển chuỗi đã được làm sạch sang số nguyên
        return Integer.parseInt(numericString);
    }
}
