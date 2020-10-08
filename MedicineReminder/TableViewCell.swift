//
//  TableViewCell.swift
//  MedicineReminder
//
//  Created by Aml Sakr on ٥/١٠/٢٠٢٠.
//  Copyright © 2020 Aml Sakr. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var medicineImage: UIImageView!
    
    @IBOutlet weak var medicineTime: UILabel!
    @IBOutlet weak var medicineAmount: UILabel!
    @IBOutlet weak var medicineName: UILabel!
    
    @IBOutlet weak var medicineNotificatiion: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
