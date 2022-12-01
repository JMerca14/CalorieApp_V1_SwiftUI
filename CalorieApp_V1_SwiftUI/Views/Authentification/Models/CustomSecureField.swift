//
//  CustomSecureField.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/24/22.
//

import SwiftUI

struct CustomSecureField: View {
    let imageName: String
    let label: String
    @Binding var text: String
    @State var isTextHidden = true
    var isTextChanged: (Bool) -> Void?
    var body: some View {
        
        VStack (alignment: .leading) {
            HStack {
                if isTextHidden == false {
                    TextField("", text: $text) { (status) in
                        if status{
                            
                        }
                    } onCommit: {
                        
                    }
                    .foregroundColor(.white)
                    
                    
                    Button(action: {
                        isTextHidden.toggle()
                    }, label: {
                        if text != "" {
                            if isTextHidden {
                                Image(systemName: "eye.slash")
                                    .foregroundColor(Color("Accent"))
                            } else {
                                
                                Image(systemName: "eye")
                                    .foregroundColor(Color("Accent"))
                            }
                        }
                    })
                }
                else {
                    
                    SecureField("", text: $text)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        text = ""
                    }, label: {
                        Button(action: {
                        isTextHidden.toggle()
                    }, label: {
                        if text != "" {
                            if isTextHidden {
                                Image(systemName: "eye.slash")
                                    .foregroundColor(Color("Accent"))
                            } else {
                                
                                Image(systemName: "eye")
                                    .foregroundColor(Color("Accent"))
                            }
                        }
                    })
                    })
                }
                
            }
            .padding(.top,  withAnimation(.easeInOut) {
                text != "" ? 15 : 0
            })
            .background(
                HStack (){
                    Image(systemName: imageName)
                    Text(label)
                }
                    .padding(.leading, withAnimation(.easeInOut) {
                        text != "" ? 5 : 0
                        
                    })
                    .scaleEffect( withAnimation(.easeInOut) {
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
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(imageName: "person", label: "Full Name", text: .constant(""), isTextChanged: { _ in })
    }
}
