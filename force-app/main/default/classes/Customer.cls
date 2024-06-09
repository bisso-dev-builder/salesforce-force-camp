/**
 * @author eduardo.bisso - dev-builder
 */
public class Customer {

    public String name;
    public String email;
    public String type;
    public String status;
    public Boolean isActive;
    public Decimal balance; 
    public Long employees;
    public List<CustomerContact> contacts;

    public Date createdDate;
    public DateTime lastModifiedDate;

    public Customer () {
        this.isActive = true;
        this.status = 'Não Iniciado';        
        this.contacts = new List<CustomerContact>();
        System.debug('Construtor default');
    }

    public Customer (String name) {
        this(); // deve ser o primeiro comando do construtor
        this.name = name;
        System.debug('Construtor que recebe o name');
    }

    public Customer (String name, String status) {
        this(name);
        this.status = status;
        System.debug('Construtor que recebe o name e status');
    }

    public Customer(String name, String email, String type, String status, Boolean isActive, Decimal balance, Long employees, List<CustomerContact> contacts, Date createdDate, DateTime lastModifiedDate) {
        this.name = name;
        this.email = email;
        this.type = type;
        this.status = status;
        this.isActive = isActive;
        this.balance = balance;
        this.employees = employees;
        this.contacts = contacts;
        this.createdDate = createdDate;
        this.lastModifiedDate = lastModifiedDate;
    }


    public void addContact ( String name, String email ) {

        CustomerContact contact = new CustomerContact();
        contact.name = name;
        contact.email = email;

        contacts.add(contact);

        System.debug('Adicionado o Nome : ' + contact.name);
        System.debug('Adicionado o Email : ' + contact.email);
        System.debug('Total de Contatos : ' + contacts.size() );

    }

    public void show () {

        System.debug('Show Customer into debug log');

    }

}