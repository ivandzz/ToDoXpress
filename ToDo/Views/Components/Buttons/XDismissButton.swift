//
//  XDismissButton.swift
//  ToDo
//
//  Created by Іван Джулинський on 08.05.2024.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        Button(action: {
            isPresented = false
        }, label: {
            Image(systemName: "xmark")
                .foregroundStyle(Color(.label))
                .imageScale(.large)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
        })
    }
}

#Preview {
    XDismissButton(isPresented: .constant(true))
}
