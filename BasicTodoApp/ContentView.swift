//
//  ContentView.swift
//  BasicTodoApp
//
//  Created by David Fanaro on 9/7/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var manageObjectContext
    @FetchRequest(fetchRequest: Todoitem.getAllTodoItem()) var toDoItems:FetchedResults<Todoitem>
    
    @State private var todoItemTitle = ""
    
    var body: some View {
        NavigationView{
            List {
                Section(header: Text("Whats to do")) {
                    HStack {
                        TextField("Todo Item", text: $todoItemTitle)
                        Button(action: {
                            let todo = Todoitem(context: self.manageObjectContext)
                            todo.title = self.todoItemTitle
                            todo.created_at = Date()
                            
                            do{
                                try self.manageObjectContext.save()
                            }catch{
                                print(error.localizedDescription)
                            }
                            self.todoItemTitle = ""
                            
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                
                Section(header: Text("Your Todo's")) {
                    ForEach(self.toDoItems) { todo in
                        TodoCell(title: "\(todo.title!)", date: "\(todo.created_at!)")
                    }.onDelete{ indexSet in
                        let item = self.toDoItems[indexSet.first!]
                        self.manageObjectContext.delete(item)
                        
                        do{
                            try self.manageObjectContext.save()
                        }catch{
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            .navigationBarTitle("My Todo's", displayMode: .automatic)
        .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
