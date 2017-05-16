//
//  MyKolodaViewController.swift
//  Fooider
//
//  Created by Simrandeep Singh on 4/24/17.
//  Copyright © 2017 MLGS. All rights reserved.
//

import UIKit
import Koloda
import CoreLocation

class MyKolodaViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    @IBOutlet weak var kolodaView: KolodaView!
    
    var images: [UIImage] = []
    
    var currLocation:CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /* location */
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            getFoodsRestaurants();
        }
        
        /* kolodaView */
        // Do any additional setup after loading the view.
        images.append(#imageLiteral(resourceName: "ryan"))
        kolodaView.dataSource = self
        kolodaView.delegate = self
    }
    
    func getFoodsRestaurants() {
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        self.currLocation = locValue
        // print("locations = \(locValue.latitude) \(locValue.longitude)")
        // locations = 37.785834 -122.406417
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonPrint(_ sender: Any) {
        print("clicked")
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}


extension MyKolodaViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(koloda: KolodaView) {

    }
    
    func koloda(koloda: KolodaView, didSelectCardAt index: Int) {
        
    }
}

extension MyKolodaViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return images.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: images[index])
    }
    
    func koloda(koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView",
                                                  owner: self, options: nil)?[0] as? OverlayView
    }
}

