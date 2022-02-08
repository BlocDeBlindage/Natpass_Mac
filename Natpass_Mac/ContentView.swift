//
//  ContentView.swift
//  testMac
//
//  Created by etudiant btssnir on 03/02/2022.
//


import SwiftUI

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text : String
    var editingChanged: (Bool)->() = { _ in}
    var comint: ()->() = {  }
   
    var body: some View {
        ZStack{
            if text.isEmpty {placeholder}
            TextField("",text: $text, onEditingChanged: editingChanged, onCommit: comint)
            
        }
    }
}
struct CustomsecureField: View {
    var placeholder: Text
    @Binding var text : String
    var editingChanged: (Bool)->() = { _ in}
    var comint: ()->() = {  }
   
    var body: some View {
        ZStack{
            if text.isEmpty {placeholder}
            SecureField("",text: $text)
            
        }
    }
}

struct ContentView: View {
    @State var nomutilisateur: String = ""
    @State var motdepasse: String = ""
    var body: some View {
       
        //afficher image de fond //
        ZStack{
            Image("img-fond")
            //afficher image de fond //
            VStack{   //aligné verticalement img fond avec logo
                HStack{ //aligné horizontalement logo  avec natpass
                    Image("LOGO")
                    Image("NATPASS")
                      }
                Spacer()
                    .frame(height: 100)
                    
                ZStack {          //aligné en profondeur rectangle  avec les different case de login
                    Rectangle()
                    //dégradé de couleur//
                        .fill(LinearGradient(colors: [Color(red: 0.0, green: 10/255, blue: 46/255, opacity:0.9), Color(red: 78/255, green: 98/255, blue: 169/255, opacity: 0.9)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        //dégradé de couleur//
                            .cornerRadius(60)
                            .frame(width: 1155, height: 650.0)
                    VStack{
                        ZStack {
                            HStack{
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 20, height: 20 )
                                    
                                    .scaledToFill()
                                
                                CustomTextField(placeholder : Text("nomutilisateur").foregroundColor(.white), text: $nomutilisateur )
                                    .font(.system(size: 20))
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .frame(width: 1000, height: 17.5)
                                    .background(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1))
                                    .padding()
                            }.padding()
                            .background(Capsule().fill(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1)))
                            
                            
                            Spacer()
                                .frame(height: 200)
                            
                         
                        }
                        ZStack {
                            HStack{
                                Image(systemName: "lock")
                                    .resizable()
                                    .frame(width: 20, height: 20 )
                                    
                                    .scaledToFill()
                                
                            CustomsecureField(placeholder : Text("motdepasse").foregroundColor(.white), text: $motdepasse)
                                .font(.system(size: 20))
                                .textFieldStyle(PlainTextFieldStyle())
                                .frame(width: 1000, height: 17.5)
                                .background(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1))
                                .padding()
                                    }.padding()
                                .background(Capsule().fill(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1)))
                            }
                                }
                            }
                                        
                        }
                        }
                }
            }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
