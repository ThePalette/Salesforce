import { LightningElement, wire, track } from "lwc";
import Menumap from '@salesforce/apex/cafe_MenuController.getMenuItem';


export default class Cafe_Menu extends LightningElement {
/*
  @track columns = [
    { label: 'Category', fieldName: 'Category__c' },
    { label: 'Name', fieldName: 'Name' },
    { label: 'Price', fieldName: 'Price__c', type: 'currency' },
    { label: 'Veg_Non_Veg__c', fieldName: 'Veg_Non_Veg__c' },
];*/

@track mapData= [];


  @wire(Menumap)
  wiredResult(result) { 
    if (result.data) {
        //mapData = [];
        var conts = result.data;
        for(var key in conts){
            this.mapData.push({value:conts[key], key:key}); //Here we are creating the array to show on UI.
        }
    }
} 
}