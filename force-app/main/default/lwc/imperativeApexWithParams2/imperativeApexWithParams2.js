import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import getOpportunitiesByStage from '@salesforce/apex/OpportunityController.getOpportunitiesByStage';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';

export default class ImperativeApexWithParams2 extends LightningElement {
    stageOptions = [];
    selectedStage;
    opps;
    error;

    @wire(getObjectInfo, {objectApiName: OPPORTUNITY_OBJECT})
    accountInfo;

    @wire(getPicklistValues, {fieldApiName: STAGE_FIELD , recordTypeId: '$accountInfo.data.defaultRecordTypeId'})
    picklistHandler({data,error}){
        if (data) {
            console.log(data);
            this.stageOptions = this.picklistGenerator(data);
        }
        if (error) {
            console.error(error);
        }
    }

    picklistGenerator(data){
        return data.values.map(item => ({
            label: item.label,
            value: item.value
        }))
    }

    stageHandler(event){
        this.selectedStage = event.target.value;
        getOpportunitiesByStage({stage: this.selectedStage})
            .then(result => {
                console.log(result);
                this.opps = result;
            })
            .catch(error => {
                console.error(error);
                this.error = error;
            })
    }
}