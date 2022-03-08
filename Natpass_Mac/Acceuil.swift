//
//  Acceuil.swift
//  Natpass_Mac
//
//  Created by etudiant btssnir on 04/03/2022.
//

import SwiftUI

struct Acceuil: View {
    @Binding var show: Bool
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(red: 53/255, green: 54/255, blue: 62/255, opacity:1))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            ZStack
            {
               Image("toolbar-img")
                    
                    .offset(x: 0, y: -510)
                    HStack
                    {
                        Image("LOGO")
                            .resizable()
                            .frame(width: 83.96, height: 51.97)
                            .offset(x: -915, y: -510)
                        
                        NavigationView {
                                   List {
                                       ForEach(searchResults, id: \.self) { name in
                                           NavigationLink(destination: Text(name)) {
                                               Text(name)
                                           }
                                       }
                                   }
                                   .searchable(text: $searchText)
                                   .navigationTitle("Contacts")
                               }
                           }
                           }
                    }
            }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
        
    }
    
}
