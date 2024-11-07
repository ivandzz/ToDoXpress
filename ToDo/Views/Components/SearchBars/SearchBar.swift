//
//  SearchBar.swift
//  ToDo
//
//  Created by Іван Джулинський on 07.11.2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $text)
                .textFieldStyle(.plain)
                .padding(8)
                .background(Color("listRowBackground"))
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar(text: .constant(""))
}
