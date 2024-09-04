import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home:Todolist()
    );
  }
}

class Todolist extends StatefulWidget{
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  final _controller = TextEditingController();
  TodoPriority priority = TodoPriority.normal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              addTodo();
            },
            child: const Icon(Icons.add)),
        appBar: AppBar(title:const Text("My ToDo List")),

        body:MyToDo.todos.isEmpty ?
        const Center(child: Text('Nothing to do!')):
        ListView.builder(
            itemCount: MyToDo.todos.length,
            itemBuilder: (context, index) {
              final todo = MyToDo.todos[index];
              return TodoItem(todo: todo, onChanged: (value){
                setState(() {
                  MyToDo.todos[index].completed = value;
                });
              });
            })
    );
  }

  void addTodo() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => StatefulBuilder(
          builder: (context, setBuilderState) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children:[
                  TextField(
                      controller : _controller,
                      decoration : const InputDecoration(
                          hintText: 'What to do?'
                      )
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Select Priority"),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Radio<TodoPriority>(
                          value:TodoPriority.low,
                          groupValue: priority,
                          onChanged: (value){
                            setBuilderState(() {
                              priority = value!;
                            });
                          },
                        ),
                        Text(TodoPriority.low.name),

                        Radio<TodoPriority>(
                          value:TodoPriority.normal,
                          groupValue: priority,
                          onChanged: (value){
                            setBuilderState(() {
                              priority = value!;
                            });
                          },
                        ),
                        Text(TodoPriority.normal.name),

                        Radio<TodoPriority>(
                          value:TodoPriority.high,
                          groupValue: priority,
                          onChanged: (value){
                            setBuilderState(() {
                              priority = value!;
                            });
                          },
                        ),
                        Text(TodoPriority.high.name)
                      ]
                  ),
                  ElevatedButton(
                      onPressed: _save,
                      child: const Text('Save'))
                ]
            ),
          ),
        ));
  }

  void _save() {
    if(_controller.text.isEmpty){
      showMsg(context, 'Input Field must not be empty');
      return;
    }

    final todo = MyToDo(
        id: DateTime.now().millisecondsSinceEpoch,
        name: _controller.text,
        priority: priority);

    MyToDo.todos.add(todo);
    _controller.clear();
    setState(() {

    });
    Navigator.pop(context);
  }
}

void showMsg(BuildContext context, String s) {
  showDialog(
      context: context,
      builder :(context) => AlertDialog(
          title:const Text("Caution!"),
          content: Text(s),
          actions:[
            TextButton(
              onPressed: ()=> Navigator.pop(context),
              child: const Text('CLOSE'),
            )
          ]
      ));
}

class TodoItem extends StatelessWidget {
  final MyToDo todo;
  final Function(bool) onChanged;
  const TodoItem({super.key, required this.todo, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(todo.name),
        subtitle: Text('Priority: ${todo.priority.name}'),
        value: todo.completed,
        onChanged: (value){
          onChanged(value!);
        }
    );
  }
}


class MyToDo{
  int id;
  String name;
  bool completed;
  TodoPriority priority;

  MyToDo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority
  });

  static List<MyToDo> todos = [];

}

enum TodoPriority{
  low,
  normal,
  high
}
