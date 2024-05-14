//
//  ViewController.swift
//  mapView
//
//  Created by DH on 5/9/24.
// 인덕대 위도, 경도 37.631429, 127.054823
// 우리집 위도, 경도 37.740453, 127.059937

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    @IBOutlet var myMap: MKMapView!
    
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longintudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longintudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func serAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longintudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longintudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.country != nil{
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }
    
    //핀을 잡고 선택하면 이동
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            lblLocationInfo1.text = ""
            lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        }
        else if sender.selectedSegmentIndex == 1{
            serAnnotation(latitudeValue: 37.737774, longitudeValue: 127.046305, delta: 0.01, title: "우리 동네", subtitle: "경기도 의정부시 평화로 525")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "우리 동네"
        }
        else if sender.selectedSegmentIndex == 2{
            serAnnotation(latitudeValue: 37.631429, longitudeValue: 127.054823, delta: 0.01, title: "인덕대학교", subtitle: "서울특별시 노원구 초안산로 12")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "인덕대학교"
        }
        else if sender.selectedSegmentIndex == 3{
            serAnnotation(latitudeValue: 37.500241, longitudeValue: 127.032903, delta: 0.01, title: "Toss", subtitle: "서울특별시 강남구 테헤란로 131")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "토스 본사"
        }
        else if sender.selectedSegmentIndex == 4{
            serAnnotation(latitudeValue: 40.69113674121954, longitudeValue: -74.04618490543743, delta: 0.01, title: "New York", subtitle: "Liberty Island, New York, NY 10004 미국")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "뉴욕"
        }
        else if sender.selectedSegmentIndex == 5{
            serAnnotation(latitudeValue: 38.883305544584154, longitudeValue: -77.01623078971231, delta: 0.01, title: "NASA", subtitle: "300 E St SW, Washington, DC 20546 미국")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "나사"
        }
        
    }
    
}

