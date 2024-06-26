import 'package:bloc_and_context/search_with_bloc/bloc/search_bird_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BirdPage extends StatelessWidget {
  const BirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBirdBloc()..add(GetBirds()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'localy'),
                      onChanged: (value) {
                        context
                            .read<SearchBirdBloc>()
                            .add(SearchInBirdLoacliy(lexem: value));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'remotly'),
                      onChanged: (value) {
                        context
                            .read<SearchBirdBloc>()
                            .add(SearchInBirdRemotely(lexem: value));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Center(
            child: BlocConsumer<SearchBirdBloc, SearchBirdState>(
              listener: (context, state) {
                if (state is SearchResult) {
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text("Searching From Local Data"),
                    backgroundColor: Colors.green,
                  ),
                );
                }
                if (state is SearchResultRemotyl) {
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text("Searching From Remote Data"),
                    backgroundColor: Colors.green,
                  ),
                );
                }
              },
              builder: (context, state) {
                if (state is SuccessToGetBird) {
                  return ListView.builder(
                    itemCount: state.birds.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(state.birds[index].name),
                      leading: Image.network(state.birds[index].image),
                    ),
                  );
                } else if (state is SearchResult) {
                  return ListView.builder(
                    itemCount: state.birds.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(state.birds[index].name),
                      leading: Image.network(state.birds[index].image),
                    ),
                  );
                } else if (state is SearchResultRemotyl) {
                  return ListView.builder(
                    itemCount: state.birds.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(state.birds[index].name),
                      leading: Image.network(state.birds[index].image),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
