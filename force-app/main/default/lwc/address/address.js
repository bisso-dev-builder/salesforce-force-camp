import { api, LightningElement, track } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const STATES = [ {label : "Rio de Janeiro", value : "RJ"},
    {label : "São Paulo", value : "SP"},
    {label : "Paraná", value : "PR"}
];

const CITIES = [ {label : "Rio de Janeiro", value : "Rio de Janeiro"},
    {label : "São Paulo", value : "São Paulo"},
    {label : "Curitiba", value : "Curitiba"}
];

export default class Address extends LightningElement {

    @api 
    get zipCode () {
        return this._zipCode;
    } 

    set zipCode (value) {
        if (!value) return;
        this._zipCode = value;
        
        if (this.refs.zipCodeComponent) {
            this.refs.zipCodeComponent.zipCode = this._zipCode;
        }
    } 

    street;
    streetNumber;
    additionalInfo;
    state;
    city;
    cities;
    states;

    @track addresses = [];

    connectedCallback () {
        this.cities = CITIES;
        this.states = STATES;        
    }

    handleChange (event) {

        console.log(event)
        
        this[event.target.dataset.fieldName] = event.target.value;

    }

    handleAdd (event) {

        this.addresses.push ( { sequence : this.addresses.length, 
                zipCode : this.zipCode,
                street : this.street,
                state : this.state,
                city : this.city } );

    }


    isValid () {
        
        //let zipComponent = this.template.querySelector('c-zip-code');

        return this.refs.zipCode.isValid();

    }

    showError (message) {

        const event = new ShowToastEvent({
            title: 'Error',
            message: message,
            variant: 'error',
        });

        this.dispatchEvent(event);
    } 

    handleChangedAddress (event) {

        this.zipCode = event.detail.zipCode;
        this.street = event.detail.street;
        this.state = event.detail.state;
        this.city = event.detail.city;

        this.publishAddressFound ();

    } 


    publishAddressFound () {

        const address = {
            zipCode : this.zipCode,
            street : this.street,
            state :this.state,
            city :this.city
        }

        this.dispatchEvent ( new CustomEvent ('addressfound', {detail:address}) );

    } 


}