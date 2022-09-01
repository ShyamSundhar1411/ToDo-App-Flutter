import 'package:flutter/material.dart';

class NewToDo extends StatefulWidget {
  final Function createFunction;
  NewToDo(this.createFunction);
  @override
  State<NewToDo> createState() => _NewToDoState();
}

class _NewToDoState extends State<NewToDo> {
  final titleController = TextEditingController();
  var checkedValue = false;
  void _submitData() {
    final enteredTitle = titleController.text;
    if (enteredTitle.isEmpty) {
      return;
    } else {
      widget.createFunction(enteredTitle,checkedValue);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                autocorrect: true,
                decoration: InputDecoration(labelText: "Title"),
                controller: titleController,
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.only(top: 15),
                title: Text("Important"),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = !checkedValue;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      _submitData();
                    },
                    child: Text("Add To Do"),
                  ))
            ],
          )),
    ));
  }
}
