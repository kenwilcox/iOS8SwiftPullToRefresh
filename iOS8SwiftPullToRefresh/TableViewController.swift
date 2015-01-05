//
//  TableViewController.swift
//  iOS8SwiftPullToRefresh
//
//  Created by Kenneth Wilcox on 1/4/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  
  var alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
  var isAscending = true
  
  func sortArray() {
    var sortedAlphabet = alphabet.reverse()
    alphabet = sortedAlphabet
    
    tableView.reloadData()
    refreshControl?.endRefreshing()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: Selector("sortArray"), forControlEvents: UIControlEvents.ValueChanged)
    self.refreshControl = refreshControl
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // only one section so we don't care...
    return alphabet.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    
    // Configure the cell...
    cell.textLabel?.text = alphabet[indexPath.row]
    
    return cell
  }
}
