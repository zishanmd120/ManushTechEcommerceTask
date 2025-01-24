import '../../../base/data_state/data_state.dart';

class ProductStateModel<T> extends DataStateModel<T> {

  ProductStateModel(super.data, super.message, super.state);

  ProductStateModel.loading(): super.loading();
}