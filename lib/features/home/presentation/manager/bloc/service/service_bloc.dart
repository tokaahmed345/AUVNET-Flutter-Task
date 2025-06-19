import 'package:e_commerce_ui/features/home/data/models/service_model.dart';
import 'package:e_commerce_ui/features/home/domain/repo/services_repo.dart';
import 'package:e_commerce_ui/features/home/presentation/manager/bloc/service/service_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServicesRepo serviceRepo;
  ServiceBloc(this.serviceRepo) : super(ServiceInitial()) {
    on<GetServicesEvent>((event, emit) async {
      emit(ServiceLoading());

      final services = await serviceRepo.getServices();

      if (services.isNotEmpty) {
        emit(ServiceSuccess(services));
      } else {
        emit(ServiceFailure("No services found, check your internet connection and try again"));
      }
    });
  }
}
