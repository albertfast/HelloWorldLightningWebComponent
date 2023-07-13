import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, api, wire } from 'lwc';

import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ANNUAL_REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

const FIELDS = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, ANNUAL_REVENUE_FIELD];

export default class GetAccountRecord extends LightningElement {

    //recordId = '001Dn00000UIEXBIA5';
    @api recordId;
    account;

    @wire(getRecord, {recordId: '$recordId' , fields: FIELDS })
    accountInfoHandler({data, error}) {
        if (data) {
            console.log(data);
            this.account = data;
        }
        if (error) {
            console.error(error);
        }
    }
}