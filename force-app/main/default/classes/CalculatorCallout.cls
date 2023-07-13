public class CalculatorCallout {
    public static double addition(double num1, double num2){
        calculatorServices.CalculatorImplPort cs = new calculatorServices.CalculatorImplPort();
       return cs.doAdd(num1, num2);
    }
    public static double subtraction(double num1, double num2){
        calculatorServices.CalculatorImplPort cs = new calculatorServices.CalculatorImplPort();
       return cs.doSubtract(num1, num2);
    }
    public static double multiplaction(double num1, double num2){
        calculatorServices.CalculatorImplPort cs = new calculatorServices.CalculatorImplPort();
       return cs.doMultiply(num1, num2);
    }
    public static double division(double num1, double num2){
        calculatorServices.CalculatorImplPort cs = new calculatorServices.CalculatorImplPort();
       return cs.doDivide(num1, num2);
    }
}