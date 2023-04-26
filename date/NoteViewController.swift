//
//  NoteViewController.swift
//  date
//
//  Created by Mohan K on 23/03/23.
//

import UIKit
import CoreData

class  notetable: UITableViewCell {
    private var note: Date?
    
    @IBOutlet weak var dateLabel: UILabel!
    
}


class NoteViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items: [MyDate]?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setuptable()
        let newDate = NSEntityDescription.insertNewObject(forEntityName: "MyDate", into: context) as! MyDate
        newDate.date = Date()
    }
    func fetchMyDate() {
        do {
            self.items = try context.fetch(MyDate.fetchRequest())
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
        catch {
            print("Error saving date: \(error.localizedDescription)")
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
    }
    
    func setuptable() {
        tableview.delegate = self
        tableview.dataSource = self
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }

    @IBAction func addButton(_ sender: Any) {
        let alert = UIAlertController(title: "ADD", message: "Add Text", preferredStyle: .alert)
        alert.addTextField()

        let submitButton = UIAlertAction(title: "Add", style: .default) {
            (action) in
            
            let textTextField = alert.textFields![0]
            let newText = MyDate(context: self.context)
            newText.text = textTextField.text
            do {
                try self.context.save()
            }
            catch {
              print("  Error saving date: \(error.localizedDescription)")
            }
            self.fetchMyDate()
        }
        
        alert.addAction(submitButton)
        
        self.present(alert,animated: true,completion: nil)
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

extension NoteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableview.dequeueReusableCell(withIdentifier: "notetable", for: indexPath) as! notetable
        let person = self.items![indexPath.row]
//        let myDate = person
        let newText = MyDate(context: self.context)
      let edited = newText
//            let formattedDate = DateFormatter.localizedString(from: edited, dateStyle: .medium, timeStyle: .short)
//            cell.dateLabel.text = "Edited: \(formattedDate)"
//        }
//        else {
//            let formattedDate = DateFormatter.localizedString(from: person.date!, dateStyle: .medium, timeStyle: .short)
//            cell.dateLabel.text = formattedDate
//        }
        cell.textLabel?.text = person.text
//        cell.dateLabel?.text = person.date
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let person = self.items![indexPath.row]
       
    }
}
