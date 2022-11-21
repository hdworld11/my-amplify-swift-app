//
//  ContentView.swift
//  AmplifySwiftApp
//
//  Created by Harshita Daddala on 11/19/22.
//

import SwiftUI
import Amplify

struct ContentView: View {
	
	@State private var email = "";
	@State private var password = "";
	@State private var username = "";
	
	@State private var selectedAuth = 0;
	
    var body: some View {
		VStack(){
			
			Picker("Pick Sign in state", selection: $selectedAuth) {
				Text("Sign In").tag(0)
				Text("Sign Up").tag(1)
			}
			.pickerStyle(.segmented)
			
			VStack(alignment: .leading, spacing: 15){
				switch selectedAuth {
				case 1:
					SignUp2();
				default:
					SignIn2();
				}
				
			}
			.padding([.leading, .trailing], 27.5)
			
			Spacer()
			
		}
		.background(
		  LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
			.edgesIgnoringSafeArea(.all))
    }
	
	func signUpCall(username: String, password: String, email: String) async {
		let userAttributes = [AuthUserAttribute(.email, value: email)]
		let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
		do {
			let signUpResult = try await Amplify.Auth.signUp(
				username: username,
				password: password,
				options: options
			)
			if case let .confirmUser(deliveryDetails, _, userId) = signUpResult.nextStep {
				print("Delivery details \(String(describing: deliveryDetails)) for userId: \(String(describing: userId))")
			} else {
				print("SignUp Complete")
			}
		} catch let error as AuthError {
			print("An error occurred while registering a user \(error)")
		} catch {
			print("Unexpected error: \(error)")
		}
	}
	
	func confirmSignUp(for username: String, with confirmationCode: String) async {
		do {
			let confirmSignUpResult = try await Amplify.Auth.confirmSignUp(
				for: username,
				confirmationCode: confirmationCode
			)
			print("Confirm sign up result completed: \(confirmSignUpResult.isSignUpComplete)")
		} catch let error as AuthError {
			print("An error occurred while confirming sign up \(error)")
		} catch {
			print("Unexpected error: \(error)")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
