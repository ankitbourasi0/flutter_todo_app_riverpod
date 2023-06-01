class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '1', todoText: "Make Appointment", isDone: true),
      ToDo(id: '2', todoText: "Doctor Visit"),
      ToDo(id: '3', todoText: "Car Visit", isDone: true),
      ToDo(id: '4', todoText: "Mangement ", isDone: true),
      ToDo(id: '5', todoText: "Gardening ", isDone: true),
      ToDo(id: '6', todoText: "Study"),
      ToDo(id: '7', todoText: "Lunch", isDone: true),
      ToDo(id: '8', todoText: "Startup"),
      ToDo(id: '9', todoText: "Lock"),
    ];
  }
}
