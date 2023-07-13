import { LightningElement } from 'lwc';

export default class C2pParentComponent extends LightningElement {
    showModal = false;
    message;

    modalHandler(){
       this.showModal = true; 
    }
    closeHandler(event){
        this.showModal = false;
        this.message = event.detail;
    }
}