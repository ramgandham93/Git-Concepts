import { LightningElement, api } from 'lwc';
import downloadCSVForAccounts from '@salesforce/apex/FileCreationServiceController.downloadCSVForAccounts';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class DownloadAccountsCsv extends LightningElement {
    connectedCallback() {
        conosle.log('@@@@11111@@@@@');
    }
    @api recordId;
    processError(error) {
              this.dispatchEvent(
                                new ShowToastEvent({
                                    title: 'Error!!',
                                    message: JSON.stringify(error),
                                    variant: 'error',
                                }),
                        );
              }


    createAccountsCSV(event) {
        conosle.log('@@@@1@@@@@');
        getStandorts().then(result => { this.processResult(result,false);})
                      .catch(error => { this.processError(error);})
    }

     processResult(response) {
              if(response.isSuccess) {
                     if(response.result === undefined)
                     {
                        this.processError('Error');
                        return;
                     }
                     this.dispatchEvent(
                                                     new ShowToastEvent({
                                                         title: 'Success!!',
                                                         message: 'File downloaded with id -'+response.result,
                                                         variant: 'success',
                                                     }),
                                             );

               }

            }
}