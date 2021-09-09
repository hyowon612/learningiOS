//
//  SecondViewController.swift
//  ReuseView
//
//  Created by Hyowon on 2021/09/05.
//

import UIKit

class SecondViewController: UIViewController {
    
    var firstText: String?
    var secondText: String?
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.firstLabel.text = self.firstText
        self.secondLabel.text = self.secondText
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
