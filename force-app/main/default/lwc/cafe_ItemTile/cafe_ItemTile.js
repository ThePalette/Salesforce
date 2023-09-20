import { LightningElement, api } from 'lwc';
import VegLogo from "@salesforce/resourceUrl/Vegetarian";
import NonVegLogo from "@salesforce/resourceUrl/NonVegetarian";
import VeganLogo from "@salesforce/resourceUrl/Vegan";
export default class Cafe_ItemTile extends LightningElement {
    
    VegUrl= VegLogo;
    veganUrl = VeganLogo;
    NonVegUrl = NonVegLogo;
    @api itemlist;

    index = 0;
    index1 = 0;
    get vegan(){
      return this.itemlist[this.index1++].Vegan__c === 'Yes';


    }
    get Nonveg(){
        return this.itemlist[this.index++].Veg_Non_Veg__c === 'Non-Veg';

    }
}