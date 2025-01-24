enum DataState {
  loading,
  success,
  failed,
  validationError,
}

class DataStateModel<T> {

  T? data;

  String? message;

  DataState state = DataState.loading;

  DataStateModel(this.data, this.message, this.state);

  DataStateModel.loading();
}