//
//  ContentView.swift
//  ToDo
//
//  Created by Іван Джулинський on 06.05.2024.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ToDo.date, order: .reverse) var allTodos: [ToDo]
    @State private var sheetIsPresented = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                if !allTodos.isEmpty {
                    VStack {
                        SearchBar(text: $searchText)
                            .padding(.bottom)
                        
                        List {
                            Section(header: !undoneItems.isEmpty ? Text("ToDo") : nil) {
                                ForEach(undoneItems) { todo in
                                    ListCell(todo: todo)
                                }
                                .onDelete(perform: deleteUndoneItems)
                            }
                            
                            Section(header: !doneItems.isEmpty ? Text("Done") : nil) {
                                ForEach(doneItems) { todo in
                                    ListCell(todo: todo)
                                }
                                .onDelete(perform: deleteDoneItems)
                            }
                        }
                    }
                } else {
                    EmptyState()
                }
                
                Button {
                    sheetIsPresented = true
                } label: {
                    Label("Create", systemImage: "plus")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding()
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                }
                .padding()
            }
            .navigationTitle("ToDoXpress")
            .scrollContentBackground(.hidden)
        }
        .sheet(isPresented: $sheetIsPresented) {
            AddToDoView(isPresented: $sheetIsPresented)
        }
    }
    
    var undoneItems: [ToDo] {
        allTodos.filter { !$0.isDone && (searchText.isEmpty || $0.title.contains(searchText)) }
    }
    
    var doneItems: [ToDo] {
        allTodos.filter { $0.isDone && (searchText.isEmpty || $0.title.contains(searchText)) }
    }
    
    func deleteUndoneItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(undoneItems[index])
            }
        }
    }
    
    func deleteDoneItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(doneItems[index])
            }
        }
    }
}

#Preview {
    ToDoListView()
        .modelContainer(for: ToDo.self, inMemory: true)
}
