library functions;

String parseWeatherDescriptionToEs(String? weatherDescription) {
  String state = '';
  switch (weatherDescription) {
    case 'Thunderstorm':
      state = 'Tormenta Eléctrica';
      break;
    case 'Drizzle':
      state = 'Llovizna';
      break;
    case 'Rain':
      state = 'Lluvia';
      break;
    case 'Snow':
      state = 'Nieve';
      break;
    case 'Clear':
      state = 'Despejado';
      break;
    case 'Clouds':
      state = 'Nublado';
      break;
    case 'Mist':
      state = 'Neblina';
      break;
    case 'Haze':
      state = 'Calima';
      break;
    case 'Ash':
      state = 'Ceniza Volcánica';
      break;
    case 'Tornado':
      state = 'Tornado';
      break;
    case 'Dust':
      state = 'Polvo/Tormenta';
      break;
    default:
      state = '';
  }
  return state;
}
