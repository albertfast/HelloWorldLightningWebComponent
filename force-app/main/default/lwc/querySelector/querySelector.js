import { LightningElement } from 'lwc';

export default class QuerySelector extends LightningElement {
    colors = ["Blue", "Green", "Yellow", "Orange", "Red",];
    clickHandler(){
        //Single Element
        const elem = this.template.querySelector('h1');
        console.log(elem.innerText);
        elem.style.border = '2px solid green';
        elem.style.backgroundColor = 'yellow';

        //Multiple Element
        const colorElems = this.template.querySelectorAll('.color');
        colorElems.forEach(item => {
            console.log(item.innerText);
            item.style.border = '2px solid yellow';
            item.setAttribute("class", "slds-align_absolute-center");    
        })

        //lwc:dom="manual"
        const childElem = this.template.querySelector('.child');
        childElem.innerHTML('<p>I have got added after the button click!</p>');
        
    }
}