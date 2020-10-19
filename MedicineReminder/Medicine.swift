//
//  Medicine.swift
//  MedicineReminder
//
//  Created by Aml Sakr on ٦/١٠/٢٠٢٠.
//  Copyright © 2020 Aml Sakr. All rights reserved.
//

import RealmSwift
class Medicine : Object {
    
    @objc dynamic var medicineName = ""
    @objc dynamic var medicineDescription = ""
    @objc dynamic var numberOfTimePerDay = 0
    @objc dynamic var numberOfTimePerOnce = 0
    @objc dynamic var allowNotification = false
    @objc dynamic var medicineQuantity  = 0
    @objc dynamic var medicineStartTime = ""
    
     init(medicineName:String ,medicineDescription:String , medicineQuantity :Int ,
         numberOfTimePerDay:Int , numberOfTimePerOnce : Int , allowNotification:Bool , medicineStartTime:String ){
        
        self.medicineName = medicineName
        self.medicineDescription = medicineDescription
        self.medicineQuantity = medicineQuantity
        self.numberOfTimePerDay = numberOfTimePerDay
        self.numberOfTimePerOnce = numberOfTimePerOnce
        self.allowNotification = allowNotification
        self.medicineStartTime = medicineStartTime
        
    }
    
    override required init() {
        
      //  fatalError("init() has not been implemented")
    }
    

    
    
}
