import { getObjectInfos } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import CONTACT_OBJECT from '@salesforce/schema/Contact';


export default class GetObjectInfosDemo extends LightningElement {
    accRtId;
    conRtId;
    @wire(getObjectInfos, {objectApiNames: [ACCOUNT_OBJECT, CONTACT_OBJECT] })
    objectInfosHandler({data, error}){
        if (data) {
            console.log(data);
            this.accRtId = data.results[0].result.defaultRecordTypeId;
            this.conRtId = data.results[1].result.defaultRecordTypeId;
        }
        if (error) {
            console.error(error);
        }
    }
}