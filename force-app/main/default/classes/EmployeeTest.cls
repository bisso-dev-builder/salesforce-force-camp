@isTest
public class EmployeeTest {
    

    @isTest
    public static void shouldCreateEmployee () {

        Advisor advisor = new Advisor ();
        advisor.name = 'Advisor';
        advisor.salary = 10000;
        System.debug( advisor.getBonus() );
        

        Manager manager = new Manager ();
        manager.name = 'Manager';
        manager.salary = 20000;
        System.debug( manager.getBonus() );   
        
        Employee employee = manager;

        Manager castManager = (Manager) employee;

        
    }

}