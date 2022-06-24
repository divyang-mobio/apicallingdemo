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
    return BlocProvider<ApiDataBloc>(
      create: (context) => ApiDataBloc()..add(AllData()),
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
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: BlocBuilder<ApiDataBloc, ApiDataState>(
        builder: (context, state) {
          if (state is ApiDataInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ApiDataLoaded) {
            return _buildPosts(context, state.data, state.data.length);
          } else if (state is ApiDataL) {
            return _buildPosts(context, state.data, state.lenght);
          } else if (state is ApiDataError) {
            return Center(child: Text(state.data));
          } else {
            return const Center(child: Text("Sorry Something Went wrong :("));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ApiDataBloc>(context).add(SomeData(lenght: 1));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView _buildPosts(BuildContext context, List<User> data, int length) {
    return ListView.builder(
      itemCount: length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
                "${(data[index].id).toString()}. ${(data[index].title).toString()}",
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            subtitle: Text((data[index].dis).toString(),
                maxLines: 2, overflow: TextOverflow.ellipsis),
          ),
        );
      },
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
