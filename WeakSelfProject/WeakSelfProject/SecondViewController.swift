//
//  SecondViewController.swift
//  WeakSelfProject
//
//  Created by ParkJunHyuk on 2023/10/09.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    private var timer: Timer = Timer()
    private var timeCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
            self.timeCount += 1
            print("timeCount: \(self.timeCount)")
            self.countLabel.text = "timeCount: \(self.timeCount)"
        })
    }
    
    deinit {
        print("SecondViewController Deinit")
        self.timer.invalidate()
    }
}
