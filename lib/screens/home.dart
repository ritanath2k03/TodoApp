import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_item.dart';
class  Home extends StatefulWidget{
   Home({Key?key}):super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList=ToDo.todoList();
  List<ToDo> foundTodo=[];
final controller=TextEditingController();
@override
  void initState() {
    // TODO: implement initState
  foundTodo=todosList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: todoBGcolor,
      appBar: buildAppBar(),
    body: Stack(
      children: [
        Container(

          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child:Column(
            children: [
              buildSearchBox(),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50,bottom: 20),
                      child: Text('All Todo',style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                    for(ToDo todo in foundTodo.reversed)
                    TodoItem(todo: todo,
                      onTodoChanged: handleTodoChange,
                      onDeleteItem: deleteItem,
                    ),



                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.only(
                  bottom: 20,left: 20,right: 20
                ),
                padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow:const [ BoxShadow(color: Colors.grey,
                  offset: Offset(0.0,0.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                  )],
                  borderRadius: BorderRadius.circular(10)

                ),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'New Todo',
                        border: InputBorder.none
                  ),
                ),
              )
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,right: 20
                ),
                child: ElevatedButton(
                  child: Text('+',
                    style: TextStyle(
                      fontSize: 40
                    ),
    ),
                  onPressed:() {addItem(controller.text);},
                  style: ElevatedButton.styleFrom(
                    primary: todoBlue,
                    minimumSize: Size(60, 60),
                    elevation: 10
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
    );
  }

  void handleTodoChange(ToDo todo){
    setState(() {
      todo.isDone=!todo.isDone;
    });
  }
  void runFilter(String eKeyword){
  List<ToDo>  result=[];
  if(eKeyword.isEmpty){
    result=todosList;
  }
  else{
    result=todosList.where((element) => element.todoText!.toLowerCase().
    contains(eKeyword.toLowerCase())).toList();
  }
  setState(() {
    foundTodo=result;
  });
  }
  void deleteItem(String id){
    setState(() {
      todosList.removeWhere((item)=>item.id==id);
    });
  }
  void addItem(String word){
    setState(() {
      todosList.add(ToDo(id: DateTime.now()
          .microsecondsSinceEpoch.toString(), todoText: word));
    });
    controller.clear();
  }
  Container buildSearchBox() {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: TextField(
            onChanged: (value)=>runFilter(value),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search,color: todoBlack,size: 20,),
              prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25
              ),
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(color: todoGray)
            ),

          ),
        );
  }

  AppBar buildAppBar() {
    return AppBar(backgroundColor: todoBGcolor,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Icon(Icons.menu,
        color: todoBlack,
        size: 30,
      ),
      Container(
        height: 40,
        width: 40,
        child: ClipRRect(
         borderRadius: BorderRadius.circular(20),
          child:
        Image.asset('assets/images/profile.jpg'
        ),

        ),
      )
    ],
    ),
    );
  }
}