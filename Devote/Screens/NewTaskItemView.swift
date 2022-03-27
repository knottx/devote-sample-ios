//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Visarut Tippun on 26/3/22.
//

import SwiftUI

struct NewTaskItemView: View {
    
    @State var task: String = ""
    
    @Binding var isShowing: Bool
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.id = UUID()
            newItem.timestamp = Date()
            newItem.task = task
            newItem.isCompleted = false

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        Color(isDarkMode ? .tertiarySystemBackground : .secondarySystemBackground)
                    )
                    .cornerRadius(10)
                
                Button {
                    addItem()
                    playSound("sound-ding", type: "mp3")
                    feedback.notificationOccurred(.success)
                } label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .disabled(task.isEmpty)
                .onTapGesture {
                    if task.isEmpty {
                        playSound("sound-tap", type: "mp3")
                    }
                }
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(task.isEmpty ? Color.blue : Color.pink)
                .cornerRadius(10)
            } //: VStack
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                Color(isDarkMode ? .secondarySystemBackground : .white)
            )
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.65), radius: 24)
            .frame(maxWidth: 640)
        } //: VStack
        .padding()
    }
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
