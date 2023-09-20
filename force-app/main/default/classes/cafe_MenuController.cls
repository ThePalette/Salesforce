public without sharing class cafe_MenuController {
    @AuraEnabled(cacheable=true)
    public static Map<String,List<Item__c>> getMenuItem(){
        
            Set<String> categories = new Set<String>();
            for (item__c c : [SELECT Category__c FROM item__c]) {//look for categories and save as unique value
                categories.add(c.Category__c);
            }
            Map<String, List<Item__c>> sepratedByCategory = new Map<String, List<Item__c>>();//map to store all categories and its list as values
            for( String s: categories){
                List<item__c> tempCat = new List<item__c>();
                sepratedByCategory.put(s,tempCat);
            }
            
        List<Item__c> allItemslist= [SELECT ID, Name, Veg_Non_Veg__c,Vegan__c,Category__c,Price__c,Item_Image_Url__c,Description__c from Item__c];
        if(allItemslist!=null){
            for (Item__c eachItem : allItemslist) {
                if (sepratedByCategory.containsKey(eachItem.Category__c) ) {
                    System.debug('category is '+eachItem.Category__c+' and it matched');
                    List<Item__c> templst = sepratedByCategory.get(eachItem.Category__c);
                    templst.add(eachItem);
                    sepratedByCategory.put(eachItem.Category__c,templst);
                }
            }
        }
        
        System.debug('map to return'+sepratedByCategory);
        return sepratedByCategory;
    }

    /*
    @AuraEnabled(cacheable=true)
    public static Map<String,List<Item__c>> getMenuItem(){
        Map<String, List<Item__c>> sepratedByCategory = new Map<String, List<Item__c>>();//map to store all categories and its list as values
        List<Item__c> starterList = new List<Item__c>();// list storing starter
        List<Item__c> mainCourseList = new List<Item__c>();// list storing main course
        List<Item__c> DessertList = new List<Item__c>();// list storing dessert

        List<Item__c> allItemslist= [SELECT ID, Name, Veg_Non_Veg__c,Category__c,Price__c from Item__c];
        if(allItemslist!=null){
            for (Item__c eachItem : allItemslist) {
                if (eachItem.Category__c=='Starter') {
                    starterList.add(eachItem);//add to starterlist
                } else if(eachItem.Category__c=='Main Course'){
                    mainCourseList.add(eachItem);//add to main course list
                }else if(eachItem.Category__c=='Dessert'){
                    DessertList.add(eachItem);//add to Desssert list
                }
            }
        }
        sepratedByCategory.put('Starter',starterList);
        sepratedByCategory.put('Main Course',mainCourseList);
        sepratedByCategory.put('Dessert',DessertList);
        System.debug('map to return'+sepratedByCategory);
        return sepratedByCategory;
    }
    */
}