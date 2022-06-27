//
//  SaveData.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 12/06/22.
//

import Foundation

class SaveData{
    
    func saveData(email: String, password: String, username: String) -> Bool{
        UserDefaults.standard.set([email, password, username], forKey: "USERDATA")
        print("Save user data: user = \(username), email = \(email), password = \(password)")
        return true
    }
    
    func getData() -> [String]{
        let userData: [String] = UserDefaults.standard.stringArray(forKey: "USERDATA")  ?? ["","",""]
        return userData
        //return ["lorem@gmail.com","123","Lorem"]
    }
    
    func validate(email: String, password: String) -> Bool{
        var savedEmail = ""
        var savedPassword = ""
        
        if UserDefaults.standard.object(forKey: "USERDATA") != nil{
            savedEmail = UserDefaults.standard.stringArray(forKey: "USERDATA")![0]
            savedPassword = UserDefaults.standard.stringArray(forKey: "USERDATA")![1]
            print("Received data: email = \(email), password = \(password)")
            print("Loaded data: email = \(savedEmail), password = \(savedPassword)")
            if email.uppercased() == savedEmail.uppercased() && password == savedPassword{
                return true
            }
        }
        return false
    }
}
