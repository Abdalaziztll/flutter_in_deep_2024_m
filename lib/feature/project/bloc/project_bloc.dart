import 'package:bloc/bloc.dart';
import 'package:bloc_and_context/feature/auth/bloc/auth_bloc.dart';
import 'package:bloc_and_context/model/handling_model.dart';
import 'package:bloc_and_context/model/response/project_model.dart';
import 'package:bloc_and_context/service/project_service.dart';
import 'package:meta/meta.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectInitial()) {
    on<GetProjects>((event, emit) async {
      emit(LoadingProjects());
      ResultModel result = await ProkectServiceImp().getAllProject();
      if (result is ListOf<ProjectModel>) {
        emit(
          ProjectFetchedSuccessfully(
            project: result.listOfData,
          ),
        );
      } else {
        emit(FailedProjects());
      }
    });
  }
}
