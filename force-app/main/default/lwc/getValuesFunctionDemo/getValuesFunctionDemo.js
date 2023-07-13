import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, api, wire } from 'lwc';

import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ANNUAL_REVENUE from '@salesforce/schema/Account.AnnualRevenue';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
const FIELDS = [NAME_FIELD, INDUSTRY_FIELD, ANNUAL_REVENUE, PHONE_FIELD];

export default class GetValuesFunctionDemo extends LightningElement {
   // recordId = '001Dn00000BxmotIAB';
   @api recordId;
    name;
    industry;
    revenue;P
    phone;

    @wire(getRecord, {recordId: '$recordId', fields: FIELDS })
    accountHandler({data, error}){
        if (data) {
            console.log(data);
           this.name = getFieldValue(data, NAME_FIELD);
           this.industry = getFieldValue(data, INDUSTRY_FIELD);
           this.revenue = getFieldValue(data, ANNUAL_REVENUE);
           this.phone = getFieldValue(data, PHONE_FIELD);
          
        }
        if (error) {
            console.error(error);
        }
    }
}