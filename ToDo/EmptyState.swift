//
//  EmptyState.swift
//  ToDo
//
//  Created by Іван Джулинський on 29.05.2024.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
            
            VStack {
                Image(systemName: "pencil.and.list.clipboard")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .offset(x: 15)
                    .foregroundStyle(.secondary)
                
                Text("You have no task listed")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyState()
}
