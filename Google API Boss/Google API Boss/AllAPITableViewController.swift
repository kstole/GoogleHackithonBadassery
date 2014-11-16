//
//  AllAPITableViewController.swift
//  Google API Boss
//
//  Created by Kyler Stole on 11/15/14.
//  Copyright (c) 2014 Uphouseworks. All rights reserved.
//

import UIKit

class AllAPITableViewController: BaseTableViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {
	
	let fullAPIDict = (UIApplication.sharedApplication().delegate as AppDelegate).apiDictionary
	
	//let gooAPIs = fullAPIDict["items"]
	
	let googleAPIs = [
		GoogleAPI(title: "Ad Exchange Buyer API"),
		GoogleAPI(title: "Ad Exchange Seller API"),
		GoogleAPI(title: "Admin Directory API"),
		GoogleAPI(title: "Email Migration API v2"),
		GoogleAPI(title: "Admin Reports API"),
		GoogleAPI(title: "AdSense Management API"),
		GoogleAPI(title: "AdSense Host API"),
		GoogleAPI(title: "Google Analytics API"),
		GoogleAPI(title: "Google Play Android Developer API"),
		GoogleAPI(title: "Google Apps Activity API"),
		GoogleAPI(title: "Google App State API"),
		GoogleAPI(title: "Enterprise Audit API"),
		GoogleAPI(title: "Google Compute Engine Autoscaler API"),
		GoogleAPI(title: "BigQuery API"),
		GoogleAPI(title: "Blogger API"),
		GoogleAPI(title: "Calendar API")
	]
	
	// Search controller to help us with filtering.
	var searchController: UISearchController!

	// Secondary search results table view.
	var resultsTableController: ResultsTableController!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		resultsTableController = ResultsTableController()
		
		// We want to be the delegate for our filtered table so didSelectRowAtIndexPath(_:) is called for both tables.
		resultsTableController.tableView.delegate = self
		
		searchController = UISearchController(searchResultsController: resultsTableController)
		searchController.searchResultsUpdater = self
		searchController.searchBar.sizeToFit()
		tableView.tableHeaderView = searchController.searchBar
		
		searchController.delegate = self
		searchController.dimsBackgroundDuringPresentation = false // default is YES
		searchController.searchBar.delegate = self    // so we can monitor text changes + others
		
		// Search is now just presenting a view controller. As such, normal view controller
		// presentation semantics apply. Namely that presentation will walk up the view controller
		// hierarchy until it finds the root view controller or one that defines a presentation context.
		definesPresentationContext = true
		
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }
	
	// MARK: UISearchBarDelegate
	
	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
	}
	
	// MARK: UISearchControllerDelegate
	
	func presentSearchController(searchController: UISearchController) {
		//NSLog(__FUNCTION__)
	}
	
	func willPresentSearchController(searchController: UISearchController) {
		//NSLog(__FUNCTION__)
	}
	
	func didPresentSearchController(searchController: UISearchController) {
		//NSLog(__FUNCTION__)
	}
	
	func willDismissSearchController(searchController: UISearchController) {
		//NSLog(__FUNCTION__)
	}
	
	func didDismissSearchController(searchController: UISearchController) {
		//NSLog(__FUNCTION__)
	}
	
	// MARK: UISearchResultsUpdating
	
	func updateSearchResultsForSearchController(searchController: UISearchController) {
		// Update the filtered array based on the search text.
		let searchResults = googleAPIs
		
		// Strip out all the leading and trailing spaces.
		let whitespaceCharacterSet = NSCharacterSet.whitespaceCharacterSet()
		let strippedString = searchController.searchBar.text.stringByTrimmingCharactersInSet(whitespaceCharacterSet)
		// Splits user's search query into String array
		let searchItems = strippedString.componentsSeparatedByString(" ") as [String]
		
		// Build all the "AND" expressions for each value in the searchString.
		var andMatchPredicates = [NSPredicate]()
		
		for searchString in searchItems {
			// Each searchString creates an OR predicate for: name, yearIntroduced, introPrice.
			//
			// Example if searchItems contains "iphone 599 2007":
			//      name CONTAINS[c] "iphone"
			//      name CONTAINS[c] "599", yearIntroduced ==[c] 599, introPrice ==[c] 599
			//      name CONTAINS[c] "2007", yearIntroduced ==[c] 2007, introPrice ==[c] 2007
			//
			var searchItemsPredicate = [NSPredicate]()
			
			// Name field matching.
			var lhs = NSExpression(forKeyPath: "title")
			var rhs = NSExpression(forConstantValue: searchString)
			
			var finalPredicate = NSComparisonPredicate(leftExpression: lhs, rightExpression: rhs, modifier: .DirectPredicateModifier, type: .ContainsPredicateOperatorType, options: .CaseInsensitivePredicateOption)
			
			searchItemsPredicate.append(finalPredicate)
			
			// Add this OR predicate to our master AND predicate.
			let orMatchPredicates = NSCompoundPredicate.orPredicateWithSubpredicates(searchItemsPredicate)
			andMatchPredicates.append(orMatchPredicates)
		}
		
		// Match up the fields of the Product object.
		let finalCompoundPredicate = NSCompoundPredicate.andPredicateWithSubpredicates(andMatchPredicates)
		
		let filteredResults = searchResults.filter { finalCompoundPredicate.evaluateWithObject($0) }
		
		// Hand over the filtered results to our search results table.
		let resultsController = searchController.searchResultsController as ResultsTableController
		resultsController.filteredAPIs = filteredResults
		resultsController.tableView.reloadData()
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
			selectedAPI = resultsTableController.filteredAPIs[indexPath.row]
		}
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		
        //todo FIX THIS
		let detailViewController = storyboard.instantiateViewControllerWithIdentifier("api_detail_view") as APIDetailViewController
		
		detailViewController.showSpecificApi(selectedAPI.index as NSInteger)
		
		// Set up the detail view controller to show.
		/* REQUIRES SOME OBJECTIVE-C VERSION OF THE forProduct METHOD */
		// let detailViewController = APIDetailViewController.show(selectedAPI)
		
		// Note: Should not be necessary but current iOS 8.0 bug requires it.
		tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow()!, animated: false)
		
		/* STILL REQUIRED FOR SELECTION */
		self.navigationController?.pushViewController(detailViewController, animated: true)
		//navigationController?.presentViewController(detailViewController, animated: true, completion: nil)
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
