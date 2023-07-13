import { LightningElement } from 'lwc';

export default class KimlikKart extends LightningElement {
    firstname;
    lastname;
    role;

    handleChange(event){
        if ( event.target.label === "First Name" ) {
            this.firstname = event.target.value;
        } else if ( event.target.label === "Last Name" ) {
            this.lastname = event.target.value;
        } else {
            this.role = event.target.value;
        }
    }

    roleOptions = [
        { label: 'Salesforce Admin', value: 'Salesforce Admin' },
        { label: 'Salesforce Developer', value: 'Salesforce Developer' },
        { label: 'Salesforce Arcitect', value: 'Salesforce Arcitect' },
    ];

    

}