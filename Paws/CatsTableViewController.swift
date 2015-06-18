//
//  CatsTableViewController.swift
//  Paws
//
//  Created by Daniel Flax on 6/18/15.
//  Copyright (c) 2015 Daniel Flax. All rights reserved.
//

import UIKit

class CatsTableViewController: PFQueryTableViewController {

	override init(style: UITableViewStyle, className: String!) {

		super.init(style: style, className: className)

		self.pullToRefreshEnabled = true
		self.paginationEnabled = false
		self.objectsPerPage = 25

		self.parseClassName = className
	}

	required init(coder aDecoder:NSCoder) {
		fatalError("NSCoding not supported")
	}

	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	override func queryForTable() -> PFQuery {

		var query:PFQuery = PFQuery(className:self.parseClassName!)

		if(objects?.count == 0) {
			query.cachePolicy = PFCachePolicy.CacheThenNetwork
		}

		query.orderByAscending("name")

		return query
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {

		let cellIdentifier:String = "Cell"

		var cell:PFTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PFTableViewCell

		if (cell == nil) {
			cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
		}

		if let pfObject = object {
			cell?.textLabel?.text = pfObject["name"] as? String
		}

		return cell
	}

/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
