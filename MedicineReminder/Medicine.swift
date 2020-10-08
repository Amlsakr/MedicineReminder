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
    @objc dynamic var numberOfTimePerMonth = 0
    @objc dynamic var allowNotification = false
    @objc dynamic var medicineQuantity  = 0
    @objc dynamic var medicineStartTime = ""
    
    
    
    
}
