//
//  ViewController.swift
//  ImageView
//
//  Created by DH on 2024/03/18.
//

import UIKit

class ViewController: UIViewController {
    var firstImage = 1
    var maxImage = 5

    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        imgView.image = UIImage(named:"1.png")
    }

    //이전 이미지 출력
    @IBAction func btnBefore(_ sender: UIButton) {
        firstImage = firstImage - 1
        if (firstImage < 1) {
            firstImage = maxImage
        }
        
        let imageName = String(firstImage) + ".png"
        imgView.image = UIImage(named:imageName)
    }
    
    //다음 이미지 출력
    @IBAction func btnNext(_ sender: UIButton) {
        firstImage = firstImage + 1
        if (firstImage > maxImage) {
            firstImage = 1
        }
        
        let imageName = String(firstImage) + ".png"
        imgView.image = UIImage(named:imageName)
    }
        
}

