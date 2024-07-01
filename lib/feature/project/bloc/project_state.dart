// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

class ProjectFetchedSuccessfully extends ProjectState {
  List<ProjectModel> project;
  ProjectFetchedSuccessfully({
    required this.project,
  });
}

class FailedProjects extends ProjectState {}

class LoadingProjects extends ProjectState {}