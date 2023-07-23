import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_list/model/item_model.dart';
import 'package:flutter/material.dart';
// import 'package:to_do_list/util/drawe.dart';

class ToDoListApp extends StatefulWidget {
  const ToDoListApp({Key? key}) : super(key: key);

  @override
  State<ToDoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<ToDoListApp> {
  List<Todo> todos = [];

  Future<List<Todo>> fetchingTodos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Todo> todos = body.map((dynamic item) => Todo.fromJson(item)).toList();
      return todos;
    } else {
      throw "Tasks can't be fetched";
    }
  }

  @override
  void initState() {
    super.initState();
    fetchingTodos().then((value) {
      setState(() {
        todos.addAll(value);
      });
    });
  }

  TextEditingController _textEditingController = TextEditingController();

  void _addTodo() {
    String newTodoTitle = _textEditingController.text.trim();
    if (newTodoTitle.isNotEmpty) {
      Todo newTodo = Todo(
        id: todos.length + 1,
        title: newTodoTitle,
        completed: false,
      );
      setState(() {
        todos.add(newTodo);
      });
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoList App"),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
        elevation: 5,
      ),
      // drawer: const Drawe(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = todos[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        activeColor: Colors.blue,
                        value: todo.completed,
                        onChanged: (bool? value) {
                          setState(() {
                            todo.completed = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(todo.title),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            todos.remove(todo);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textEditingController,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Add a Task",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10),
                                right: Radius.circular(10), // Add border radius to the right corners
                              ),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.blue[100],
                          ),
                        ),
                      ),
                      SizedBox(
                          width:2), // Add space of 10 units between the text field and the button
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: ElevatedButton(
                              onPressed: _addTodo,
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue[200]!),
                                shape: MaterialStateProperty.all<CircleBorder>(
                                  CircleBorder(
                                      // borderRadius: BorderRadius.circular(10),
                                      ),
                                ),
                              ))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
