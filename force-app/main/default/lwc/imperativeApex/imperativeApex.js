import { LightningElement } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunityController.getOpportunities';

const COLUMNS = [
    { label: 'Opp Name', fieldName: 'Name' , type: 'text'},
    { label: 'Opp Type', fieldName: 'Type', type: 'text' },
    { label: 'Stage', fieldName: 'StageName', type: 'text' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' }
    
];

export default class ImperativeApex extends LightningElement {
    opps;
    error;
    columns = COLUMNS;

    getOpps(){
        getOpportunities()
          .then(result => {
            this.opps = result;
          })
          .catch(error => {
            this.error = error;
          })  
    }


}