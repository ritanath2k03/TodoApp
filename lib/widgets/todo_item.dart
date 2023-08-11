import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/models/todo.dart';

class TodoItem extends StatelessWidget {

  final ToDo todo;
  final onTodoChanged;
  final onDeleteItem;
  const TodoItem({Key?key,required this.todo,required this.onDeleteItem,required this.onTodoChanged}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: 20 ),
      child:ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      onTap: (){
        onTodoChanged(todo);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: Colors.white,
      leading: Icon(
          todo.isDone?Icons.check_box:Icons.check_box_outline_blank,color: todoBlue),
      title: Text(todo.todoText!,
        style: TextStyle(fontSize: 16,
            color: todoBlack,
            decoration: todo.isDone?TextDecoration.lineThrough:null),),
      trailing: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 12 ),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: todoRed,
          borderRadius:BorderRadius.circular(5)
        ),
        child: IconButton(
          color: Colors.white,
          iconSize: 18,
            icon: Icon(Icons.delete),
          onPressed: (){
           onDeleteItem(todo.id);
          },
        ),
      ),
    ) ,
    );
  }
}
