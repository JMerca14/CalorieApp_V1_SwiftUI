//
//  LoginView.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/23/22.
//

import SwiftUI

struct LoginView: View {
    @State var fullname: String = ""
    @State var email: String = ""
    var body: some View {
        ZStack (alignment: .leading){
            Image("Background")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width + 5)
                .offset(y: -UIScreen.main.bounds.height/1.75)
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: UIScreen.main.bounds.width + 5, height: UIScreen.main.bounds.height/1.5)
                    .foregroundColor(Color("Background"))
                
                VStack (spacing: 20) {
                    VStack {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                    }
                    .padding(.bottom, 50)
                    VStack (spacing: 20){
                        CustomTextField(imageName: "envelope", label: "Email", text: $fullname)
                        
                        CustomTextField(imageName: "lock", label: "Password", text: $email, isSecured: true)
                        
                            Button(action: {
                                
                            }, label: {
                                Text("Forgot Password?")
                                    .foregroundColor(.gray)
                                    .frame(alignment: .trailing)
                            })
                        .padding(.top, -15)
                        .padding(.leading, 250)
                        
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Sign In")
                                .foregroundColor(.white)
                        })
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Accent"))
                            .frame(width: (UIScreen.main.bounds.width - 20), height: 50))
                        .padding(.vertical, 50)
                        .padding(.horizontal)
                        
                        Button(action: {
                        
                        }, label: {
                            Text("Don't have an account? ").foregroundColor(.white)
                            Text("Sign Up").bold()
                        })

                    }
                    .padding(.horizontal)
                }
            }
            .offset(y: UIScreen.main.bounds.height/5)
            
        }
        .ignoresSafeArea()
        .padding(0)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
