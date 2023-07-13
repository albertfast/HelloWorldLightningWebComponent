import { LightningElement } from 'lwc';
import signinTemplate from './signinTemplate.html';
import signupTemplate from './signupTemplate.html';
import renderTemplate from './render.html';

export default class Render extends LightningElement {
    selectedButton;

    render(){
        return this.selectedButton === "Signin" ? signinTemplate 
             : this.selectedButton === "Signup" ? signupTemplate 
             : renderTemplate;
    }

    changeHandler(event){
        this.selectedButton = event.target.label;

    }
}