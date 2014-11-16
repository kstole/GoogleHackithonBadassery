//
//  AllAPITableViewController.swift
//  Google API Boss
//
//  Created by Kyler Stole on 11/15/14.
//  Copyright (c) 2014 Uphouseworks. All rights reserved.
//

import UIKit

class AllAPITableViewController: BaseTableViewController {
	
	let fullAPIDict = (UIApplication.sharedApplication().delegate as AppDelegate).apiDictionary
	// let apiDict = aDelagate.apiDictionary
	
	let googleAPIs = [
		GoogleAPI(title: "Ad Exchange Buyer API"),
		GoogleAPI(title: "BigQuery API"),
		GoogleAPI(title: "Calendar API")
	]
	//let apiDict: [String: String] = ["title1": "Ad Exchange Buyer API", "title2": "BigQuery API", "title3": "Calendar API"]
	//let apiArray = ["Ad Exchange Buyer API", "BigQuery API", "Calendar API"]
	
	// Secondary search results table view.
	var resultsTableController: ResultsTableController!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return googleAPIs.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.identifier, forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
		let api = googleAPIs[indexPath.row]
		configureCell(cell, forGoogleAPI: api)
		

        return cell
    }
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		var selectedAPI: GoogleAPI
		
		// Check to see which table view cell was selected.
		if tableView == self.tableView { // unfiltered list
			selectedAPI = googleAPIs[indexPath.row]
		}
		else { // filtered list
			selectedAPI = resultsTableController.filteredProducts[indexPath.row]
		}
		
		// Set up the detail view controller to show.
		let detailViewController = DetailViewController.forProduct(selectedProduct)
		
		// Note: Should not be necessary but current iOS 8.0 bug requires it.
		tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow()!, animated: false)
		
		navigationController?.pushViewController(detailViewController, animated: true)
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
