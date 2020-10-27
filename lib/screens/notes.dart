import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:test_app_rf/common_widgets/text_fild.dart';
import 'package:test_app_rf/service_size/size_config.dart';


class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  TextEditingController listController = TextEditingController();

  List<String> simpleList = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double myHight = SizeConfig.safeBlockHorizontal;
    double myWidth = SizeConfig.safeBlockVertical;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: true,
            expandedHeight: myHight * 60,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Notes',
                style: TextStyle(fontSize: myHight * 12),
              ),
              centerTitle: true,
            ),
          ),
          SliverPinnedHeader(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: myWidth * 42,
                    child: MyTextFild(
                      myController: listController,
                      myFillColor: Colors.cyan,
                      myHight: myHight,
                      myHintText: 'Текст',
                    ),
                  ),
                  FlatButton(
                    color: Colors.green,
                    shape: CircleBorder(side: BorderSide(color: Colors.pink)),
                    onPressed: () {
                      setState(() {
                        simpleList.add(listController.text);
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,
                        width: myWidth * 44,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blueGrey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(simpleList[index]),
                        ),
                      ),
                    ),
                    FlatButton(
                      shape:
                          CircleBorder(side: BorderSide(color: Colors.yellow)),
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          simpleList.removeAt(index);
                        });
                      },
                      child: Text('X'),
                    ),
                  ],
                );
              },
              childCount: simpleList.length,
            ),
          ),
        ],
      ),
    );
  }
}
