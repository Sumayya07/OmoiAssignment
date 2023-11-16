# 📘 Textual Reminder App

The Textual Reminder App is a native iOS application developed using SwiftUI and Swift, incorporating Core Data for persistent local storage. This intuitive app allows users to input and save texts, which are subsequently utilized to generate local notifications at two-hour intervals, showcasing a random saved text as a thoughtful reminder.

<p align="center">
 <img src="https://github.com/Sumayya07/OmoiAssignment/assets/95580926/51c0a7f4-b96a-4ce8-9767-ca4b64da2920" width="27.3%">
 <img src="https://github.com/Sumayya07/OmoiAssignment/assets/95580926/81a7cdb0-046a-48e9-8fa2-a0019bda17b7" width="27.3%">
</p>

## ✨ Features

- **🔠 Text Input**: Users can enter texts which are then saved to persistent storage.
- **📜 List Display**: All saved texts are displayed in a main view.
- **🔔 Local Notifications**: Notifications are scheduled to appear every two hours, featuring a random text from the saved entries.
- **💾 Data Persistence**: Texts are stored in Core Data, ensuring data persistence across app launches.
- **🗑 Deletion**: Users have the ability to swipe and delete texts from the list.

## 🏗 SwiftUI and Core Data

The app employs SwiftUI for its user interface components and Core Data for data management. Key components include:

- `@FetchRequest` to retrieve and observe Core Data entities.
- `@Environment(\.managedObjectContext)` for Core Data context access.
- `List` and `ForEach` for list display.
- `TextField` for text input.
- `Button` for user interaction.
- `Alert` for user feedback.
- `UNUserNotificationCenter` for notification scheduling and management.

## 📖 Usage

- **Launch**: Start the Textual Reminder App and embark on your note-taking journey.
- **Input**: Type your desired text into the input field.
- **Save**: Tap "Save" to add the text to your list for future reference.

## 🔔 Notification Handling

The app requests permission to send notifications during the initial launch to enable the reminder functionality:

- **Reminders**: Look forward to a notification every two hours, featuring one of your saved texts as a reminder.

## 🤝 Contributing

Your contributions are welcome! Here's how you can contribute:

- 🍴 Fork the repository.
- 👯 Clone it to your local machine.
- 🔧 Make your changes and commit with `git commit -m 'Add a concise commit message'`.
- 🚀 Push your branch with `git push origin your-branch-name`.
- 📝 Create a pull request.

## 🎥 Working Video of the App

<br/>
<video src="https://github.com/Sumayya07/OmoiAssignment/assets/95580926/e28e4783-2b99-4d49-aa88-159523dc9e8a" width="30%">
