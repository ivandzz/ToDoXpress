//
//  EditToDoView.swift
//  ToDo
//
//  Created by Іван Джулинський on 07.05.2024.
//

import SwiftUI
import SwiftData

struct EditToDoView: View {
    
    @Bindable var todo: ToDo
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
               XDismissButton(isPresented: $isPresented)
                
                Form {
                    Section {
                        HStack(spacing: 15) {
                            Image(systemName: "circle")
                                .scaleEffect(1.5)
                                .foregroundStyle(Color(UIColor.systemGray2))
                            
                            TextField("What's on your mind?", text: $todo.title)
                        }
                        HStack(spacing: 15) {
                            Image(systemName: "pencil.line")
                                .scaleEffect(1.5)
                                .foregroundStyle(Color(UIColor.systemGray2))
                            
                            TextField("Add a note", text: $todo.note)
                        }
                        
                        HStack(spacing: 15) {
                            Image(systemName: "calendar")
                                .scaleEffect(1.5)
                                .foregroundStyle(Color(UIColor.systemGray2))
                            
                            DatePicker("Select the date", selection: $todo.date, displayedComponents: .date)
                                .foregroundStyle(Color(UIColor.systemGray2))
                        }
                    }
                    .listRowBackground(Color.clear)
                    
                    Section {
                        Button(action: {
                            let trimmedTitle = todo.title.trimmingCharacters(in: .whitespacesAndNewlines)
                            guard !trimmedTitle.isEmpty else { return }
                            
                            todo.title = trimmedTitle
                            isPresented = false
                        }) {
                            Text("Save")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
            }
        }
    }
}

#Preview {
    EditToDoView(todo: MockData().sample, isPresented: .constant(true))
        .modelContainer(for: ToDo.self, inMemory: true)
    
}
