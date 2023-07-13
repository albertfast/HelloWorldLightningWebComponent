import { LightningElement } from 'lwc';

export default class ModalComponent extends LightningElement {

    closeHandler(){
        //const closeEvent = new CustomEvent('close', {detail: "This data has been sent by child component using close event!!"});
        const con = {
            firstname : "Ajda",
            lastname: "Pekkan"
        }
        const closeEvent = new CustomEvent('close', {detail: con});
        this.dispatchEvent(closeEvent);
    }
}