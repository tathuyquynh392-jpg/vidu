
package com.codegym;

public class Calculator {

    public double calculate(double firstOperand,
                            double secondOperand,
                            char operator) {

        switch (operator) {
            case '+':
                return firstOperand + secondOperand;

            case '-':
                return firstOperand - secondOperand;

            case '*':
                return firstOperand * secondOperand;

            case '/':
                if (secondOperand == 0) {
                    throw new ArithmeticException(
                        "Không thể chia cho 0!"
                    );
                }
                return firstOperand / secondOperand;

            default:
                throw new IllegalArgumentException(
                    "Toán tử không hợp lệ!"
                );
        }
    }
}
