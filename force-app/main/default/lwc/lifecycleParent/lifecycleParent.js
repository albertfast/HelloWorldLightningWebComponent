import { LightningElement } from 'lwc';

export default class LifecycleParent extends LightningElement {
    constructor(){
        super();
        console.log("Parent constructor has been called!");   
    }
    connectedCallback(){
        console.log("Parent connectedCallback has been called!");   
    }
    renderedCallback(){
        console.log("Parent renderedCallback has been called!"); 
    }
    disconnectedCallback(){
        console.log("Parent disconnectedCallback has been called!");
    }
    errorCallback(error, stack){
        console.log("Parent errorCallback has been called!");
        console.log(error.message);
        console.log(stack);
    }

    input;
    showChild = true;
    changeHandler(event){
        this.input = event.target.value;
    }
    childHandler(){
        this.showChild = false;
    }
}