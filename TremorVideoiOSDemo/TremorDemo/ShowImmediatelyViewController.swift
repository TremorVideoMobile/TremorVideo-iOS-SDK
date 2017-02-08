/**
 * ShowImmediatelyViewControllerswift
 * TremorDemo
 *
 * Created by Heather Stark on 4/25/16.
 * Copyright © 2016 Tremor Video. All rights reserved.
 * This viewController demonstrates the "Show Immediately" ad flow. The application can make an ad request,
 * wait for the ad to be ready and show the ad as soon as ad is ready.
 *  - The application makes an ad request.
 *  - The application shows a loading screen to wait for ad response
 *  - As soon as an ad is ready, the application receives the adReady callback.
 *  - If an ad is ready, the application call showAd to display the ad
 *
 *  For more details about SDK API and Integration, please visit
 *  https://github.com/TremorVideoMobile/TremorVideo-iOS-SDK
 */


import UIKit
import TremorVideoAd


class ShowImmediatelyViewController: UIViewController, TremorVideoAdDelegate {
    var siteID:String!
    var adType:String?
    var activityIndicator:UIActivityIndicatorView?
    var blackScreen:UIView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var adTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adTitle.text = self.adType
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
        
        TremorVideoAd.loadAd()
        self.showLoadingView()
    }
    
    // After the ad has been received, this TremorVideoAdDelegate method is called
    // If the ad fails to download, success will equal false
    func adReady(_ success: Bool) {
        if(success){
            // show the loaded ad after adReady(true) has been called
            TremorVideoAd.showAd(forParentViewController: self)
        }
        else {
            // an ad could not be loaded at this time
            self.hideLoadingView()
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
        self.hideLoadingView()
        let message = "Ad Started\n"
        self.messageTextView.text.append(message)
    }
    
    // When the ad is no longer playing, this TremorVideoAdDelegate method is called
    func adComplete(_ success: Bool, responseCode: Int) {
        self.hideLoadingView()
        let message = "Ad Complete: \(success)\n"
        self.messageTextView.text.append(message)
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
    }

    func hideLoadingView () {
        self.activityIndicator?.stopAnimating()
        self.activityIndicator?.removeFromSuperview()
        self.blackScreen?.removeFromSuperview()
        self.activityIndicator = nil
        self.blackScreen = nil
    }
    
    // This viewController is given to TremorVideoAd to show the ad. Therefore, it needs to support all orientations
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }


}

