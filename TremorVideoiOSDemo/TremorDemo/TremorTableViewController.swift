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
        case showBackToBack
        case showImmediately
        case preload
    }
    struct Ad {
        let name: String
        let siteID: String
        let flowType: FlowType
        
    }
    let header = "Ad Flow"

    let adFlows = [
        Ad(name: "Preload in Background", siteID: "test", flowType: .preload),
        Ad(name: "Show Immediately", siteID: "test", flowType: .showImmediately),
        Ad(name: "Show Back To Back", siteID: "test", flowType: .showBackToBack)
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.adFlows.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.header;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellID, for: indexPath)
        let row = indexPath.row
        cell.textLabel!.text = self.adFlows[row].name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        self.selectedItem = self.adFlows[row]
        if self.selectedItem!.flowType == .showImmediately {
            performSegue(withIdentifier: showImmediatelySegueID, sender: self)
        } else if(self.selectedItem!.flowType == .showBackToBack){
            performSegue(withIdentifier: showBackToBackSegueID, sender: self)
        }
        else {
            performSegue(withIdentifier: preloadSegueID, sender: self)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor.darkGray
        header.textLabel!.textColor = UIColor.white

    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = (segue.destination as? PreLoadAdViewController){
            viewController.siteID = selectedItem!.siteID
            viewController.adType = selectedItem?.name
        } else if let viewController = (segue.destination as? ShowImmediatelyViewController){
            viewController.siteID = selectedItem!.siteID
            viewController.adType = selectedItem?.name
        } else if let viewController = (segue.destination as? ShowBackToBackViewController){
            viewController.siteID = selectedItem!.siteID
            viewController.adType = selectedItem?.name
        }

    }
    
    override var shouldAutorotate : Bool {
        return true;
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var preferredInterfaceOrientationForPresentation : UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }



}
