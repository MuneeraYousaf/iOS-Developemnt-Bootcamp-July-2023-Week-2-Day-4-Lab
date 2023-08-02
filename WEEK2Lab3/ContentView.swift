//
//  ContentView.swift
//  WEEK2Lab3
//
//  Created by Muneera Y on 14/01/1445 AH.
//

import SwiftUI

struct ContentView: View {
    //MARK: Task 3: Using @State
    
//    In the main view, use @State to manage a variable that changes the view's appearance.
//    Implement a button in the main view to toggle the state variable and observe the UI update.
    @State var name: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State var showName: Bool = false
    @State var message: String = ""
    @State var isShowMessage = false
    @State var emailIsValid: Bool = false
    @State var PasswordsValid: Bool = true
    
    @ObservedObject var progress = UserProgress()
    var body: some View {
   
        NavigationStack  {
            VStack {
                       }
                Text("Hello,Please full your information ").font(.largeTitle)
            
    

                Form{
                    
                    Section("Full Name"){
                        TextField("Full Name", text: $name)
                        
                    }
                    Section("Password"){
                        SecureField("Password", text: $password)
                    }
                    Section("Email"){
                        TextField("Email", text: $email)
                    }
                      
                }
            
            if emailIsValid == true && PasswordsValid == true {
                NavigationLink{
                    
                    SecondView(name: $name)
                        
                    
                } label:{
                    Text("Click here")
                }
            }
            else{
                Text("please enter vaild information")
            }
                
                    
        }.onChange(of: name ){newValue in
            
                
        }
        
        .onChange(of: password ){newValue in
            validatePassword(newValue)
            
        }
        .onChange(of: email ){newValue in
            
            validateEmail(newValue)
        }
        .alert(isPresented: $isShowMessage){
            
            
            Alert(title: Text("Alert")
                  , message: Text(message),
                  dismissButton: .default(Text("OK")))
            
            
        }
                
              
                .navigationTitle("Home page") .padding()
            }
   
    func validatePassword(_ value: String ){
       
        if value.isEmpty {
            message = "Enter Data Plaese"
            isShowMessage = true
           
        }
        if value.count > 8  {
            
            message = "the data less that 8 digit "
           
            isShowMessage = true
            PasswordsValid = false
        }
        else {
            PasswordsValid = true
        }
        
    }
    
    func validateEmail(_ value: String ){
        if value.isEmpty {
            message = "Enter Data Plaese"
            isShowMessage = true
        }
        else if  (value.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
            
            self.emailIsValid = true
    
            print("valid")
            
         }else {
            
            self.emailIsValid = false
//             isShowMessage = true
            print("invalid")
            
        }
            
        }
    
    
    
}

        

      

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //MARK: For dark mode 
//            .preferredColorScheme(.dark)
    }
}
