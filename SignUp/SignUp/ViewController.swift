//
//  ViewController.swift
//  SignUp
//
//  Created by Hyowon on 2021/08/31.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.idField.text = UserInformation.shared.id
    }
    
    @IBAction func touchUpSignUpButton(_ sender: UIButton) {
//        guard let vc = storyboard?.instantiateViewController(identifier: "BasicInformationViewController") as? BasicInformationViewController else { return }
//        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        guard let nc = storyboard?.instantiateViewController(identifier: "NavigationController") as? UINavigationController else { return }
        nc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        self.present(nc, animated: true, completion: nil)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }

}

