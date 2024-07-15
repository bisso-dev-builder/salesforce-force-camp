import { api, LightningElement, track, wire } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import { NavigationMixin } from 'lightning/navigation';

import { CurrentPageReference } from 'lightning/navigation';

import { getPicklistValues } from "lightning/uiObjectInfoApi";

import search from '@salesforce/apex/SearchAddressController.search';

import OPPORTUNITY_STAGE from '@salesforce/schema/Opportunity.StageName'

import OPPORTUNITY from '@salesforce/schema/Opportunity'

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
    
    searchTerm;    

    @wire(getPicklistValues, { recordTypeId: "012000000000000AAA", fieldApiName: OPPORTUNITY_STAGE })
    opportunityStageNames;

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

        this.searchTerm =  event.detail.searchTerm;

        const _results = await search ( { term: event.detail.searchTerm
                                  , recordTypeDeveloperName : 'Billing' } );

        // search( { term: event.detail.searchTerm, recordTypeDeveloperName : 'Billing' }  )
        //     .then (result => {

        //     }).catch ((e) => {
                
        //     }).finally (() => {

        //     })
        
        _lookup.setSearchResults(_results);
    }

    // @wire( search, { term: '$searchTerm', recordTypeDeveloperName : 'Billing' }  )
    // search ({error, data}) {

    //     if (error) {    
    //         console.log (error);
    //         return;
    //     }

    //     if (data) {
    //         this.refs.billingLookup.setSearchResults(data);
    //     }

    // }   


    handleSelectedAddress (event) {

        
        const selectedIds = event.detail;
        // Or, get the selection objects with ids, labels, icons...
        const selection = event.target.getSelection();

        console.log ( selectedIds );

        console.log ( selection );

    }


}