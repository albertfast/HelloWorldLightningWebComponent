import { LightningElement } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class DeeleteRecord extends LightningElement {
    recordId;
    changeHandler(event){
        this.recordId = event.target.value;
    }
    deleteRec(){
        deleteRecord(this.recordId)
        .then(result => {
            console.log(result);
            this.displayToast("Success", "The record has been deleted succesfully!", "success");
        })
        .catch(error => {
            console.error(error);
            this.displayToast("Error", error.body.message, "error");
        })
    }
        displayToast(title, message, variant){
            const toast = new ShowToastEvent({title,message, variant});
            this.dispatchEvent(toast);
        }
    }
