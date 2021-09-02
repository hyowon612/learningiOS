//
//  AdditionalInformationViewController.swift
//  SignUp
//
//  Created by Hyowon on 2021/08/31.
//

import UIKit

class AdditionalInformationViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월 d일"
        return formatter
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        
        self.datePicker.maximumDate = Date()
        self.birthDateLabel.text = self.dateFormatter.string(from: Date())
        
        self.phoneNumberField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        self.completeButton.isEnabled = false
    }
    
    @objc func textFieldDidChange(_ sender: UITextField) {
        if phoneNumberField.text != "" {
            self.completeButton.isEnabled = true
        } else {
            self.completeButton.isEnabled = false
        }
    }
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        let date: Date = sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.birthDateLabel.text = dateString
    }
    
    @IBAction func touchUpCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpPrevButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func touchUpCompleteButton(_ sender: UIButton) {
        UserInformation.shared.phoneNumber = phoneNumberField.text
        UserInformation.shared.birthDate = birthDateLabel.text
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
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
