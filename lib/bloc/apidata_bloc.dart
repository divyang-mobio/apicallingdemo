
import 'package:bloc/bloc.dart';

import '../datacalling.dart';
import '../dataconverter.dart';

part 'apidata_event.dart';
part 'apidata_state.dart';

class ApidataBloc extends Bloc<ApidataEvent, ApidataState> {
  ApidataBloc() : super(ApidataInitial()) {
    on<alldata>(_alldata);
  }

  _alldata(alldata event , Emitter<ApidataState> emit) async {
    print("bloc call");
    final HttpService httpService = HttpService();
    try {
      List<User> data = await httpService.getData();
      emit(ApidataLoaded(data: data));
    } catch (e) {
      emit(ApidataError());
    }
  }
}
