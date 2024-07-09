import { api, LightningElement, track } from 'lwc';

import findById from '@salesforce/apex/LeadAddressController.findById';
import save from '@salesforce/apex/LeadAddressController.save';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import { RefreshEvent } from 'lightning/refresh';

export default class LeadAddress extends LightningElement {

    @api
    get recordId () {
        return this._recordId;
    }
    
    set recordId (value) {
        
        if (!value) return;

        this._recordId = value;

        this.findById(this._recordId);
    }

    loading = false;

    @track lead;

    findById(id) {

        console.log ('start call findById');

        this.loading = true;

        findById({id : id}).then( result => {

            console.log('findById - processing result');

            this.lead = result;

        }).finally ( () => {

            this.loading = false;

        }) ;

        console.log ('end call findById');

    }


    get zipCode () {
        return this.lead?.PostalCode;
    }

    handleAddressFound (event) {

        this.lead.PostalCode = event.detail.zipCode;
        this.lead.Street = event.detail.street;
        this.lead.City = event.detail.city;
        this.lead.State = event.detail.state;

    }

    handleSaveAddress (event) {

        save ( {lead : this.lead}).then (result => {
            
            this.showSuccess ('endereço alterado com sucesso');

            this.dispatchEvent (new RefreshEvent());


        }).catch ( (error) => {
            console.log (error);
        }).finally (() => {

        })

    }

    showSuccess (message) {

        this.dispatchEvent (new ShowToastEvent ({
            title: 'Success',
            message: message,
            variant: 'success',
        }));

    }


}