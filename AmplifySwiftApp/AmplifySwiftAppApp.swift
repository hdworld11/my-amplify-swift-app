//
//  AmplifySwiftAppApp.swift
//  AmplifySwiftApp
//
//  Created by Harshita Daddala on 11/19/22.
//

import SwiftUI
import Amplify
import AWSCognitoAuthPlugin

@main
struct AmplifySwiftAppApp: App {
	
	init(){
		configureAmplify();
	}
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
	
	func configureAmplify(){
		do {
			try Amplify.add(plugin: AWSCognitoAuthPlugin())
			try Amplify.configure()
			print("Initialized Amplify");
		} catch {
			print("Could not initialize Amplify: \(error)");
		}
	}
}
