//
//  ViewController.swift
//  MedicineReminder
//
//  Created by Aml Sakr on ٣/١٠/٢٠٢٠.
//  Copyright © 2020 Aml Sakr. All rights reserved.
//

import UIKit
import DatePickerDialog

class ViewController: UIViewController {

    @IBOutlet weak var horizontalCollectionView: UICollectionView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var pinkView: UIView!
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var notificationIV: UIImageView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var showAddingPopUp: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.horizontalCollectionView.dataSource = self
//        self.horizontalCollectionView.delegate = self
//
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        let tabgestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.showDatePicker(sender:)))
       dateView.addGestureRecognizer(tabgestureRecognizer)
    }


    @objc func showDatePicker (sender : UITapGestureRecognizer){
DatePickerDialog().show("DatePicker", doneButtonTitle: "Done" ,
                                cancelButtonTitle: "Cancel" , datePickerMode: .date){
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                print(formatter.string(from: dt))
            }

        }
    }
}

//extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//
//
//}
//
//
//extension ViewController : UITableViewDelegate , UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//
//
//}
