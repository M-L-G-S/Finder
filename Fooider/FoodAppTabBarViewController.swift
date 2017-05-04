//
//  FoodAppTabBarViewController.swift
//  
//
//  Created by Simrandeep Singh on 5/3/17.
//
//

import UIKit

class FoodAppTabBarViewController: UITabBarController {

    
    let deleg = ScrollingTabBarControllerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        self.selectedIndex = 1
        self.delegate = deleg
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
