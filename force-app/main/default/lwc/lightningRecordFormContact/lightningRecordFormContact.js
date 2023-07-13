import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import LEADSOURCE_FIELD from '@salesforce/schema/Contact.LeadSource';
import TITLE from '@salesforce/schema/Contact.Title';

export default class LightningRecordFormContact extends LightningElement {
    objectName = CONTACT_OBJECT;
    conFields = [FIRSTNAME_FIELD, LASTNAME_FIELD, LEADSOURCE_FIELD, TITLE];
}