import { getRecords } from 'lightning/uiRecordApi';
import { LightningElement, track, wire } from 'lwc';

import ACCNAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import CONNAME_FIELD from '@salesforce/schema/Contact.Name';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';


export default class GetRecordsMultipleObjects extends LightningElement {

    @track accounts;
    @track contacts;

    @wire(getRecords, {
        records: [
            {
                recordIds: ["001Dn00000BxmouIAB"],
                fields: [ACCNAME_FIELD, INDUSTRY_FIELD]
            },
            {
                recordIds: ["003Dn000007Xv44IAC", "003Dn000007Xv4GIAS"],
                fields: [CONNAME_FIELD, TITLE_FIELD]
            }
        ]
    })
    recordsHandler({data, error}){
        if (data) {
            console.log(data);
            this.accounts = data.results[0];
            this.contacts = data.results[1];
        }
        if (error) {
            console.error(error);
        }
    }
}