import '../../../base/data_state/data_state.dart';

class LoginStateModel<T> {
  final T? data;
  final String? message;
  final DataState state;

  LoginStateModel(this.data, this.message, this.state);

  LoginStateModel.loading() : data = null, message = "Loading...", state = DataState.loading;
}
