// ignore_for_file: unused_local_variable

import 'package:book_basket/Data/repositories/auth_repositories.dart';
import 'package:book_basket/Data/services/secure_storage.dart';
import 'package:book_basket/Logic/Cubit/auth_cubit/auth_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

Future<List<BlocProvider>> getBlocProviders(
    SecureStorage secureStorage, HydratedStorage hydratedStorage) async {
  // system utilities
  final Connectivity connectivity = Connectivity();

  final AuthRepository authRepository = AuthRepository();
  // final UserProfileRepository userProfileRepository = UserProfileRepository();
  // final LocaleRepository localeRepository = LocaleRepository();
  // repositories
  // final CommonRepository commonRepository = CommonRepository();
  return [
    BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(
              secureStorage: secureStorage,
              authRepository: authRepository,
              // hydratedStorage: hydratedStorage,
              // localeCubit: context.read<LocaleCubit>(),
            )),

    // BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
    // BlocProvider<InternetCubit>(
    //     create: (context) => InternetCubit(connectivity: connectivity)),
    // BlocProvider<LocaleCubit>(
    //     create: (context) => LocaleCubit(localeRepository: localeRepository)),
  ];
}

// Future<List<BlocProvider>> getBlocProviders(
//     SecureStorage secureStorage, HydratedStorage hydratedStorage) async {
//   // system utilities
//   final Connectivity connectivity = Connectivity();

//   // repositories
//   final CommonRepository commonRepository = CommonRepository();
//   final StoreRepository storeRepository = StoreRepository();
//   final AuthRepository authRepository = AuthRepository();
//   final LocaleRepository localeRepository = LocaleRepository();
//   final ShopperRepository shopperRepository = ShopperRepository();
//   final TransactionRepository transactionRepository = TransactionRepository();
//   final CartRepository cartRepository = CartRepository();
//   final HomeRepository homeRepository = HomeRepository();

//   return [
//     BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
//     BlocProvider<InternetCubit>(
//         create: (context) => InternetCubit(connectivity: connectivity)),
//     BlocProvider<LocaleCubit>(
//         create: (context) => LocaleCubit(localeRepository: localeRepository)),
//     BlocProvider<CommonCubit>(
//         create: (context) => CommonCubit(commonRepository: commonRepository)),
//     BlocProvider<StoreCubit>(
//         create: (context) => StoreCubit(storeRepository: storeRepository)),
//     BlocProvider<ContactsCubit>(
//         create: (context) => ContactsCubit(
//             shopperRepository: shopperRepository,
//             storeCubit: context.read<StoreCubit>())),
//     BlocProvider<AuthCubit>(
//         create: (context) => AuthCubit(
//             secureStorage: secureStorage,
//             hydratedStorage: hydratedStorage,
//             authRepository: authRepository,
//             localeCubit: context.read<LocaleCubit>(),
//             storeCubit: context.read<StoreCubit>())),
//     BlocProvider<FormsCubit>(
//       create: (context) => FormsCubit(),
//     ),
//     BlocProvider<ShopperCubit>(
//       create: (context) => ShopperCubit(
//         shopperRepository: shopperRepository,
//         storeCubit: context.read<StoreCubit>(),
//       ),
//     ),
//     BlocProvider<CartCubit>(
//       create: (context) => CartCubit(
//         cartRepository: cartRepository,
//         storeCubit: context.read<StoreCubit>(),
//       ),
//     ),
//     BlocProvider<TransactionCubit>(
//       create: (context) => TransactionCubit(
//         transactionRepository: transactionRepository,
//         storeCubit: context.read<StoreCubit>(),
//       ),
//     ),
//     BlocProvider<HomeCubit>(
//       create: (context) => HomeCubit(
//         homeRepository: homeRepository,
//         storeCubit: context.read<StoreCubit>(),
//       ),
//     ),
//   ];
// }
