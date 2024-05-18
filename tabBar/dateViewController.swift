//
//  ViewController.swift
//  DatePicker
//
//  Created by DH on 3/28/24.


import UIKit

class dateViewController: UIViewController {
    let timeSelector: Selector = #selector(dateViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime : String?
    var timeOn = true
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        //자동완성기능
    }
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" //EEE는 요일을 3글자 요약
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        
    }
    //object-c에서 문법을 가져온다
    @objc func updateTime() {
//        lblCurrentTime.text = String(count)
//        count = count + 1

        let date = NSDate()
        //현재 시간을 가지고 오는 변수
        let formatter = DateFormatter()
        //위에 formatter는 지역변수이기 때문에 여기서 한번 더 선언해준다.
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)

        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        //알림 기능
        if (alarmTime == currentTime) {
            if timeOn {
                view.backgroundColor = UIColor.red
                let timeOnAlert = UIAlertController(title: "알림", message: "설정된 시간입니다. 202116058 허동현", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: {ACTION in self.view.backgroundColor = UIColor.white})
                timeOnAlert.addAction(onAction)
                present(timeOnAlert, animated: true, completion: nil)
                timeOn = false
            }
        }
        else{
            timeOn = true
        }
    }
}

