import { LightningElement,track,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class DatatablewithWire extends LightningElement {
    @track data;
    @track columns = [
    { label: 'Label', fieldName: 'Name', type: 'Text' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Industry', fieldName: 'Industry', type: 'Text' },
    ];
    @wire (getAccounts) accounts({error,data}){
        if(data){
            this.data = data;
        }
        else if (error){
            this.data = undefined;
        }
    }
}
 