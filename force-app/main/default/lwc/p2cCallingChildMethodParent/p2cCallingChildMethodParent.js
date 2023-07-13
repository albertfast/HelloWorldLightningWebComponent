import { LightningElement } from 'lwc';

export default class P2cCallingChildMethodParent extends LightningElement {
    progress = 0;

    changeHandler(event){
        this.progress = event.target.value;
    }
    resetHandler(){
       this.template.querySelector('c-progress-bar').resetProgressBar(); 
    }
}