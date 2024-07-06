import { api, LightningElement } from 'lwc';

import findAddressByZipCode from '@salesforce/apex/AddressController.findAddressByZipCode';

export default class ZipCode extends LightningElement {

    @api
    get zipCode () {
        return this._zipCode;
    }
    
    set zipCode (value) {
        if (!value) return;
        this._zipCode = value;
    }    
    
    handleChange (event) {

        console.log(event)
        
        this[event.target.dataset.fieldName] = event.target.value;

        findAddressByZipCode( {zipCode: this.zipCode} ).then (result => {

            let _address = result;

            this.publishChange(_address);

        });

        

    }

    publishChange (_address) {
        
        const event = new CustomEvent( 'selectedaddress' ,  { detail : _address});

        this.dispatchEvent(event);

    }


    @api
    isValid () {    
        return this.zipCode;
    }


}