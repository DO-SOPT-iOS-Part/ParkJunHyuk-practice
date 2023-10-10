//
//  ViewController.swift
//  WeakSelfProject
//
//  Created by ParkJunHyuk on 2023/10/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextVC: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func pushToSecondVC(_ sender: Any) {
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
