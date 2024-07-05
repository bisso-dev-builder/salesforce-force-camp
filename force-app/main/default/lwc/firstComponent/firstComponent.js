import { LightningElement } from 'lwc';

export default class FirstComponent extends LightningElement {

    zipCode = '12220-000';
    street = 'Rua 15 Novembro';
    streetNumber = '45';
    //additionalInfo = 'bloco B';

    _additionalInfo;

    showSecondLevel;

    get additionalInfo () {
        return this._additionalInfo || 'bloco B';
    }

    set additionalInfo (value) {
        this._additionalInfo = value;
    }

    constructor () {
        super();
        console.log('Execute constructor - FirstComponent');
    }    

    connectedCallback() {
        console.log('connectedCallback - FirstComponent');
    }

    renderedCallback () {
        console.log('renderedCallback - FirstComponent');
    }

    disconnectedCallback () {
        console.log('disconnectedCallback - FirstComponent');
    }


    handleChange (event) {
        console.log (event);
    }

    handleToggleComponent (event) {
        console.log (event);
        console.log (event.target);

        this.showSecondLevel = !this.showSecondLevel;

        event.target.label = !this.showSecondLevel ? 'Show' : 'Hide';
        
    }

    handleHideComponent (event) {

        console.log (event);
        console.log (event.target);

        this.showSecondLevel = !this.showSecondLevel;
        
    }

    findAddress () {
        console.log('check zipCode');
    }

}