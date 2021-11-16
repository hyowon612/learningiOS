//
//  WeatherViewController.swift
//  WeatherToday
//
//  Created by Hyowon on 2021/09/07.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var image: UIImage?
    var name: String?
    var temperature: String?
    var rain: String?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        nameLabel.text = name
        temperatureLabel.text = temperature
        rainLabel.text = rain
        

        // Do any additional setup after loading the view.
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
