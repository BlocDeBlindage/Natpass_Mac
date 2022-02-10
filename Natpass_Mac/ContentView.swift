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
struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecured {
                SecureField(title, text: $text)
            } else {
                TextField(title, text: $text)
            }
            Button(action: {isSecured.toggle()})
            {
                Image(systemName: "eye")
                    .accentColor(.white)
            }.buttonStyle(PlainButtonStyle())
        }
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
            SecureInputView("",text: $text)
            
        }
    }
}

struct ContentView: View {
    @State var nomutilisateur: String = ""
    @State var motdepasse: String = ""
    @State var Connexion : Bool = false

    var body: some View {
       
        VStack {
        NavigationView{
            
        
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
                                
                                CustomTextField(placeholder : Text("nom d'utilisateur").foregroundColor(.white), text: $nomutilisateur )
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
                        
                            CustomsecureField(placeholder : Text("mot de passe").foregroundColor(.white), text: $motdepasse)
                                .font(.system(size: 20))
                                .textFieldStyle(PlainTextFieldStyle())
                                .frame(width: 1000, height: 17.5)
                                .background(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1))
                                .padding()
                                    }
                                    }.padding()
                                .background(Capsule().fill(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1)))
                        
                        Spacer()
                            .frame(height: 100)
                        
                     
                            
                       
                        Button(action: {} ) //{Connexion.toggle()})
                        {
                            NavigationLink(destination: Acceuil())
                            {
                          HStack{
                                Image("icone_connexion")
                                    .resizable()
                                    .frame(width: 60, height: 60 )
                                    
                                    .scaledToFill()
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1))
                                .frame(width: 400, height: 60)
                              
                            Text("se connecter")
                                .font(.system(size: 30))
                                .textFieldStyle(PlainTextFieldStyle())

                                .padding()
                                        }
                                    }
                                }
                            
                                }   .buttonStyle(PlainButtonStyle())
                                .padding()
                                .background(Capsule().fill(Color(red: 55/255, green: 66/255, blue: 114/255, opacity:1)))
                                
                        
                            
                        }
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
