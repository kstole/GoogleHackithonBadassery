//
//  TodayViewController.swift
//  Google API Boss Widget
//
//  Created by Kyler Stole on 11/16/14.
//  Copyright (c) 2014 Uphouseworks. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
	@IBOutlet weak var apiLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
		let pick = arc4random_uniform(4)
        // Do any additional setup after loading the view from its nib.
		switch pick {
		case 1: apiLabel.text = "Google Maps API"
		case 2: apiLabel.text = "Adsense Management API"
		case 3: apiLabel.text = "Google Analytics API"
		default: apiLabel.text = "Calendar API"
		}
		
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
