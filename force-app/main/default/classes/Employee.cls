public virtual class Employee {

    public String name;
    
    public Decimal salary;   

    public Employee() {
        System.debug('Construtor Employee');
    }

    virtual
    public Decimal getBonus () {
        return salary * 1.2;       
    }

}