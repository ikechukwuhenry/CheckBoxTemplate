//
//  CapsuleCheckBox.swift
//  CheckBoxTemplate
//
//  Created by ik on 10/20/20.
//  Copyright © 2020 Mambilla. All rights reserved.
//

import SwiftUI

struct CapsuleCheckBox: View {
    
    @Binding var checked: Bool
    @Binding var trimVal: CGFloat
    @Binding var width: CGFloat
    @Binding var removeText: Bool
    
    var animatableData: CGFloat {
        get { trimVal }
        set { trimVal = newValue }
    }
    
    var body: some View {
        ZStack {
            Capsule()
            .trim(from: 0, to: trimVal)
            .stroke(style: StrokeStyle(lineWidth: 2))
            .frame(width: width, height: 70)
            .foregroundColor(checked ? Color.green : Color.gray.opacity(0.2))
            
            .overlay(
                Capsule()
                .fill(checked ? Color.green : Color.gray.opacity(0.2))
                .frame(width: width - 10, height: 60)
            )
            
            if checked {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.white).opacity(Double(trimVal))
            }
            if !removeText {
                Text("Check Mark")
            }
        }
    }
}

struct CapsuleCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleCheckBox(checked: .constant(false), trimVal: .constant(1.0), width: .constant(70), removeText: .constant(true))
    }
}
