import 'package:flutter/material.dart';

// It's good practice to have a main function to run the app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _controller = TextEditingController();
  // Initialize with a default priority from your enum
  TodoPriority _selectedPriority = TodoPriority.Medium; // Changed from Normal

  // It's good practice to dispose of controllers
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Reset selected priority for new todo
          _selectedPriority = TodoPriority.Medium;
          _controller.clear(); // Clear previous text
          _showAddTodoModal(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('MY TODOs'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white, // For better text visibility
      ),
      body: MyTodo.todos.isEmpty
          ? const Center(
        child: Text('Nothing to do! Tap + to add a task.'),
      )
          : ListView.builder(
        itemCount: MyTodo.todos.length,
        itemBuilder: (context, index) {
          final todo = MyTodo.todos[index];
          return TodoItem(
            todo: todo,
            onChanged: (value) {
              setState(() {
                MyTodo.todos[index].completed = value;
              });
            },
            onDelete: () { // Added delete functionality
              setState(() {
                MyTodo.todos.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }

  void _showAddTodoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // isScrollControlled allows the modal to take up more height if needed for keyboard
      isScrollControlled: true,
      builder: (BuildContext ctx) { // Use BuildContext ctx to avoid conflict
        // Use StatefulBuilder to manage state local to the bottom sheet (for priority)
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter modalSetState) {
            return Padding(
              // Padding to avoid keyboard overlap
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom,
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // So it doesn't take full screen
                children: [
                  const Text('Add New Todo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'What to do?',
                      border: OutlineInputBorder(),
                    ),
                    autofocus: true, // Automatically focus the text field
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Priority:'),
                      DropdownButton<TodoPriority>(
                        value: _selectedPriority,
                        items: TodoPriority.values.map((TodoPriority priority) {
                          return DropdownMenuItem<TodoPriority>(
                            value: priority,
                            child: Text(priority.name),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          if (newValue != null) {
                            // Use modalSetState to update only the modal's UI for priority
                            modalSetState(() {
                              _selectedPriority = newValue;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _addTodoItem();
                      Navigator.pop(ctx); // Close the bottom sheet
                    },
                    child: const Text('Add Task'),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _addTodoItem() {
    final String textVal = _controller.text;
    if (textVal.isNotEmpty) {
      setState(() {
        MyTodo.todos.add(
          MyTodo(
            // Simple way to generate a somewhat unique ID for this example
            id: DateTime.now().millisecondsSinceEpoch,
            name: textVal,
            priority: _selectedPriority,
          ),
        );
      });
      _controller.clear(); // Clear the text field after adding
    }
  }
}

class TodoItem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onChanged;
  final VoidCallback onDelete; // Callback for deleting

  const TodoItem({
    super.key,
    required this.todo,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card( // Wrap with Card for better UI
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: CheckboxListTile(
        title: Text(
          todo.name,
          style: TextStyle(
            decoration: todo.completed ? TextDecoration.lineThrough : null,
            color: todo.completed ? Colors.grey : null,
          ),
        ),
        subtitle: Text('Priority: ${todo.priority.name}'),
        value: todo.completed,
        onChanged: (value) {
          if (value != null) { // Check for null before calling onChanged
            onChanged(value);
          }
        },
        controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
        secondary: IconButton( // Add a delete button
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}

class MyTodo {
  int id;
  String name;
  bool completed;
  TodoPriority priority;

  MyTodo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority,
  });

  // This is a static list, meaning all instances of TodoPage will share the same todos.
  // For a more robust app, you'd manage state differently (e.g., with a state management solution
  // like Provider, Riverpod, BLoC, or pass data through constructors).
  static List<MyTodo> todos = [];
}

// Enum for priorities - make sure these match what you use
enum TodoPriority { Low, Medium, High }
