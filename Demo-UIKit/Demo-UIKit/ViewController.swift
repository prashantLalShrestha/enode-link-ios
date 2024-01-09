//
//  ViewController.swift
//  Demo-UIKit
//
//  Copyright 2023 Enode. All rights reserved.
//

import LinkKit
import UIKit

class ViewController: UIViewController {
    private var handler: Handler?
    @IBOutlet weak var versionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.versionLabel?.text = versionString()
    }

    @IBAction func onOpenLinkKitTapped(_ sender: Any) {

        // Instructions for getting your link token can be found here:
        // https://developers.enode.com/docs/link-sdks
        //
        #warning("Replace <# link token here #> with your token")
        let linkToken = "<# link token here #>"

        self.handler = Handler(linkToken: linkToken) { linkResult in
            switch linkResult {
            case .success:
                // Handle success
                print("Linking process has completed successfully!")
            case .failure(let error):
                // Handle error
                print("Linking process has failed: \(error)")
            @unknown default:
                fatalError()
            }
        }

        self.handler?.present(from: self)  // self is a UIViewController
    }
}

func versionString() -> String {
    let linkKitBundle = Bundle(for: Handler.self)
    let linkKitVersion = linkKitBundle.object(forInfoDictionaryKey: "CFBundleShortVersionString")!
    let linkKitBuild = linkKitBundle.object(forInfoDictionaryKey: kCFBundleVersionKey as String)!
    let linkKitName = linkKitBundle.object(forInfoDictionaryKey: kCFBundleNameKey as String)!
    return "\(linkKitName) \(linkKitVersion) (Build \(linkKitBuild))"
}
