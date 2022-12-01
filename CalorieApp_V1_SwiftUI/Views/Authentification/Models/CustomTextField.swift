//
//  CustomTextInput.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/23/22.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let label: String
    @Binding var text: String
    @State var isTapped = false
    @State var isSecured: Bool? = false
    var body: some View {
        if isSecured != true {
            VStack (alignment: .leading){
                
                HStack(spacing: 15) {
                    TextField("", text: $text) { (status) in
                        if status{
                            withAnimation(.easeIn) {
                                isTapped = true
                            }
                        }
                    } onCommit: {
                        if text == "" {
                            withAnimation(.easeOut) {
                                isTapped = false
                            }
                        } else {
                            withAnimation() {
                                isTapped = false
                            }
                        }
                    }
                    .foregroundColor(.white)
                    
                    
                    
                    Button(action: {
                        text = ""
                    }, label: {
                        
                        if isTapped {
                            if text != "" {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(Color("Accent"))
                            }
                        }
                        
                    })
                }
                .padding(.top, withAnimation(.easeInOut) {
                    text != "" ? 15 : 0})
                .background(
                    HStack (){
                        Image(systemName: imageName)
                        Text(label)
                    }
                        .padding(.leading, withAnimation(.easeInOut) {
                            text != "" ? 5 : 0
                            
                        })
                        .scaleEffect(withAnimation(.easeInOut) {
                            text != "" ? 0.8 : 1
                        })
                        .offset(x:  withAnimation(.easeInOut) {
                            text != "" ? -15 : 0}, y:  withAnimation(.easeInOut) {
                                text != "" ? -15 : 0
                            })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(withAnimation(.easeInOut) {
                            text != "" ? Color("Accent") : .gray
                        })
                )
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color("MenuBackgroundLight").opacity(0.9))
            .cornerRadius(5)
        } else {
            CustomSecureField(imageName: imageName, label: label, text: $text) { _ in
                
            }
        }
            
    }
}


struct CustomTextInput_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(imageName: "person", label: "Full Name", text: .constant(""))
    }
}
