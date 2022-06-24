import 'package:bloc/bloc.dart';

import '../datacalling.dart';
import '../dataconverter.dart';

part 'apidata_event.dart';

part 'apidata_state.dart';

class ApiDataBloc extends Bloc<ApiDataEvent, ApiDataState> {
  ApiDataBloc() : super(ApiDataInitial()) {
    on<AllData>(_alldata);
    on<SomeData>(_somedata);
  }

  _somedata(SomeData event, Emitter<ApiDataState> emit) async {
    final HttpService httpService = HttpService();
    try {
      List<User> data = await httpService.getData();
      emit(ApiDataL(lenght: event.lenght, data: data));
    } catch (e) {
      emit(ApiDataError(data: e.toString()));
    }
  }

  _alldata(AllData event, Emitter<ApiDataState> emit) async {
    print("bloc call");
    final HttpService httpService = HttpService();
    try {
      List<User> data = await httpService.getData();
      emit(ApiDataLoaded(data: data));
    } catch (e) {
      emit(ApiDataError(data: e.toString()));
    }
  }
}
