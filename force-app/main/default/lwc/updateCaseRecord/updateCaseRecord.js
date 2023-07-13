import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';

const FIELDS = [SUBJECT_FIELD, DESCRIPTION_FIELD, PRIORITY_FIELD, STATUS_FIELD];

export default class UpdateCaseRecord extends LightningElement {
    recordId = '500Dn000004Mb9aIAC';
    fields = {};

    @wire(getRecord, {recordId : '$recordId', fields: FIELDS})
    caseRec;

    changeHandler(event) {
        const {name, value} = event.target;
        this.fields[name] = value;
    }

    updateCase(){
        this.fields['Id'] = this.recordId;
        const recordInput = {
            fields : this.fields
        };
        updateRecord(recordInput)
            .then(result => {
                console.log(result);
                this.displayToast("Success", "The record has been updated succesfully!", "success");
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