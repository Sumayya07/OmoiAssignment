//
//  ContentView.swift
//  OmoiAssignment
//
//  Created by Sumayya Siddiqui on 16/11/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavedText.dateAdded, ascending: true)],
        animation: .default)
    private var savedTexts: FetchedResults<SavedText>

    @State private var inputText: String = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""


    var body: some View {
          NavigationView {
              VStack {
                  // Customized Text Field
                  TextField("Enter text", text: $inputText)
                      .font(.system(size: 18)) // Set the font size as needed
                      .padding(.vertical, 10) // Add padding to increase visual height
                      .padding(.horizontal)
                      .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary, lineWidth: 1))
                      .padding(.horizontal) // Add this to ensure padding on the sides
                      .padding(.top)
                  
                  
                  // Customized Button
                  Button(action: addText) {
                      Text("Save")
                          .bold()
                          .foregroundColor(.white)
                          .frame(width: 210, height: 45) // Set the width and height
                          .background(Color.blue)
                          .cornerRadius(25) // This will make it have rounded corners
                  }
                  .padding(.top) // Add a little space above the button
                  
                  List {
                      ForEach(savedTexts) { savedText in
                          Text(savedText.content ?? "[No Content]")
                      }
                      .onDelete(perform: deleteTexts) // Keep only the delete functionality
                  }
                  .toolbar {
                      EditButton()
                  }
              }
              .navigationTitle("Text Saver")
              .alert(isPresented: $showingAlert) {
                     Alert(
                         title: Text("Attention"),
                         message: Text(alertMessage),
                         dismissButton: .default(Text("OK"))
                     )
                 }
              .onAppear {
                  UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                      if let error = error {
                          // Handle the error here.
                          print("Notification permission error: \(error)")
                      }
                  }
              }
          }
      
    }
    
    private func deleteTexts(offsets: IndexSet) {
        withAnimation {
            offsets.map { savedTexts[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Error deleting text: \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func addText() {
        // Check if the input text is not empty
        guard !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            self.alertMessage = "Please write something before saving."
            self.showingAlert = true
            return
        }

        let newSavedText = SavedText(context: viewContext)
        newSavedText.content = inputText
        newSavedText.dateAdded = Date()

        do {
            try viewContext.save()
            inputText = "" // Clear the input field after saving
            scheduleNotification()
        } catch {
            // Handle the Core Data error appropriately.
            print("Could not save the text: \(error.localizedDescription)")
        }
    }

    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        
        // Fetch a random text to display
        if let randomSavedText = savedTexts.randomElement(), let textContent = randomSavedText.content {
            content.body = textContent
        } else {
            content.body = "You have saved texts to review!"
        }

        // Schedule the notification to repeat every two hours
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2 * 3600, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // Add the request to the notification center
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
    }
}
