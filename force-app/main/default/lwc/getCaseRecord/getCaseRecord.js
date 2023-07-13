import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, api, wire } from 'lwc';

export default class GetCaseRecord extends LightningElement {
// recordId = '500Dn0000082gIwIAI';
    @api recordId;
    subject;
    priority;
    status;
    caseNumber;

    @wire(getRecord, {recordId: '$recordId', layoutTypes: ['Compact'], modes: ['View']})
    caseRecordHandler({data, error}) {
        if (data) {
            console.log(data);
            this.subject = data.fields.Subject.value;
            this.priority = data.fields.Priority.value;
            this.status = data.fields.Status.value;
            this.caseNumber = data.fields.CaseNumber.value;
        }
        if (error) {
            console.error(error);
        }
    }
}