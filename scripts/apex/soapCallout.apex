parksServices.ParksImplPort ps = new parksServices.ParksImplPort();
String[] parkList = ps.byCountry('United States');
System.debug(parkList);


System.debug(ParkCallout.getParksCountry('Japan'));

calculatorServices.CalculatorImplPort cs = new calculatorServices.CalculatorImplPort();
double result = cs.doDivide(22, 5);
System.debug(result);

System.debug(CalculatorCallout.addition(2, 5));
System.debug(CalculatorCallout.subtraction(18, 2));
System.debug(CalculatorCallout.multiplaction(5, 2));
System.debug(CalculatorCallout.division(5, 2));

