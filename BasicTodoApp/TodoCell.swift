//
//  TodoCell.swift
//  BasicTodoApp
//
//  Created by David Fanaro on 9/8/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import SwiftUI

struct TodoCell: View {
    
    var title = ""
    var date = ""
    
    
    var body: some View {
        
        HStack{
            VStack(alignment: .leading){
                Text(title).font(.headline)
                Text(date).font(.caption)
            }
        }
    }
}

struct TodoCell_Previews: PreviewProvider {
    static var previews: some View {
        TodoCell()
    }
}
