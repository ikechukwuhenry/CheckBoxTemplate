//
//  ContentView.swift
//  CheckBoxTemplate
//
//  Created by ik on 10/20/20.
//  Copyright © 2020 Mambilla. All rights reserved.
// culled from
//https://medium.com/better-programming/how-to-create-and-animate-checkboxes-in-swiftui-e428fe7cc9c1
// by Sarah, https://medium.com/@sarah.h.alsharif?source=post_page-----e428fe7cc9c1--------------------------------

import SwiftUI

struct ContentView: View {
    @State var trimValue: CGFloat = 1.0
    @State var checked = false
    @State var width: CGFloat = 200
    @State var removeText = false
    
    var body: some View {
        VStack {
            Button(action: {
                if !self.checked {
                    withAnimation(Animation.easeIn(duration: 0.8)){
                        self.trimValue = 1
                        self.checked.toggle()
                    }
                }else {
                    withAnimation(Animation.easeIn(duration: 0.8)){
                        self.trimValue = 0
                        self.checked.toggle()
                    }
                }
                
            }){
                CheckBoxView(checked: $checked, trimVal: $trimValue)
            }
            CircularCheckBox(checked: $checked, trimVal: $trimValue)
            CapsuleCheckBox(checked: $checked, trimVal: $trimValue, width: $width, removeText: $removeText)
                .onTapGesture {
                    if !self.checked {
                        self.removeText.toggle()
                           withAnimation(Animation.easeIn(duration: 0.7)){
                            self.trimValue = 1
                               self.width = 70
                            self.checked.toggle()
                           }
                       }else {
                           withAnimation(Animation.easeIn(duration: 0.8)){
                               self.trimValue = 0
                               self.width = 200
                               self.checked.toggle()
                                self.removeText.toggle()
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
