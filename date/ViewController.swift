//
//  ViewController.swift
//  date
//
//  Created by Mohan K on 23/03/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var viewBtn: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @NSManaged public var dates : String?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var product = MyDate?.self
  
    override func viewDidLoad() {
        super.viewDidLoad()
       

//         Do any additional setup after loading the view.
        let newDate = NSEntityDescription.insertNewObject(forEntityName: "MyDate", into: context) as! MyDate
        newDate.date = Date()
        do {
            try context.save()
        }
        catch {
            print("Error saving date: \(error.localizedDescription)")
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let request: NSFetchRequest<MyDate> = MyDate.fetchRequest()
//        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
//        do {
//            let dates = try context.fetch(request)
//            if let mostRecentDate = dates.first {
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateStyle = .medium
//                dateFormatter.timeStyle = .none
//                dateLabel.text = dateFormatter.string(from: mostRecentDate.date!)
//        
//            }
//        } catch {
//            print ("Error fetching dates : \(error.localizedDescription)")
//            }
//        

    }
    @IBAction func viewButton(_ sender: Any) {
        let request: NSFetchRequest<MyDate> =   MyDate.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        do {
            let dates = try context.fetch(request)
            if let mostRecentDate = dates.first {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                dateFormatter.timeStyle = .none
                dateLabel.text = dateFormatter.string(from: mostRecentDate.date!)
                print (" mostRecentDate.date: \(mostRecentDate.date)")
            }
        }catch {
            print ("Error fetching dates : \(error.localizedDescription)")
        }
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let date = dateFormatter.date(from: product.dateString!)
//        dateLabel.text = dateFormatter.string(from: date)
//        let newDate = "2023-03-23"
//        MyDate.dateString = newDate
//        do {
//            try context.save()
//            dateLabel.text = dateFormatter.string(from: dateFormatter.date(from: newDate )!)
//        }
//        catch let error {
//            print("Error updating date: \(error.localizedDescription)")
//        }
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/YYYY"
//        let dates = dateFormatter.string(from: Date())
//        self.dates = dates
//        self.dateLabel.text = dates
    }
    
}

