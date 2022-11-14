import { LightningElement,api,track } from 'lwc';
import addStudent from '@salesforce/apex/StudentOperationsServiceController.saveStudent';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class StudentOperationsTestLwc extends LightningElement {
    @api recordId;
    @track firstname;
    @track lastName;
    @track gender;
    @track FatherName;
    @track teluguMarks;
    @track hindiMarks;
    @track mathsMarks;
    @track socialMarks;
    @track englishMarks;

    valueChanged(event) {
        var inputTypeName = event.target.label;
        console.log('@@@@@ Input Event TValue @@@@@@@ '+inputTypeName);

        if(inputTypeName == 'First Name') {
            this.firstname = event.detail.value;
            console.log('@@@@@ First Name @@@@@@@ '+this.firstname);
        }
        if(inputTypeName == 'Last Name') {
            this.lastName = event.detail.value;
            console.log('@@@@@ Last Name @@@@@@@ '+this.lastName);
        }
        if(inputTypeName == 'Gender') {
            this.gender = event.detail.value;
            console.log('@@@@@ Gender @@@@@@@ '+this.gender);
        }
        if(inputTypeName == 'City') {
            this.city = event.detail.value;
            console.log('@@@@@ Gender @@@@@@@ '+this.city);
        }
        if(inputTypeName == 'Father Name') {
            this.fatherName = event.detail.value;
            console.log('@@@@@ Father Name @@@@@@@ '+this.FatherName);
        }
        if(inputTypeName == 'Telugu Marks') {
            this.teluguMarks = event.detail.value;
            console.log('@@@@@ Telugu Marks @@@@@@@ '+this.teluguMarks);
        }
        if(inputTypeName == 'Hindi Marks') {
            this.hindiMarks = event.detail.value;
            console.log('@@@@@ Hindi Marks @@@@@@@ '+this.hindiMarks);
        }
        if(inputTypeName == 'Maths Marks') {
            this.mathsMarks = event.detail.value;
            console.log('@@@@@ Maths Marks @@@@@@@ '+this.mathsMarks);
        }
        if(inputTypeName == 'Social Marks') {
            this.socialMarks = event.detail.value;
            console.log('@@@@@ Social Marks @@@@@@@ '+this.socialMarks);
        }
        if(inputTypeName == 'English Marks') {
            this.englishMarks = event.detail.value;
            console.log('@@@@@ English Marks @@@@@@@ '+this.englishMarks);
        }
     }
    handleOnSave() {
        console.log('@@@@@@@@ First Name @@@@@@@'+this.firstname);
        console.log('@@@@@@@@ Last Name @@@@@@@'+this.lastName);
        console.log('@@@@@@@@ Gender @@@@@@@'+this.gender);
        console.log('@@@@@@@@ City @@@@@@@'+this.city);
        console.log('@@@@@@@@ Father Name @@@@@@@'+this.fatherName);
        console.log('@@@@@@@@ Telugu Marks @@@@@@@'+this.teluguMarks);
        console.log('@@@@@@@@ Hindi Marks @@@@@@@'+this.hindiMarks);
        console.log('@@@@@@@@ Maths Marks @@@@@@@'+this.mathsMarks);
        console.log('@@@@@@@@ Social Marks @@@@@@@'+this.socialMarks);
        console.log('@@@@@@@@ English Marks @@@@@@@'+this.englishMarks);
        addStudent({firstname: this.firstname, lastName: this.lastName, gender: this.gender, city: this.city, fatherName : this.fatherName, teluguMarks : this.teluguMarks, hindiMarks : this.hindiMarks, mathsMarks : this.mathsMarks, socialMarks : this.socialMarks, englishMarks : this.englishMarks})
                        .then(result => {
                            if(result==true) {
                                 this.dispatchEvent(
                                        new ShowToastEvent({
                                            title: 'Success!!',
                                            message: "Student Record Created Successfully.",
                                            variant: 'success'}),);
                            }
                        })
                        .catch(error => {})
    }
    handleOnDelete() {

    }
    handleOnUpdate() {

    }
}