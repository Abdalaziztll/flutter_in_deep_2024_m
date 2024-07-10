import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://iyidecmdyhivdqjjdczx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml5aWRlY21keWhpdmRxampkY3p4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAxNjIyMDIsImV4cCI6MjAxNTczODIwMn0.-SSo8FqwiGpWdaQ0TdCikiQY374vE0BT1EzYk90pYRg',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController message;

  @override
  void initState() {
    message = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: supabase.from('Chat').select('*').asStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return snapshot.data![index].values.elementAt(3)
                                  as bool
                              ? SizedBox(
                                  width: 100,
                                  height: 60,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Card(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        width: 300,
                                        height: 100,
                                        child: Center(
                                          child: Text(snapshot
                                              .data![index].values
                                              .elementAt(2)
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: 100,
                                  height: 60,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Card(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        width: 300,
                                        height: 100,
                                        child: Center(
                                          child: Text(snapshot
                                              .data![index].values
                                              .elementAt(2)
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        }),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            child: TextField(
                              controller: message,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            )),
                      ),
                      IconButton(
                          onPressed: () async {
                            var temp = await supabase.from('Chat').insert({
                              "message": message.text,
                              "is_me": false
                            }).select();
                            setState(() {});
                            message.clear();
                          },
                          icon: Icon(Icons.send))
                    ],
                  )
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
