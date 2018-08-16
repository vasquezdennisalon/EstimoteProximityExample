//
//  ViewController.swift
//  EstimoteProximity
//
//  Created by Denis Vásquez on 8/14/18.
//  Copyright © 2018 Denis Vásquez. All rights reserved.
//

import UIKit
import EstimoteProximitySDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let credentials = CloudCredentials(appID: "xxxxxxxxxx", appToken: "xxxxxxxxxxxxxxxxxxxxxxxxxx")
        let pObserver1:ProximityObserver = ProximityObserver(credentials: credentials, onError: {error in
            print("ERROR OBSERVER: dynamic \n ERROR: \(error)")
        })
        
        // Define zones
        let blueberryZone = ProximityZone(tag: "AuparDefaultZone", range: ProximityRange.near)
        
        blueberryZone.onEnter = { zoneContext in
            print("Entered near range of tag 'blueberry'. Attachments payload: \(zoneContext.attachments)")
        }
        blueberryZone.onExit = { zoneContext in
            print("Exited near range of tag 'blueberry'. Attachment payload: \(zoneContext.attachments)")
        }
        
        blueberryZone.onContextChange = { contexts in
            print("Now in range of \(contexts.count) contexts")
        }
        
        // ... etc. You can define as many zones as you need.
        
        // Start proximity observation
        pObserver1.startObserving([blueberryZone, blueberryZone, blueberryZone, blueberryZone, blueberryZone, blueberryZone, blueberryZone, blueberryZone, blueberryZone, blueberryZone])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

