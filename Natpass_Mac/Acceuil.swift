//
//  Acceuil.swift
//  Natpass_Mac
//
//  Created by etudiant btssnir on 08/02/2022.
//

import SwiftUI

struct Acceuil: View {
    var body: some View {
        Rectangle()
        //dégradé de couleur//
            .fill(LinearGradient(colors: [Color(red: 0.0, green: 10/255, blue: 46/255, opacity:0.9), Color(red: 78/255, green: 98/255, blue: 169/255, opacity: 0.9)], startPoint: .topLeading, endPoint: .bottomTrailing))
            //dégradé de couleur//
                .cornerRadius(60)
                .frame(width: 1155, height: 650.0)
    }
}

struct Acceuil_Previews: PreviewProvider {
    static var previews: some View {
        Acceuil()
    }
}
