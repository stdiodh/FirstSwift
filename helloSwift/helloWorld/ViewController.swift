//
//  ViewController.swift
//  helloWorld
//
//  Created by DH on 3/21/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblHello: UILabel!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello, " + txtName.text! + txtNumber.text!
        //lblHello.text에 내 학번과 이름 추가해줌
    }
    

}

