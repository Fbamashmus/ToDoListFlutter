# To-Do List App

This is a simple To-Do List app built with Flutter. The app allows users to add, edit, and delete tasks, and mark them as completed or not completed. The app also fetches sample data from the [JSONPlaceholder ↗](https://jsonplaceholder.typicode.com/) API to display a list of tasks.

## Features

The To-Do List app has the following features:

- Add a new task: Users can add a new task to the list by typing the task title in the input field and clicking the "Add" button.
- Edit a task: Users can edit a task by clicking on the task title and changing the text. The changes will be saved automatically.
- Delete a task: Users can delete a task by clicking on the "delete" icon next to the task title.
- Mark a task as completed: Users can mark a task as completed by clicking on the checkbox next to the task title. The checkbox will be checked when the task is completed.
- Fetch sample data: The app fetches sample data from the JSONPlaceholder API to display a list of tasks.

## Getting Started

To run the To-Do List app, you need to have Flutter installed on your computer. If you haven't installed Flutter yet, you can follow the instructions on the [Flutter website ↗](https://flutter.dev/docs/get-started/install).

Once you have Flutter installed, you can run the app on an emulator or a physical device. To do this, follow these steps:

1. Clone the repository to your local machine:

   `````bash
   git clone https://github.com/your-username/to_do_list_app.git
   ```

2. Navigate to the project directory:

   ````bash
   cd to_do_list_app
   ```

3. Install the dependencies:

   ````bash
   flutter pub get
   ```

4. Run the app:

   ````bash
   flutter run
   ```

   This will launch the app on your emulator or physical device.

## Dependencies

The To-Do List app uses the following dependencies:

- `http`: A package to make HTTP requests to the JSONPlaceholder API.
- `flutter/material.dart`: The core Flutter material design widgets.

## Directory Structure

The To-Do List app has the following directory structure:

```
|-- lib
|   |-- model
|   |   |-- item_model.dart
|   |-- util
|   |   |-- drawe.dart
|   |-- main.dart
|   |-- to_do_list_app.dart
|-- pubspec.yaml
```

- `lib/model`: This directory contains the `Todo` model class that represents a task in the app.
- `lib/util`: This directory contains a `drawer.dart` file that defines a custom drawer widget for the app.
- `lib/main.dart`: This file contains the main function that runs the app.
- `lib/to_do_list_app.dart`: This file contains the `ToDoListApp` class that defines the UI of the app.
- `pubspec.yaml`: This file contains the dependencies and metadata for the app.
