//
//  ViewController.swift
//  Geolocation
//
//  Created by Lalit Arya on 20/11/18.
//  Copyright © 2018 Lalit Arya. All rights reserved.
//

import UIKit

import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate {
    
    @IBOutlet weak var addressText: UILabel!
    
   
    
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0]
        
       
        
        CLGeocoder().reverseGeocodeLocation(userLocation){(placemarks,error) in
            if error != nil {
                print(error!)
            }
            else{
                if let placemark = placemarks?[0]{
                    var subthoroughfare = " "
                    if placemark.subThoroughfare != nil{
                        subthoroughfare = placemark.subThoroughfare!
                    }
                    var thoroughfare = " "
                    if placemark.thoroughfare != nil{
                        thoroughfare = placemark.thoroughfare!
                    }
                    var sublocality = " "
                    if placemark.subLocality != nil{
                        sublocality = placemark.subLocality!
                    }
                    var subadministrativearea = " "
                    if placemark.subAdministrativeArea != nil{
                        subadministrativearea = placemark.subAdministrativeArea!
                    }
                    var postalcode = " "
                    if placemark.postalCode != nil{
                        postalcode = placemark.postalCode!
                    }
                    
                    self.addressText.text = String(subthoroughfare + " " + thoroughfare + "\n" + sublocality + "\n" + subadministrativearea + "\n" + postalcode)
                    
                    print(self.addressText.text as Any)
                    
                    
                }
            }
            
        }
        
        
    }
    
}
