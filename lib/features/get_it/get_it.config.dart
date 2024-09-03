// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/repository/picture_repository.dart' as _i1001;
import '../../data/repository/share_repository_impl.dart' as _i671;
import '../../domain/entities/shareable_file_entity/shareable_file_entity.dart'
    as _i807;
import '../../domain/repository/share_repository.dart' as _i1037;
import '../../domain/repository/storage_repository.dart' as _i668;
import '../../domain/use_case/i_use_case.dart' as _i776;
import '../../domain/use_case/share_use_case.dart' as _i725;
import '../drawing/data/cubit/picture_cubit/picture_cubit.dart' as _i583;
import 'module.dart' as _i946;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i1037.ShareRepository>(() => _i671.ShareRepositoryImpl());
    gh.lazySingleton<_i668.IPictureRepository>(
        () => _i1001.PictureRepositoryImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i583.PictureCubit>(
        () => _i583.PictureCubit(gh<_i668.IPictureRepository>()));
    gh.factory<_i776.UseCase>(
        () => _i725.ShareUseCase(gh<_i807.ShareableFileEntity<dynamic>>()));
    return this;
  }
}

class _$RegisterModule extends _i946.RegisterModule {}
