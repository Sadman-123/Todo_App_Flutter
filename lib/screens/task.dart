import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:animated_snack_bar/animated_snack_bar.dart';
class Task extends StatefulWidget {
  @override
  State<Task> createState() => _TaskState();
}
class _TaskState extends State<Task> {
  TextEditingController ct = TextEditingController();
  TextEditingController ct2 = TextEditingController();
  TextEditingController edct = TextEditingController();
  TextEditingController edct2 = TextEditingController();
  List<Map<String, String>> datas = [];
  @override
  void dispose() {
    ct.dispose();
    ct2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    var containerColor = brightness == Brightness.light ? Colors.white : Colors.black38;
    var bdgclr=brightness == Brightness.light ? Colors.green : Colors.red;
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: badges.Badge(
              badgeContent: Text(
                '${datas.length}',
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(Icons.task,size: 25,),
              position: badges.BadgePosition.topEnd(top: -15, end: -4),
              badgeStyle: badges.BadgeStyle(
                badgeColor: bdgclr,
                shape: badges.BadgeShape.circle,
                borderRadius: BorderRadius.circular(12),
                padding: EdgeInsets.all(6),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(datas[index]['title'] ?? ''),
            subtitle: Text(datas[index]['content'] ?? ''),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: (){
                    setState(() {
                      edct.text=datas[index]['title']!;
                      edct2.text=datas[index]['content']!;
                    });
                    showModalBottomSheet(
                        context: context,
                        builder: (context){
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: containerColor,
                            ),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Container(
                                  child: Text("Edit Task",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
                                  margin: EdgeInsets.all(10),
                                ),
                                Divider(height: 1,color: Colors.black,thickness: 0.5,),
                                Container(
                                  margin: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: edct,
                                        decoration: InputDecoration(
                                          label: Text("Title"),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      TextField(
                                        controller: edct2,
                                        decoration: InputDecoration(
                                            label: Text("Task"),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      ElevatedButton(onPressed: (){
                                        setState(() {
                                          datas[index]['title']=edct.text;
                                          datas[index]['content']=edct2.text;
                                        });
                                        Navigator.of(context).pop();
                                        edct.clear();
                                        edct2.clear();
                                      }, child: Text("Edit Task"))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    );
                  },
                  icon: Icon(Icons.mode_edit_outlined),
                ),
                IconButton(onPressed: (){
                  setState(() {
                    datas.removeAt(index);
                  });
                }, icon: Icon(Icons.delete))
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: Text('Add to Todo'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: ct,
                      decoration: InputDecoration(
                        labelText: "Title",
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: ct2,
                      decoration: InputDecoration(
                        labelText: "Task",
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Add to Task', style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      if(ct.text=="" && ct2.text==""){
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext dialogContext) {
                            return AlertDialog(
                              title: Text('Error!',style: TextStyle(fontWeight: FontWeight.bold),),
                              content: Text('Please enter Both of them'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Try again'),
                                  onPressed: () {
                                    Navigator.of(dialogContext)
                                        .pop(); // Dismiss alert dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                      else{
                        setState(() {
                          datas.add({
                            "title": ct.text,
                            "content": ct2.text,
                          });
                        });
                        final stk=SnackBar(
                            content: Text("Added Successfully!"),

                        );
                        ScaffoldMessenger.of(context).showSnackBar(stk);
                        Navigator.of(dialogContext).pop();
                        ct.clear();
                        ct2.clear();
                      }
                    },
                  ),
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}