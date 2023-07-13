import { LightningElement, track } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    areDetailVisible= false;
    firstName= "Ahmet";
    @track location = {
        city : "San Francisco",
        country : "U.S.A",
        region : "America"
    }

    handleChange(event){
        if(event.target.label === "Show Details"){
            this.areDetailVisible = event.target.checked;
        }
        if(event.target.label === "first name"){
            this.firstName = event.target.value;
        }
        if(event.target.label === "Enter City"){
            this.location.city = event.target.value;
        }
        
    }
}