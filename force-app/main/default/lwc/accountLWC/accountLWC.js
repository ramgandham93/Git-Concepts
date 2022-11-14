import { LightningElement,api,track } from 'lwc';
import addAccount from '@salesforce/apex/AccountLWCHandler.saveAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class accountLWC extends LightningElement {
    @track accountName;
    @track description;
    @track accountNumber;
    @track site;
    @track type;


    valueChanged(event) {
        var inputTypeName = event.target.label;
        console.log('@@@@@ Input Event TValue @@@@@@@ '+inputTypeName);

        if(inputTypeName == 'Account Name') {
            this.accountName = event.detail.value;
            console.log('@@@@@ Account Name @@@@@@@ '+this.accountName);
        }
        if(inputTypeName == 'Description') {
            this.description = event.detail.value;
            console.log('@@@@@ Description @@@@@@@ '+this.description);
        }
        if(inputTypeName == 'Account Number') {
            this.accountNumber = event.detail.value;
            console.log('@@@@@ Description @@@@@@@ '+this.accountNumber);
        }
        if(inputTypeName == 'Site') {
            this.site = event.detail.value;
            console.log('@@@@@ Description @@@@@@@ '+this.site);
        }
        if(inputTypeName == 'Type') {
            this.type = event.detail.value;
            console.log('@@@@@ Description @@@@@@@ '+this.type);
        }
     }
    handleOnSave() {
        console.log('@@@@@@@@ Account Name @@@@@@@'+this.accountName);
        console.log('@@@@@@@@ Description @@@@@@@'+this.description);
        console.log('@@@@@@@@ Account Number @@@@@@@'+this.accountNumber);
        console.log('@@@@@@@@ Site @@@@@@@'+this.site);
        console.log('@@@@@@@@ Type @@@@@@@'+this.type);
        addAccount({accountName: this.accountName,description: this.description,accountNumber: this.accountNumber,site: this.site,type: this.type})
                        .then(result => {
                            if(result==true) {
                                 this.dispatchEvent(
                                        new ShowToastEvent({
                                            title: 'Success!!',
                                            message: "Account Record Created Successfully.",
                                            variant: 'success'}),);
                            }
                        })
                        .catch(error => {})
    }
    
}