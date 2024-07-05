import { LightningElement } from 'lwc';

export default class Address extends LightningElement {


    zipCode;
    street;
    streetNumber;
    additionalInfo;
    state;
    city;

    handleChange (event) {

        console.log(event)
        
        this[event.target.dataset.fieldName] = event.target.value;

    }

}