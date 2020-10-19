//
//  MedicineData.swift
//  MedicineReminder
//
//  Created by Aml Sakr on ٦/١٠/٢٠٢٠.
//  Copyright © 2020 Aml Sakr. All rights reserved.
//

import Foundation
import RealmSwift
class MedicineData {
    var realm = try! Realm()
    
    func addMedicine(medicine : Medicine){
        try! realm.write {
            realm.add(medicine)
        }
    }
    
    func readMedicineList() -> [Medicine] {
        let listMed = realm.objects(Medicine.self)
        
        var medicine = [Medicine]()
        medicine = Array(listMed)
        return medicine
    }
}
