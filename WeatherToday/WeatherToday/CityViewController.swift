//
//  CityViewController.swift
//  WeatherToday
//
//  Created by Hyowon on 2021/09/07.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let customCellIdentifier: String = "customCell"
    var cities: [City] = []
    var assetName: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: assetName) else {
            return
        }
        
        do {
            self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
        self.tableView.dataSource = self
        self.tableView.rowHeight = 100
    }
}

extension CityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let city: City = self.cities[indexPath.row]
        
        cell.accessoryType = .disclosureIndicator
        cell.nameLabel.text = city.cityName
        cell.temperatureLabel.text = "섭씨 \(String(city.celsius))도"
        cell.rainLabel.text = "강수확률 \(String(city.rainfall_probability))%"
        
        switch city.rainfall_probability {
        case 40..<60:
            cell.weatherImageView.image = UIImage(named: "cloudy")
        case 60..<Int.max:
            cell.weatherImageView.image = UIImage(named: "rainy")
        default:
            cell.weatherImageView.image = UIImage(named: "sunny")
        }
        
        if city.celsius < 0 && city.rainfall_probability >= 40 {
            cell.weatherImageView.image = UIImage(named: "snowy")
        }
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: WeatherViewController = segue.destination as? WeatherViewController else {
            return
        }
        
        guard let cell = sender as? CustomTableViewCell else {
            return
        }
        nextViewController.title = cell.nameLabel.text
        nextViewController.image = cell.weatherImageView.image
        nextViewController.name = cell.nameLabel.text
        nextViewController.temperature = cell.temperatureLabel.text
        nextViewController.rain = cell.rainLabel.text
    }
}
