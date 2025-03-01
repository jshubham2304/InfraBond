// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../../data/datasource/bond_data_source.dart' as _i681;
import '../../data/datasource/bond_data_source_impl.dart' as _i722;
import '../../domain/repo/bond_repo.dart' as _i216;
import '../../domain/repo/bond_repo_impl.dart' as _i921;
import '../../domain/usecases/get_bond_details_use_case.dart' as _i317;
import '../../domain/usecases/get_bond_use_case.dart' as _i656;
import '../../presentation/bloc/bond_detail_cubit.dart' as _i46;
import '../../presentation/bloc/bond_list_cubit.dart' as _i877;
import '../../presentation/bloc/bookmark_cubit.dart' as _i300;
import '../network/dio_client.dart' as _i667;
import '../network/network_info.dart' as _i932;
import '../service/book_mark_service.dart' as _i947;
import '../service/share_service.dart' as _i664;
import '../utils/haptic_feedback.dart' as _i281;
import 'injection.dart' as _i464;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i667.DioClient>(() => _i667.DioClient());
  gh.lazySingleton<_i281.HapticFeedbackHelper>(
      () => _i281.HapticFeedbackHelper());
  gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i664.ShareService>(() => _i664.ShareServiceImpl());
  gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
  gh.lazySingleton<_i947.BookmarkService>(() => _i947.BookmarkServiceImpl());
  gh.lazySingleton<_i681.BondRemoteDataSource>(
      () => _i722.BondRemoteDataSourceImpl(gh<_i667.DioClient>()));
  gh.lazySingleton<_i216.BondRepository>(() => _i921.BondRepositoryImpl(
        remoteDataSource: gh<_i681.BondRemoteDataSource>(),
        networkInfo: gh<_i932.NetworkInfo>(),
      ));
  gh.factory<_i300.BookmarkCubit>(() => _i300.BookmarkCubit(
        bookmarkService: gh<_i947.BookmarkService>(),
        hapticFeedback: gh<_i281.HapticFeedbackHelper>(),
      ));
  gh.lazySingleton<_i317.GetBondDetail>(
      () => _i317.GetBondDetail(gh<_i216.BondRepository>()));
  gh.lazySingleton<_i656.GetBondList>(
      () => _i656.GetBondList(gh<_i216.BondRepository>()));
  gh.factory<_i46.BondDetailCubit>(() => _i46.BondDetailCubit(
        getBondDetail: gh<_i317.GetBondDetail>(),
        hapticFeedback: gh<_i281.HapticFeedbackHelper>(),
      ));
  gh.factory<_i877.BondListCubit>(() => _i877.BondListCubit(
        getBondList: gh<_i656.GetBondList>(),
        hapticFeedback: gh<_i281.HapticFeedbackHelper>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i464.RegisterModule {}
