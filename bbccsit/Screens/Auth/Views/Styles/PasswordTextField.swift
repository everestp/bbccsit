//
//  PasswordTextField.swift
//  bbccsit
//
//  Created by Everest Paudel on 1/7/25.
//

import Foundation
import SwiftUI

struct PasswordTextField: View {
    
    @Binding var passwordText: String
    @Binding var isValidPassword: Bool
    let validatePassword :(String) -> Bool
    let errorText:String
    let placeholder:String
    @FocusState var focusedField :FocusedField?
    var body: some View {
        
        VStack {
            SecureField(placeholder,text: $passwordText)
                .focused($focusedField,equals: .password)
                .padding()
                .background(Color("SecondaryBlue"))
                .cornerRadius(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke( !isValidPassword ? .red : focusedField == .password ? Color.theme.titleColor : Color.theme.bordorColor,  lineWidth: focusedField == .password ? 3 : 1 )
                )
                .padding(.horizontal)
                .onChange(of: passwordText){newValue in
                    isValidPassword = Validator.validatePassword(newValue)
                    
                }
        }
        if !isValidPassword {
            HStack{
                Text(errorText)
                    .foregroundColor(.red)
                    .padding(.leading)
                Spacer()
            }
        }
        
        
    }
}


