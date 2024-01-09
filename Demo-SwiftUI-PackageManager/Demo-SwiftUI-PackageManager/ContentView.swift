//
//  ContentView.swift
//  Demo-SwiftUI-PackageManager
//
//  Copyright 2023 Enode. All rights reserved.
//

import LinkKit
import SwiftUI

struct ContentView: View {
    // ...
    @State private var isPresented = false
    
    // Instructions for getting your link token can be found here:
    // https://developers.enode.com/docs/link-sdks
    //
    #warning("Replace <# link token here #> with your token")
    let linkToken = "<# link token here #>"
    
    var body: some View {
        Button(
            action: {
                self.isPresented = true
            },
            label: {
                Text("Open \(versionString())")
            }
        )
        .padding()
        .linkKitSheet(isPresented: $isPresented, linkToken: linkToken) { linkResult in
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func versionString() -> String {
    let linkKitBundle = Bundle(for: Handler.self)
    let linkKitVersion = linkKitBundle.object(forInfoDictionaryKey: "CFBundleShortVersionString")!
    let linkKitBuild = linkKitBundle.object(forInfoDictionaryKey: kCFBundleVersionKey as String)!
    let linkKitName = linkKitBundle.object(forInfoDictionaryKey: kCFBundleNameKey as String)!
    return "\(linkKitName) \(linkKitVersion) (Build \(linkKitBuild))"
}
