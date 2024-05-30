//
//  ListCell.swift
//  ToDo
//
//  Created by Іван Джулинський on 07.05.2024.
//

import SwiftUI
import SwiftData

struct ListCell: View {
    
    var todo: ToDo
    
    @State private var isPresented = false
    
    var body: some View {
        HStack {
            Button {
                withAnimation {
                    todo.isDone.toggle()
                }
            } label: {
                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                    .scaleEffect(1.5)
                    .foregroundStyle(todo.isDone ? Color(.blue) : Color(UIColor.systemGray2))
                    .padding(.horizontal, 3)
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(todo.title)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Text("\(todo.date, style: .date)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Text(todo.note)
                    .padding(.horizontal)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Button(action: {
                isPresented = true
            }, label: {
                Image(systemName: "ellipsis")
                    .foregroundStyle(Color(.label))
                    .scaleEffect(1.5)
                    .padding(.horizontal)
            })
            .buttonStyle(PlainButtonStyle())
        }
        .sheet(isPresented: $isPresented, content: {
            EditToDoView(todo: todo, isPresented: $isPresented)
        })
        .listRowBackground(Color("listRowBackground"))
    }
}

#Preview {
    ListCell(todo: MockData().sample)
        .modelContainer(for: ToDo.self, inMemory: true)
}
