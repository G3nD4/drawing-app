part of 'picture_cubit.dart';

@freezed
class PictureState with _$PictureState {
  const factory PictureState.initial() = _Initial;

  const factory PictureState.saveFailure(String failure) = _SaveFailure;

  const factory PictureState.saveSuccess(int id) = _SaveSuccess;

  const factory PictureState.saveInProgress() = _SaveInProgress;
}
