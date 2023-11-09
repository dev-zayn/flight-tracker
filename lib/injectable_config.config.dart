// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flight_tracker/core/connectivity/bloc/connectivity_bloc.dart'
    as _i3;
import 'package:flight_tracker/features/main_screen/data/data_sources/main_datasources.dart'
    as _i4;
import 'package:flight_tracker/features/main_screen/data/repositories/main_repository.dart'
    as _i6;
import 'package:flight_tracker/features/main_screen/domain/repositories/main_repository.dart'
    as _i5;
import 'package:flight_tracker/features/main_screen/domain/use_cases/main_usecase.dart'
    as _i7;
import 'package:flight_tracker/features/main_screen/presentation/bloc/main_bloc.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ConnectivityBloc>(_i3.ConnectivityBloc());
    gh.lazySingleton<_i4.MainDataSources>(() => _i4.MainDataSourcesImpl());
    gh.lazySingleton<_i5.MainRepository>(
        () => _i6.MainRepositoryImpl(dataSources: gh<_i4.MainDataSources>()));
    gh.lazySingleton<_i7.GetAirplanesUseCases>(
        () => _i7.GetAirplanesUseCases(gh<_i5.MainRepository>()));
    gh.lazySingleton<_i7.GetAirportsUseCases>(
        () => _i7.GetAirportsUseCases(gh<_i5.MainRepository>()));
    gh.singleton<_i8.MainBloc>(_i8.MainBloc(
      gh<_i7.GetAirportsUseCases>(),
      gh<_i7.GetAirplanesUseCases>(),
    ));
    return this;
  }
}
