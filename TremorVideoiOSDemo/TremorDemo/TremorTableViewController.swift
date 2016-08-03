//
//  TremorTableViewController.swift
//  TremorDemo
//
//  Created by Heather Stark on 4/25/16.
//  Copyright © 2016 Tremor Video. All rights reserved.
//
//  The Tremor Video SDK shows several different ad formats at random.
//  This demo allows a developer to test each format individually.
//  
//  Additionally, there are two strategies for showing an ad.
//  A developer can show the ad immediately after it's been downloaded,
//  or some time in the near future. This is demonstrated in the Ad Flows
//  section. Be advised that it's possible for an ad to expire before it's 
//  been shown. So don't request an ad too far in advance.

import UIKit

class TremorTableViewController: UITableViewController {

    enum FlowType {
        case ShowBackToBack
        case ShowImmediately
        case Preload
    }
    struct Ad {
        let name: String
        let siteID: String
        let flowType: FlowType
        
    }
    let header = "Ad Flow"

    let adFlows = [
        Ad(name: "Preload in Background", siteID: "test", flowType: .Preload),
        Ad(name: "Show Immediately", siteID: "test", flowType: .ShowImmediately),
        Ad(name: "Show Back To Back", siteID: "test", flowType: .ShowBackToBack)
    ]
    let showBackToBackSegueID = "showBackToBackSegue"
    let showImmediatelySegueID = "showImmediatelySegue"
    let preloadSegueID = "preloadSegue"
    let tableCellID = "cell"
    
    var selectedItem: Ad?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.adFlows.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.header;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(tableCellID, forIndexPath: indexPath)
        let row = indexPath.row
        cell.textLabel!.text = self.adFlows[row].name
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        self.selectedItem = self.adFlows[row]
        if self.selectedItem!.flowType == .ShowImmediately {
            performSegueWithIdentifier(showImmediatelySegueID, sender: self)
        } else if(self.selectedItem!.flowType == .ShowBackToBack){
            performSegueWithIdentifier(showBackToBackSegueID, sender: self)
        }
        else {
            performSegueWithIdentifier(preloadSegueID, sender: self)
        }
        
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor.darkGrayColor()
        header.textLabel!.textColor = UIColor.whiteColor()

    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let viewController = (segue.destinationViewController as? PreLoadAdViewController){
            viewController.siteID = selectedItem!.siteID
            viewController.adType = selectedItem?.name
        } else if let viewController = (segue.destinationViewController as? ShowImmediatelyViewController){
            viewController.siteID = selectedItem!.siteID
            viewController.adType = selectedItem?.name
        } else if let viewController = (segue.destinationViewController as? ShowBackToBackViewController){
            viewController.siteID = selectedItem!.siteID
            viewController.adType = selectedItem?.name
        }

    }
    
    override func shouldAutorotate() -> Bool {
        return true;
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return UIInterfaceOrientation.Portrait
    }



}
