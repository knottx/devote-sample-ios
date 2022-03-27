//
//  ListRowItemView.swift
//  Devote
//
//  Created by Visarut Tippun on 27/3/22.
//

import SwiftUI

struct ListRowItemView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @ObservedObject var item: Item
    
    var body: some View {
        Toggle(isOn: $item.isCompleted) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.isCompleted ? .pink : .primary)
                .padding(.vertical, 12)
                .animation(.default, value: item.isCompleted)
        } //: Toggle
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange) { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        }
    }
}

//struct ListRowItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowItemView()
//    }
//}
