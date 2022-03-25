//
//  ServiceWeb.swift
//  Natpass_Mac
//
//  Created by etudiant btssnir on 24/03/2022.
//

import Foundation

struct ToDoResponseModel: Codable {
    var email: String
    var password: String
}



class WebServices: ObservableObject {
    @Published var resultat = Modele()
    let adresse : URL
    init() {
        
        guard let testUrl = URL(string: "http://172.16.21.32/natpass/connexionApp.php") else {
            print ("URL error!")
            fatalError("Invalid URL")
        }
        adresse = testUrl

                }

            
        
    
    func fetchData (nomutilisateur : String, motdepasse : String) {

        print("Function is running")
        // Prepare URL Request Object
        var request = URLRequest(url: adresse)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        print("URL request prepared")
        let newTodoItem = ToDoResponseModel(email: nomutilisateur, password: motdepasse)
        // Set HTTP Request Body
        let jsonData = try? JSONEncoder().encode(newTodoItem)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard let data = data else {
                    
                    return
            }
            let decoder = JSONDecoder()
            print(String(data: data, encoding: .utf8)!)
            do {
                let decoded = try decoder.decode(Modele.self, from: data)
                self.resultat = decoded
               
                    //print(decoded.erreur)
                    //onycroit = decoded.erreur

                    //print(onycroit)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
