import { LightningElement, wire, track } from 'lwc';
import getAccountsDetails from '@salesforce/apex/AccountListController.getAccountsDetails';

const table_columns = [
    { label: 'Name', fieldName: 'Name', type: 'text'},
    { label: 'Website', fieldName: 'Website', type: 'url'},
    { label: 'Description', fieldName: 'Description', type: 'text'},
];

export default class AccountList extends LightningElement {
    @track columns = table_columns;

    @wire(getAccountsDetails) accounts;
}