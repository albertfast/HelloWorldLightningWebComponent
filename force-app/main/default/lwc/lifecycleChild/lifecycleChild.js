import { LightningElement } from 'lwc';

export default class LifecycleChild extends LightningElement {
    constructor(){
        super();
        console.log("Child constructor has been called!");  
    }
    connectedCallback(){
        console.log("Child connectedCallback has been called!");
        throw new Error("Error occurred while getting the things done!!");   
    }
    renderedCallback(){
        console.log("Child renderedCallback has been called!"); 
    }
    disconnectedCallback(){
        console.log("Child disconnectedCallback has been called!");
    }
}