//
//  MyKolodaViewController.swift
//  Fooider
//
//  Created by Simrandeep Singh on 4/24/17.
//  Copyright © 2017 MLGS. All rights reserved.
//

import UIKit
import Koloda

class MyKolodaViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        images.append(#imageLiteral(resourceName: "ryan"))
        kolodaView.dataSource = self
        kolodaView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

