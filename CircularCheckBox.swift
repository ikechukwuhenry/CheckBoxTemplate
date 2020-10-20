//
//  CircularCheckBox.swift
//  CheckBoxTemplate
//
//  Created by ik on 10/20/20.
//  Copyright © 2020 Mambilla. All rights reserved.
//

import SwiftUI

struct CircularCheckBox: View {
    
    @Binding var checked: Bool
    @Binding var trimVal: CGFloat
    
    var animatableData: CGFloat {
        get { trimVal }
        set { trimVal = newValue }
    }
    
    var body: some View {
        ZStack {
            Circle()
            .trim(from: 0, to: trimVal)
            .stroke(style: StrokeStyle(lineWidth: 2))
            .frame(width: 70, height: 70)
            .foregroundColor(checked ? Color.green : Color.gray.opacity(0.2))
            
            .overlay(
                Circle()
                .fill(checked ? Color.green : Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
            )
            
            if checked {
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
            }
        }
    }
}

struct CircularCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CircularCheckBox(checked: .constant(true), trimVal: .constant(1.0))
    }
}

