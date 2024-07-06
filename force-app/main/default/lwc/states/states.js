import { LightningElement } from 'lwc';

const STATES = [ {label : "Rio de Janeiro", value : "RJ"},
    {label : "São Paulo", value : "SP"},
    {label : "Paraná", value : "PR"}
];

export default class States extends LightningElement {

    states;

    connectedCallback () {
        this.states = STATES;
    }


    handleChange (event) {

        console.log(event)
        
        this[event.target.dataset.fieldName] = event.target.value;

    }


}