import { api, LightningElement, track, wire } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import { NavigationMixin } from 'lightning/navigation';

import { CurrentPageReference } from 'lightning/navigation';

import search from '@salesforce/apex/SearchAddressController.search';

const _addressDisplayInfo = {
    primaryField: 'Address__c.Address__Street__c',
    additionalFields: ['Address__City__s', 'Address__PostalCode__s'],
};

export default class NewOpportunity extends NavigationMixin(LightningElement) {


    @api
    get recordId () {
        return this._recordId        
    }

    set recordId (value) {
        if (!value)
        this._recordId = value;
    }

    
    @wire(CurrentPageReference)
    pageRef;

    @track addressPickerInfo = _addressDisplayInfo;

    handleSuccess (event) {

        this.showSuccess ('Registro criado com sucesso');

        this.gotoCreatedRecord(event.detail.id);

    }

    showSuccess (message) {

        this.dispatchEvent (new ShowToastEvent ({
            title: 'Success',
            message: message,
            variant: 'success',
        }));

    }


    gotoCreatedRecord (_id) {

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: _id,
                actionName: 'view',
            },
        });

    }


    async handleSearchAddress(event) {

        let _lookup = event.target;

        const _results = await search ( { term: event.detail.searchTerm
                                , recordTypeDeveloperName : 'Billing' } );

        _lookup.setSearchResults(_results);

    }

    handleSelectedAddress (event) {

        
        const selectedIds = event.detail;
        // Or, get the selection objects with ids, labels, icons...
        const selection = event.target.getSelection();

        console.log ( selectedIds );

        console.log ( selection );

    }

}