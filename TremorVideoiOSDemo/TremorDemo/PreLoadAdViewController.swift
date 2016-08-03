/**
 * PreLoadAdViewController.swift
 * TremorDemo
 *
 * Created by Heather Stark on 4/25/16.
 * Copyright © 2016 Tremor Video. All rights reserved.
 * This viewController demonstrates the "Preload in Background" ad flow. Preload ad allows the application
 * to pre-fetech an ad in the background and the ad will be instantly played when showAd is called.
 *  - The application makes an ad request.
 *  - When the application is ready to show an Ad, check if an ad is ready using isAdReady method
 *  - If an ad is ready, the application can showAd to show the ad
 *  For more details about SDK API and Integration, please visit
 *  https://github.com/TremorVideoMobile/TremorVideo-iOS-SDK
 */

import UIKit
import TremorVideoAd


class PreLoadAdViewController: UIViewController, TremorVideoAdDelegate {
    
    var siteID:String!
    var adType:String?
    @IBOutlet weak var showAdButton: UIButton!
    @IBOutlet weak var adTitle: UILabel!
    @IBOutlet weak var messageTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize with the appropriate Tremor site id
        TremorVideoAd.initWithAppID(siteID)
        
        // set the delegate to be notified of various ad states
        TremorVideoAd.setDelegate(self)
        
        // Pass in optional information
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
        
        // initialize the "Show Ad" button
        self.adTitle.text = self.adType
        showAdButton.setBackgroundImage(UIImage(named: "grey"), forState: UIControlState.Disabled)
        showAdButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Disabled)
    }
    
    // To request an ad, call loadAd
    @IBAction func loadAd(sender: AnyObject) {
        TremorVideoAd.loadAd()
    }
    
    // After the ad has been received, this TremorVideoAdDelegate method is called
    // If the ad fails to download, success will equal false
    func adReady(success: Bool) {
        if(success){
            showAdButton.enabled = true
        }
        let message = "Ad Ready: \(success)\n"
        self.messageTextView.text.appendContentsOf(message)
        
    }
    
    // Once adReady(true) has been called, show the ad
    @IBAction func showAd(sender: AnyObject) {
        if(TremorVideoAd.isAdReady()){
            TremorVideoAd.showAd(self)
        }
    }

    // After the video has started, this TremorVideoAdDelegate method is called
    func adStart() {
        let message = "Ad Started\n"
        self.messageTextView.text.appendContentsOf(message)
    }
    
    // If the user skips an ad, this TremorVideoAdDelegate method is called
    func adSkipped() {
        let message = "Ad skipped by the user\n"
        self.messageTextView.text.appendContentsOf(message)
        
    }
    // When the ad is no longer playing, this TremorVideoAdDelegate method is called
    func adComplete(success: Bool, responseCode: Int) {
        showAdButton.enabled = false
        let message = "Ad Complete: \(success)\n"
        self.messageTextView.text.appendContentsOf(message)
    }

    // This viewController is given to TremorVideoAd to show the ad. Therefore, it needs to support all orientations
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }


}

