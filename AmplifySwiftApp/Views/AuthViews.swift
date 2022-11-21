//
//  AuthViews.swift
//  AmplifySwiftApp
//
//  Created by Harshita Daddala on 11/21/22.
//

import Foundation
import SwiftUI

struct SignUp2: View {
	
	@State private var email = "";
	@State private var password = "";
	@State private var username = "";
	
	var body: some View {
		VStack() {
			Text("Sign Up")
			
			TextField("Email", text: self.$email)
			TextField("Username", text:self.$username)
			SecureField("Password", text: self.$password)
			
			NavigationLink(destination: ConfirmSignIn()) {
				Text("Sign Up")
					.font(.headline)
					.foregroundColor(.black)
					.padding()
					.frame(width: 300, height: 50)
					.backgroundStyle(Color.green)
					.cornerRadius(15.0)
			}
		}
	}
}

struct SignIn2: View {
	
	@State private var email = "";
	@State private var password = "";
	@State private var username = "";
	
	var body: some View {
		VStack() {
			Text("Sign In")
			
			TextField("Username", text:self.$username)
			SecureField("Password", text: self.$password)
			
			Button(action: {}) {
				Text("Sign In")
					.font(.headline)
					.foregroundColor(.black)
					.padding()
					.frame(width: 300, height: 50)
					.backgroundStyle(Color.green)
					.cornerRadius(15.0)
			}
		}
	}
}

struct ConfirmSignIn: View {
	
	@State private var confirmationCode = "";
	
	var body: some View {
		VStack() {
			Text("Enter Confirmation Code")
			
			TextField("Confirmation Code", text: self.$confirmationCode)
			
			Button(action: {}){
				Text("Veirfy & Confirm Sign Up")
			}
			
		}
	}
	
}
