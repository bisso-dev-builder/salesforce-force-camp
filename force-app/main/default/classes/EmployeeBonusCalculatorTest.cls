@isTest
public class EmployeeBonusCalculatorTest {
 
    
    @isTest
    public static void shouldCalculateBonus () {

        Manager manager = new Manager();
        manager.salary = 20000;
        Advisor advisor = new Advisor();
        advisor.salary = 10000;

        EmployeeBonusCalculator calculator = new EmployeeBonusCalculator();
        calculator.calculateBonus(advisor);
        calculator.calculateBonus(manager);
        System.debug( calculator.getTotalBonus() );


        
    }

}