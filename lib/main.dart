import 'package:apicallingdemo/bloc/apidata_bloc.dart';
import 'package:apicallingdemo/dataconverter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApidataBloc()..add(alldata()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'real life example of Bloc'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User>? posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: BlocBuilder<ApidataBloc, ApidataState>(
        // bloc: ,
        builder: (context, state) {
          if (state is ApidataInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ApidataLoaded) {
            return ListView.builder(
              itemCount: state.data.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      // color: Colors.greenAccent,
                      elevation: 4,
                      child: ListTile(
                        title: Text(
                          "${(state.data[index].id).toString()}. ${(state.data[index].title).toString()}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text((state.data[index].body).toString() , maxLines: 2,overflow: TextOverflow.ellipsis,),
                      ),
                    ),
                    // SizedBox(height: 10)
                  ],
                );
              },
            );
          } else if (state is ApidataError) {
            return const Center(child: Text("error"));
          } else {
            return const Center(child: Text("Sorry Something Went wrong :("));
          }
          // buildBody(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

// FutureBuilder<List<User>> buildBody(BuildContext context) {
//   final HttpService httpService = HttpService();
//   return FutureBuilder(
//       future: httpService.getData(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           List<User>? posts = snapshot.data;
//           return ListView.builder(
//             itemCount: posts?.length,
//             padding: EdgeInsets.all(8),
//             itemBuilder: (context, index) {
//               return Card(
//                 elevation: 4,
//                 child: ListTile(
//                   title: Text(
//                     (posts?[index].title).toString(),
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text((posts?[index].body).toString()),
//                 ),
//               );
//             },
//           );
//         } else {
//           return const CircularProgressIndicator();
//         }
//       });
// }
}
