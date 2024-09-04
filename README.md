# Flutter To-Do List App

This repository contains the source code for a simple yet effective To-Do List application built using Flutter. The app allows users to create, manage, and prioritize tasks, helping them stay organized and on top of their daily responsibilities.

## Features

- **Add New Tasks**: Easily add tasks using the floating action button.
- **Set Priorities**: Assign priority levels (Low, Normal, High) to tasks, helping you focus on what's most important.
- **Task Completion**: Mark tasks as completed using checkboxes in the task list.
- **Dynamic UI Updates**: The app UI updates automatically as tasks are added, completed, or removed.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/PrakEntech/TodoList.git
   ```
   
2. **Navigate to the Project Directory**:
   ```bash
   cd TodoList
   ```

3. **Install Dependencies**:
   Ensure you have Flutter installed and run:
   ```bash
   flutter pub get
   ```

4. **Run the App**:
   Use the following command to run the app on an emulator or a physical device:
   ```bash
   flutter run
   ```

## Usage

- **Adding a Task**: Tap the floating action button to open the task creation dialog. Enter the task name, select its priority, and hit 'Save' to add it to your list.
- **Completing a Task**: Check the box next to a task to mark it as completed. The UI will update accordingly.
- **Removing a Task**: Completed tasks remain on the list unless manually removed.

## Code Structure

- **`main.dart`**: The main entry point of the app.
- **`MyApp`**: The root widget for the app.
- **`Todolist`**: The main screen displaying the list of tasks.
- **`TodoItem`**: Represents a single to-do item with its properties.
- **`MyToDo`**: A class for creating and managing to-do items.
