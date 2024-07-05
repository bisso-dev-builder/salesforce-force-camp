import { LightningElement } from 'lwc';

export default class SecondLevelComponent extends LightningElement {

    constructor () {
        super();
        console.log('....Execute constructor - SecondLevelComponent');
    }    

    connectedCallback() {
        console.log('....connectedCallback - SecondLevelComponent');
    }

    renderedCallback () {
        console.log('....renderedCallback - SecondLevelComponent');
    }

    disconnectedCallback () {
        console.log('....disconnectedCallback - SecondLevelComponent');
    }


}