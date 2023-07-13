import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import CASE_OBJECT from '@salesforce/schema/Case';

export default class GetCasePicklistValues extends LightningElement {
    maintenanceRtId;
    typeOptions = [];
    reasonOptions = [];
    selectedType;
    selectedReason;

    @wire(getObjectInfo, {objectApiName: CASE_OBJECT})
    objectInfoHandler({data, error}) {
        if (data) {
            console.log(data);
            const rtids = data.recordTypeInfos;
            this.maintenanceRtId = Object.keys(rtids).find(rtid => (rtids[rtid].name === "Maintenance"));
            console.log('maintenanceRtId: ' + this.maintenanceRtId);
        }
        if (error) {
            console.error(error);
        }
    }

    @wire(getPicklistValuesByRecordType, {objectApiName: CASE_OBJECT, recordTypeId: '$maintenanceRtId'})
    picklistHandler({data, error}){
        if (data) {
            console.log(data);
            this.typeOptions = this.picklistGenarator(data.picklistFieldValues.Type);
            this.reasonOptions = this.picklistGenarator(data.picklistFieldValues.Reason);   

        }
        if (error) {
            console.error(error);
        }
    }

    picklistGenarator(info){
      return info.values.map(item => ({
            label : item.label,
            value: item.value
       }));
    }

    changeHandler(event){
        const field = event.target.name;
        if (field == "type") {
            this.selectedType = event.target.value;
        } else if (field == "reason") {
            this.selectedReason = event.target.value;
        }
    }
}