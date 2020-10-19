//
//  AddMedicineDialog.swift
//  MedicineReminder
//
//  Created by Aml Sakr on ٨/١٠/٢٠٢٠.
//  Copyright © 2020 Aml Sakr. All rights reserved.
//

import UIKit

class AddMedicineDialog: UIViewController {

    
    @IBOutlet weak var addMedicineButton: UIButton!
    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var amountPerOnce: UIStepper!
    @IBOutlet weak var amountPerDayStepper: UIStepper!
    @IBOutlet weak var medicineAmountTF: UITextField!
    @IBOutlet weak var medicineNameTF: UITextField!
    
    @IBOutlet weak var amountPerOnceLabel: UILabel!
    @IBOutlet weak var amountPerDayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let bluePlaceholderText = NSAttributedString(string: "My Placeholder",attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.002055287128, green: 0.1797346175, blue: 0.6753929257, alpha: 1)])
        medicineNameTF.attributedPlaceholder = bluePlaceholderText
        medicineAmountTF.attributedPlaceholder = bluePlaceholderText
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

 
    
    @IBAction func changeAmountPerDay(_ sender: UIStepper) {
        amountPerDayLabel.text = String(Int(amountPerDayStepper.value))
    }
    @IBAction func changeAmountPerOnce(_ sender: UIStepper) {
        amountPerOnceLabel.text = String(Int(amountPerOnce.value))
    }
    
    @IBAction func addMedicineToDB(_ sender: Any) {
        let name = medicineNameTF.text!
        let quant = Int(medicineAmountTF.text!)!
        
        let medicine = Medicine(medicineName: name, medicineDescription: "gggggg", medicineQuantity: quant, numberOfTimePerDay: Int(amountPerDayStepper.value), numberOfTimePerOnce: Int(amountPerOnce.value), allowNotification: notificationSwitch.isOn, medicineStartTime: "12:00")
        let realm = MedicineData()
        realm.addMedicine(medicine: medicine)
    }
}
