/**
 * ShowBackToBackViewController.swift
 * TremorDemo
 *
 * Created by Heather Stark on 4/25/16.
 * Copyright © 2016 Tremor Video. All rights reserved.
 * This viewController demonstrates the "Show back to back" ad flow. The application tries to show 3 ads back to back
 *  - The applicaiton makes an ad request, waiting for adReady callback
 *  - If an ad is ready, the application will show the ad
 *  - Once ad is completed, the application listens to adComplete callback, and make another ad request.
 *
 *  For more details about SDK API and Integration, please visit
 *  https://github.com/TremorVideoMobile/TremorVideo-iOS-SDK
 */

import UIKit
import TremorVideoAd


class ShowBackToBackViewController: UIViewController, TremorVideoAdDelegate {
    let numAds = 3
    
    var siteID:String!
    var adType:String?
    var activityIndicator:UIActivityIndicatorView?
    var blackScreen:UIView!
    var adCount:Int!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var adTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adTitle.text = self.adType
        adCount = 0
        
        // Use a unique siteID given to you by a Tremor Video representative
        TremorVideoAd.initWithAppID(siteID)
        // Set delegate any time after calling initWithAppID
        TremorVideoAd.setDelegate(self)
        
        //Pass in optional information
        let settings: TremorVideoSettings! = TremorVideoAd.getSettings()
        settings.userGender = GENDER_MALE
        settings.userEducation = EDUCATION_COLLEGE_BACHELOR
        settings.userRace = RACE_OTHER
        settings.userIncomeRange = INCOME_50K_75K
        settings.userAge = 25
        settings.userZip = "94110"
        settings.userLatitude = 84.54
        settings.userLongitude = 42.34
        settings.userInterests = ["Cooking", "Snowboarding", "Writing"]
        settings.misc = [
            "Some_misc_data": "Some_misc_key",
            "Brown": "Hair_Color",
            "10": "Number_of_Fingers"]
        settings.preferredOrientation = ORIENTATION_ANY;
        settings.category = ["Games", "Arcade", "Puzzle"]
    }
    
    // To request an ad, call loadAd
    @IBAction func loadAd(_ sender: AnyObject) {
        self.loadingAd()
    }
    
    // After the ad has been received, this TremorVideoAdDelegate method is called
    // If the ad fails to download, success will equal false
    func adReady(_ success: Bool) {
        if(success){
            // show the loaded ad after adReady(true) has been called
            TremorVideoAd.showAd(self)
        }
        else {
            // an ad could not be loaded at this time
            self.hideLoadingView()
            self.loadingAd()
        }
        let message = "Ad Ready: \(success)\n"
        self.messageTextView.text.append(message)
    }
    
    // If the user skips an ad, this TremorVideoAdDelegate method is called
    func adSkipped() {
        let message = "Ad skipped by the user\n"
        self.messageTextView.text.append(message)
    }
    
    // After the ad has started, this TremorVideoAdDelegate method is called
    func adStart() {
        let message = "Ad Started\n"
        self.messageTextView.text.append(message)
    }
    
    // When the ad is no longer playing, this TremorVideoAdDelegate method is called
    func adComplete(_ success: Bool, responseCode: Int) {
        let message = "Ad Complete: \(success)\n"
        self.messageTextView.text.append(message)
        self.loadingAd()
    }
    
    // A loading screen can be shown after loadAd is called
    func showLoadingView () {
        if self.blackScreen == nil {
            self.blackScreen = UIView()
            self.blackScreen?.frame = self.view.bounds
            self.blackScreen?.backgroundColor = UIColor.black
            self.view.addSubview(self.blackScreen!)
            
            self.activityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
            self.activityIndicator?.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height/2)
            self.activityIndicator?.autoresizingMask = [.flexibleLeftMargin,.flexibleRightMargin,.flexibleTopMargin, .flexibleBottomMargin]
            self.activityIndicator?.startAnimating()
            self.view.addSubview(activityIndicator!)
        }
        self.navigationController?.setNavigationBarHidden(true, animated: false)
       
    }

    func hideLoadingView () {
        self.activityIndicator?.stopAnimating()
        self.activityIndicator?.removeFromSuperview()
        self.blackScreen?.removeFromSuperview()
        self.activityIndicator = nil
        self.blackScreen = nil
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func loadingAd () {
        if(adCount < numAds) {
            self.showLoadingView()
            TremorVideoAd.loadAd()
            adCount!+=1
        } else {
            adCount = 0
            self.hideLoadingView()
        }
    }
    
    // This viewController is given to TremorVideoAd to show the ad. Therefore, it needs to support all orientations
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }


}

