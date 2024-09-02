// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repository/share_repository_impl.dart' as _i671;
import '../../domain/entities/shareable_file_entity/shareable_file_entity.dart'
    as _i807;
import '../../domain/repository/share_repository.dart' as _i1037;
import '../../domain/use_case/i_use_case.dart' as _i776;
import '../../domain/use_case/share_use_case.dart' as _i725;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i1037.ShareRepository>(() => _i671.ShareRepositoryImpl());
    gh.factoryParam<_i776.UseCase, _i807.ShareableFileEntity<dynamic>, dynamic>(
        (
      _file,
      _,
    ) =>
            _i725.ShareUseCase(_file));
    return this;
  }
}
