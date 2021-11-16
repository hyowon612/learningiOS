//
//  CountryViewController.swift
//  WeatherToday
//
//  Created by Hyowon on 2021/09/07.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do {
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
        
        self.tableView.delegate = self
        self.tableView.rowHeight = 80
        self.navigationController?.navigationBar.topItem?.title = "세계날씨"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CountryTableViewCell else {
            return UITableViewCell()
        }

        
        let country: Country = self.countries[indexPath.row]
        
        cell.countryImageView.image = UIImage(named: "flag_\(country.assetName)")
        cell.countryNameLabel.text = country.countryName
        cell.accessoryType = .disclosureIndicator
        cell.countryAssetName = country.assetName
        
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: CityViewController = segue.destination as? CityViewController else {
            return
        }
        
        guard let cell = sender as? CountryTableViewCell else {
            return
        }
        nextViewController.title = cell.countryNameLabel.text
        nextViewController.assetName = cell.countryAssetName
    }

}
