//
//  DetailsViewController.swift
//  MedicineReminder
//
//  Created by Aml Sakr on ٤/١٠/٢٠٢٠.
//  Copyright © 2020 Aml Sakr. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var notificationIV: UIImageView!
    
    @IBOutlet weak var medicineAmount: UILabel!
    @IBOutlet weak var medicineName: UILabel!
    
    @IBOutlet weak var medicineImage: UIImageView!
    
    @IBOutlet weak var medicineTime: UILabel!
    @IBOutlet weak var medicineDescription: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
