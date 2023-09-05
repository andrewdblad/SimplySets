//
//  PopUpView.swift
//  SimplySets
//
//  Created by Andrew Blad on 8/28/23.
//

import SwiftUI

struct PopUpView: View {
    
    @ObservedObject var vm: DataViewModel
    @Binding var isNewUser: Bool
    @Binding var showingPopUp: Bool
    @State var name = ""
    @FocusState private var keyboardFocused: Bool
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                Button(action: {
                    showingPopUp = false
                }, label: {
                        })
                
                Spacer()
                HStack {
                    Text("Add Exercise")
                    Image(systemName: "chevron.down")
                        .bold()
                }
                .padding(15)
                TextField("Enter exercise name: ", text: $name)
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading, 70)
                    .padding(.trailing, 70)
                    .focused($keyboardFocused)
                    .onAppear {
                        keyboardFocused = true
                    }
                
                
                Button(action: {
                    showingPopUp = false
                    isNewUser = false
                    vm.addExercise(name: name)
                    
                }, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(width: 75, height: 40)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .font(.system(size: 18))
                })
                .padding(.top, 15)
                .padding(.bottom, 55)
            }
        }
    }
}

struct PopUpViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

