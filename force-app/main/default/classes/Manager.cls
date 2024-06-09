public class Manager extends Employee {
    
    public Manager() {
        super();
    }

    override
    public Decimal getBonus () {
        Decimal bonus = super.getBonus();
        return bonus + 7000;       
    } 

}