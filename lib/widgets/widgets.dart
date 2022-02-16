import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:happy_dogs_v2/bloc/map/map_bloc.dart';

import 'package:happy_dogs_v2/bloc/my_ubication/my_ubication_bloc.dart';
import 'package:happy_dogs_v2/global/constants.dart';
import 'package:happy_dogs_v2/global/environment.dart';
import 'package:happy_dogs_v2/helpers/alert_waiting.dart';
import 'package:happy_dogs_v2/helpers/mostrar_alerta.dart';
import 'package:happy_dogs_v2/models/tariff/tariff.dart';
import 'package:happy_dogs_v2/models/tariff/tariff_response.dart';
import 'package:happy_dogs_v2/pages/calendar/calendar.dart';
import 'package:http/http.dart' as http;


part 'btn_ubicacion.dart';
part 'btn_mi_ruta.dart';
part 'btn_tarifas.dart';
part 'btn_calendar.dart';