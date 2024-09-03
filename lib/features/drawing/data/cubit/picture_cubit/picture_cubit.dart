import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/repository/storage_repository.dart';
import '../../../domain/entities/curve_entity.dart';

part 'picture_cubit.freezed.dart';
part 'picture_state.dart';

@LazySingleton()
class PictureCubit extends Cubit<PictureState> {
  PictureCubit(this._storageRepository) : super(const PictureState.initial());

  final IPictureRepository _storageRepository;

  Future<void> savePicture({
    required List<CurveEntity> curves,
    required String name,
  }) async {
    if (name.isEmpty) {
      emit(const PictureState.saveFailure('Name cannot be empty!'));
      return;
    }

    emit(const PictureState.saveInProgress());

    final Either<int, String> savingResult =
        await _storageRepository.savePicture(
      name: name,
      curves: curves,
    );

    savingResult.fold(
      (int id) => emit(PictureState.saveSuccess(id)),
      (String failure) => emit(PictureState.saveFailure(failure)),
    );
  }
}
