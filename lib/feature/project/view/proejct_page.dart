import 'package:bloc_and_context/feature/project/bloc/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectBloc()..add(GetProjects()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocConsumer<ProjectBloc, ProjectState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is ProjectFetchedSuccessfully) {
                return ListView.builder(
                  itemCount: state.project.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(state.project[index].name),
                    subtitle: Text(state.project[index].description),
                  ),
                );
              } else {
                return Center(
                  child: LinearProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
