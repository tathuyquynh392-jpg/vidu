
package com.codegym;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CalculatorServlet",
            urlPatterns = "/calculator")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {
            double firstOperand = Double.parseDouble(
                request.getParameter("firstOperand")
            );

            double secondOperand = Double.parseDouble(
                request.getParameter("secondOperand")
            );

            String operatorInput =
                request.getParameter("operator");

            char operator = operatorInput.charAt(0);

            Calculator calculator = new Calculator();

            double result = calculator.calculate(
                firstOperand,
                secondOperand,
                operator
            );

            request.setAttribute("firstOperand", firstOperand);
            request.setAttribute("secondOperand", secondOperand);
            request.setAttribute("operator", operator);
            request.setAttribute("result", result);

        } catch (ArithmeticException e) {
            request.setAttribute("error", e.getMessage());

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Dữ liệu nhập không hợp lệ!");

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("/result.jsp")
               .forward(request, response);
    }
}
