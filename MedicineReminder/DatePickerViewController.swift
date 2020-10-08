//
//  DatePickerViewController.swift
//  MedicineReminder
//
//  Created by Aml Sakr on ٦/١٠/٢٠٢٠.
//  Copyright © 2020 Aml Sakr. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var dialogBoxView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dialogBoxView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
