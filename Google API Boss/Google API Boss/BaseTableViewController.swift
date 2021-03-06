//
//  BaseTableViewController.swift
//  Google API Boss
//
//  Created by Kyler Stole on 11/15/14.
//  Copyright (c) 2014 Uphouseworks. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
	
	// MARK: Types
	
	struct Constants {
		struct Nib {
			static let name = "TableCell"
		}
		
		struct TableViewCell {
			static let identifier = "api_list_cell"
		}
	}
	
	// MARK: View Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let nib = UINib(nibName: Constants.Nib.name, bundle: nil)
		
		// Required if our subclasses are to use: dequeueReusableCellWithIdentifier:forIndexPath:
		tableView.registerNib(nib, forCellReuseIdentifier: Constants.TableViewCell.identifier)
		
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
	}
	
	// MARK:
	
	func configureCell(cell: UITableViewCell, forGoogleAPI api: GoogleAPI) {
		cell.textLabel.text = api.title
		cell.detailTextLabel?.text = "APIicon"
	}
	
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
