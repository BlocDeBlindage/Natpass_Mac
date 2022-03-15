//
//  CRAWL.swift
//  Natpass_Mac
//
//  Created by etudiant btssnir on 10/03/2022.
//

import SwiftUI

struct CRAWL: View {
    @Binding var choix: Int
    @State  var search = ""
    var body: some View {
        
        ZStack
            {
           Image("toolbar-img")
                .offset(x: 0, y: -510)
                HStack
                {
                    Image("LOGO")
                        .resizable()
                        .frame(width: 83.96, height: 51.97)
                        .offset(x: -490, y: -510)
                    HStack
                    {
                        CustomTextField(placeholder : Text("Recherchez une leçon").foregroundColor(Color(red: 58/255, green: 100/255, blue: 118/255, opacity:1)), text: $search)
                        .font(.system(size: 15))
                        .textFieldStyle(PlainTextFieldStyle()) // changé le style du text
                        .frame(width: 350, height: 0.5)
                        .padding()
                    }
                    .background(Capsule().fill(Color(red: 53/255, green: 54/255, blue: 62/255, opacity:1)))// couleur du fond
                    .offset(x: 150, y: -510)
                    
                    
                    Button(action: { self.choix = 1})
                    {
                        HStack{
                 
                            Text("Déconnexion")
                                    .font(.system(size: 30))
                            
                            Image("logo Utilisateur")
                                 .resizable()
                                 .frame(width: 40, height: 40 )
                                 
                                
                        }
                        Text("test")
                                }.cornerRadius(60)
                        .frame(width: 400, height: 60)
                        .buttonStyle(PlainButtonStyle())
                        .offset(x: 580, y: -510)
                    
                        }
    }
}

}
