//
//  ResultsTableController.swift
//  Google API Boss
//
//  Created by Kyler Stole on 11/15/14.
//  Copyright (c) 2014 Uphouseworks. All rights reserved.
//

import UIKit

class ResultsTableController: BaseTableViewController {
	// MARK: Properties
	
	var filteredAPIs = [GoogleAPI]()
	
	// MARK: View Life Cycle
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	// MARK: UITableViewDataSource
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredAPIs.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.identifier) as UITableViewCell
		
		let api = filteredAPIs[indexPath.row]
		configureCell(cell, forGoogleAPI: api)
		
		return cell
	}
}