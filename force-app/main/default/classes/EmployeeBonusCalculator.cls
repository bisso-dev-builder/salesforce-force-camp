
public class EmployeeBonusCalculator {
    
    Decimal totalBonus;

    public EmployeeBonusCalculator() {
        totalBonus = 0;
    }

    public void calculateBonus ( Employee employee ) {
        totalBonus += employee.getBonus();
    }

    public Decimal getTotalBonus() {
        return this.totalBonus;
    }
    

}