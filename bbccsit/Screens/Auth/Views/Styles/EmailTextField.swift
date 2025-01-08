//
//  EmailTextField.swift
//  bbccsit
//
//  Created by Everest Paudel on 1/7/25.
//
import SwiftUI
struct EmailTextField: View {
    @Binding var emailText :String
    @Binding var isValidEmail :Bool
   let validatEmail :(String) -> Bool
    let errorText:String
    let placeholder:String
    
    @FocusState var focusedField:FocusedField?
    
    
    var body: some View {
        VStack {
           
            TextField("Email",text: $emailText)
                .focused($focusedField,equals: .email)
                .padding()
                .background(Color("SecondaryBlue"))
                .cornerRadius(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke( !isValidEmail ? .red : focusedField == .email ? Color.theme.titleColor : Color.theme.bordorColor,lineWidth:  focusedField == .email ? 3 : 1)
                )
                .padding(.horizontal)
                .onChange(of: emailText){newValue in
                    isValidEmail = Validator.validateEmail(newValue)
                    
                }
                .padding(.bottom,isValidEmail ? 16:0)
        }
        
        if !isValidEmail {
            HStack{
                Text(errorText)
                    .foregroundColor(.red)
                    .padding(.leading)
                Spacer()
            }
            .padding(.bottom)
                }
    }
}

