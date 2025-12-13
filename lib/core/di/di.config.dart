// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/dataSource/auth_remote_data_source.dart'
    as _i504;
import '../../features/auth/data/dataSource/auth_remote_data_source_impl.dart'
    as _i274;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecase/login_usecase.dart' as _i911;
import '../../features/auth/domain/usecase/register_usecase.dart' as _i769;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/home/data/dataSource/home_remote_data_source.dart'
    as _i845;
import '../../features/home/data/dataSource/home_remote_data_source_impl.dart'
    as _i875;
import '../../features/home/data/repository/home_repository_impl.dart' as _i9;
import '../../features/home/domain/repository/home_repository.dart' as _i541;
import '../../features/home/domain/usecase/product_usecase.dart' as _i1022;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../api/dio_helper.dart' as _i646;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i646.DioHelper>(() => _i646.DioHelper.new());
    gh.factory<_i504.AuthRemoteDataSource>(
      () => _i274.AuthRemoteDataSourceImpl(),
    );
    gh.factory<_i845.HomeRemoteDataSource>(
      () => _i875.HomeRemoteDataSourceImpl(),
    );
    gh.factory<_i961.AuthRepository>(
      () => _i409.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i504.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i911.LoginUseCse>(
      () => _i911.LoginUseCse(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.factory<_i769.RegisterUseCse>(
      () => _i769.RegisterUseCse(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.factory<_i541.HomeRepository>(
      () => _i9.HomeRepositoryImpl(gh<_i845.HomeRemoteDataSource>()),
    );
    gh.factory<_i1022.GetProductsUseCase>(
      () => _i1022.GetProductsUseCase(gh<_i541.HomeRepository>()),
    );
    gh.factory<_i117.AuthCubit>(
      () =>
          _i117.AuthCubit(gh<_i769.RegisterUseCse>(), gh<_i911.LoginUseCse>()),
    );
    gh.factory<_i9.HomeCubit>(
      () => _i9.HomeCubit(gh<_i1022.GetProductsUseCase>()),
    );
    return this;
  }
}
