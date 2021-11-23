//
//  ViewController.swift
//  AsyncExample
//
//  Created by Hyowon on 2021/11/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func touchUpDownloadButton(_ sender: UIButton) {
         // 이미지 다운로드 -> 이미지 뷰에 세팅
        
        // https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg
        
        guard let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg") else {
            return
        }
 
        OperationQueue().addOperation {
            let imageData:Data?
            do {
                imageData = try Data.init(contentsOf: imageURL)
            } catch {
                return
            }
            guard let imageData = imageData, let image: UIImage = UIImage(data: imageData) else {
                return
            }
            
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

