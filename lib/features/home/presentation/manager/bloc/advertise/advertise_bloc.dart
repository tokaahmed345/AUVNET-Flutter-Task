import 'package:e_commerce_ui/features/home/data/models/advertise_model.dart';
import 'package:e_commerce_ui/features/home/domain/repo/advertise_repo.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/advertise/advertise_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'advertise_state.dart';
class AdvertiseBloc extends Bloc<AdvertiseEvent, AdvertiseState> {
  final AdvertiseRepo advertiseRepo;
  AdvertiseBloc(this.advertiseRepo) : super(AdvertiseInitial()) {
    on<GetAdvertsEvent>((event, emit) async {
      emit(AdvertiseLoading());

      final adverts = await advertiseRepo.getAdvertises();

      if (adverts.isNotEmpty) {
        emit(AdvertiseSuccess(adverts));
      } else {
        emit(AdvertiseFailure("No adverts found, check your internet connection and try again"));
      }
    });
  }
}
