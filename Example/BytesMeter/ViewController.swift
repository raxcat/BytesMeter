//
//  ViewController.swift
//  BytesMeter
//
//  Created by raxcat on 06/02/2017.
//  Copyright (c) 2017 raxcat. All rights reserved.
//

import UIKit
import BytesMeter

class ViewController: UIViewController {

    let secretary = BytesMeter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secretary.addObserver(self, forKeyPath: "speed", options: [ .old, .new ], context: nil)
        
        secretary.reset()
        

        for i in 1...100 {
            if i%10 == 0 {
                self.secretary.reset()
            }
            sleep(1)
            loopTest()
        }
        
    }
    
    func loopTest(){
        let randomNum:UInt = UInt(arc4random_uniform(100000))+1 // range is 0 to 99
        print("generate : \(randomNum)")
        self.secretary.addBytesCount(randomNum)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        print("observed \(keyPath) \(change)")
        
        let formatter = ByteCountFormatter()
        formatter.countStyle = .memory
        print("\(formatter.string(fromByteCount: Int64(secretary.speed)))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

