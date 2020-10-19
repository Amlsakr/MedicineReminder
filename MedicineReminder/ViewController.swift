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
    
    @IBOutlet weak var pinkView: UIView!
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var notificationIV: UIImageView!
    
    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var showAddingPopUp: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    var  d =  Date()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAddingPopUp.layer.masksToBounds = true
        self.showAddingPopUp.layer.cornerRadius = 10.0
        
        self.blueView.layer.cornerRadius = 15
        self.blueView.layer.masksToBounds = true
        
        self.horizontalCollectionView.dataSource = self
        self.horizontalCollectionView.delegate = self
//
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 100
        
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCell")

        self.datePicker.addTarget(self, action: #selector(reloadHorizontalData), for: .valueChanged)
        
        
        if #available(iOS 13, *)
           {
               let statusBar = UIView(frame: (UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
               statusBar.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.8941176471, blue: 0.9333333333, alpha: 1)
               UIApplication.shared.keyWindow?.addSubview(statusBar)
           } else {
              // ADD THE STATUS BAR AND SET A CUSTOM COLOR
              let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
              if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
                 statusBar.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.8941176471, blue: 0.9333333333, alpha: 1)
              }
              UIApplication.shared.statusBarStyle = .lightContent
           }

        }

    func getNumberOfDays (month : Int , year : Int ) -> Int{
        let dateComponents = DateComponents(year: year, month: month)
        let calendar = datePicker.calendar!
        let date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        print(numDays) // 31
        return numDays
    }
    func getSelectedMonth () -> Int{
        let components = datePicker.calendar.dateComponents([.day, .month, .year], from: datePicker.date)
         let month = components.month!
        return month
    }
    
    func getSelectedYear () -> Int{
        let components = datePicker.calendar.dateComponents([.day, .month, .year],
                                                            from: datePicker.date)
        let year = components.year!
        return year
    }
    func getSelectedDay() -> Int{
        let components = datePicker.calendar.dateComponents([.day, .month, .year],
                                                            from: datePicker.date)
        let day = components.day!
        return day
    }
    func getHorizontalData () -> [DayData]{
       //  =
        let month = getSelectedMonth()
        let year = getSelectedYear()
        var totaldaysRemainingInMonth = getNumberOfDays(month: month, year: year ) - getSelectedDay() + 1
        var data = [DayData]()
        print("totaldaysRemainingInMonth" + String(totaldaysRemainingInMonth))
        print(d.startOfDay + 2)
        
        for  n in 0 ... totaldaysRemainingInMonth - 1{
            var dayComponent    = DateComponents()
            dayComponent.day    = n // For removing one day (yesterday): -1
            let theCalendar     = datePicker.calendar!
                //Calendar.current
            let nextDate        = theCalendar.date(byAdding: dayComponent, to: Date())
            
            data.append(DayData(dayNumbe: d.getDayNumber(date: nextDate!), dayName: (d.getNameOfDay(date: nextDate!))))
            
            print("nextDate : \(nextDate) ::: \(d.getNameOfDay(date: nextDate!))")
            print(d.getDayNumber(date: nextDate!))
        }
    return data
    }
    

        

    @objc func reloadHorizontalData () {
   
        print("reload")
        self.horizontalCollectionView.reloadData()
        
        
    }


    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        //navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func addMedicine(_ sender: Any) {
        self.performSegue(withIdentifier: "addMedicine", sender:self)
    }
    
    
    
}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        let month = getSelectedMonth()
        print("month" + String(month))
        let year = getSelectedYear()
        print("year" + String(year))
        let days = getNumberOfDays(month: month, year: year) - getSelectedDay() + 1
        print("days" + String(days))
        
        
        return days
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        let cell = horizontalCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        var data = getHorizontalData()
        var dayName = data[indexPath.row].dayName
        cell.dayNameLabel.text = String(dayName.prefix(3))
       
        cell.dayNumberLabel.text = data[indexPath.row].dayNumbe
        
        return cell
        
    }

    

}


extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var realm = MedicineData()
        var size = realm.readMedicineList()
        print("size , \(size)")
        return size.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.medicineName.text = "panadol"
        
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToDetails", sender: nil)
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12.0
    }

}

extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var startOfMonth: Date {

        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month], from: self)

        return  calendar.date(from: components)!
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }

    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar(identifier: .gregorian).date(byAdding: components, to: startOfMonth - 1)!
    }

 
    
    func getNameOfDay (date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "cccc"
        let dayInWeek = dateFormatter.string(from: date)
        return dayInWeek
    }
    
    func getDayNumber(date : Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
          let day = formatter.string(from: date)
        return day
    }
        
}
