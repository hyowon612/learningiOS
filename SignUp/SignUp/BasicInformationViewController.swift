//
//  BasicInformationViewController.swift
//  SignUp
//
//  Created by Hyowon on 2021/08/31.
//

import UIKit

class BasicInformationViewController: UIViewController, UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }()

    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordCheckField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        
        let tapImageView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapImageView(_:)))
        
        self.imageView.addGestureRecognizer(tapImageView)
        self.imageView.isUserInteractionEnabled = true
        
        self.textView.delegate = self
        
        self.idField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        self.passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        self.passwordCheckField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)

        self.nextButton.isEnabled = false
    }
    
    func fieldCheck() {
        if idField.text != "" && passwordField.text != "" && passwordCheckField.text != "" && textView.text != "" && imageView.image != nil && passwordField.text == passwordCheckField.text {
            self.nextButton.isEnabled = true
        } else {
            self.nextButton.isEnabled = false
        }
    }
    
    @objc func tapImageView(_ sender: UITapGestureRecognizer) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }

    @objc func textFieldDidChange(_ sender: UITextField) {
        fieldCheck()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        fieldCheck()
    }

    @IBAction func touchUpCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpNextButton(_ sender: UIButton) {
        UserInformation.shared.id = idField.text
        UserInformation.shared.password = passwordField.text
        UserInformation.shared.text = textView.text
        
        guard let vc = storyboard?.instantiateViewController(identifier: "AdditionalInformationViewController") as? AdditionalInformationViewController else { return }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let newImage: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageView.image = newImage
        }
        
        fieldCheck()
        
        self.dismiss(animated: true, completion: nil)
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
