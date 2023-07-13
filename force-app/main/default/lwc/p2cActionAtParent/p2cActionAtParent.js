import { LightningElement } from 'lwc';
import searchContacts from '@salesforce/apex/ContactController.searchContacts';

const COLUMNS = [
    { label: 'FirstName', fieldName: 'FirstName', type: 'text' },
    { label: 'LastName', fieldName: 'LastName', type: 'text' },
    { label: 'Title', fieldName: 'Title', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'email' }
];

export default class P2cActionAtParent extends LightningElement {
    input;
    contacts;
    columns = COLUMNS;
    
    searchHandler(event){
        this.input = event.target.value;
        searchContacts({searchKey: this.input})
            .then(result =>{
              this.contacts = result;  
            })
            .catch(error =>{
                 console.log(error); 
              })
    }
}