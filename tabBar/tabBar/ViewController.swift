//
//  ViewController.swift
//  tabBar
//
//  Created by DH on 5/16/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func btnMovePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    
}

