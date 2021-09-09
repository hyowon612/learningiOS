//
//  ViewController.swift
//  ReuseView
//
//  Created by Hyowon on 2021/09/05.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dates: [Date] = []
    
    let customCellIdentifier: String = "customCell"
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func touchUpAddButton(_ sender: UIButton) {
        dates.append(Date())
        
        self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
        cell.rightLabel.text = self.timeFormatter.string(from: self.dates[indexPath.row])
//        
//        if indexPath.row == 1 {
//            cell.backgroundColor = UIColor.red
//        } else {
//            cell.backgroundColor = UIColor.white
//        }
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell: CustomTableViewCell = sender as? CustomTableViewCell else {
            return
        }
        
        nextViewController.firstText = cell.rightLabel.text
        nextViewController.secondText = cell.leftLabel.text
    }
    
}

