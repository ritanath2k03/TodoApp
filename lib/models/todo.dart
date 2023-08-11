

class ToDo{
  String ? id;
  String ? todoText;
  bool  isDone;
  ToDo({
   required this.id,
    required this.todoText,
   this.isDone=false,
});
  static List <ToDo> todoList(){
    return[
      ToDo(id: '01', todoText: 'DAA',isDone: true),
      ToDo(id: '02', todoText: 'DSA',isDone: true),
      ToDo(id: '03', todoText: 'Network'),
      ToDo(id: '04', todoText: 'Automata',isDone: true),
      ToDo(id: '05', todoText: 'OOPS'),
    ];
  }
}