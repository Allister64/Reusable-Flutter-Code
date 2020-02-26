import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyLocalizations {
  MyLocalizations(this.locale);

  final Locale locale;

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'biblestudy': 'Bible Studies',
      'aboutus': 'About Us',
      'suscribe': 'Subscribe',
      'prayerrequest': 'Prayer Request',
      'visitiiw': 'Visit It Is Written',
      'visitee': 'Visit Escrito Está',
      'language': 'Switch to Spanish',
      'home': 'Home',
      'blog': 'Blog',
      'search': 'Search',
      'au1': 'It Is Written ',
      'au2': 'is a media evangelism ministry sharing the everlasting'
          ' gospel worldwide. It Is Written is impacting lives for Christ '
          'through satellite and digital television, websites and mobile apps, '
          'global evangelistic ministry, and faith-sharing resources.',
      'au3': 'Overview\n',
      'au4': 'It Is Written is dedicated to sharing insights from God\'s'
          ' Word with people around the world. Founded in 1956 by George Vandeman,'
          'the theme of this ministry can be found in Matthew 4:4: “It is written, '
          '‘Man shall not live by bread alone, but by every word that proceeds '
          'from the mouth of God.’”',
      'au5': 'It Is Written has been positively impacting lives around '
          'the world for  the last 60 years and continues to grow under the leadership '
          'of current Speaker/Director John Bradshaw.'
          'We invite you to explore the It Is Written website for free online Bible studies,'
          ' the weekly TV program script, video podcasts and more!',
      'sub1': 'Keep up-to-date with It Is Written\n',
      'sub2': 'Subscribe below to Every Word, It Is Written\'s daily devotional '
          'from Pastor John Bradshaw, Impressions, It Is Written\'s new quarterly '
          'magazine, available on the web and in print, and It Is Written\'s weekly '
          'email updates'
    },
    'es': {
      'biblestudy': 'Estudios Bíblicos',
      'aboutus': 'Sobre nosotros',
      'suscribe': 'Suscríbete',
      'prayerrequest': 'Pedidos de oración',
      'visitiiw': 'Visita It Is Written',
      'visitee': 'Visita Escrito Está',
      'language': 'Cambiar a inglés',
      'home': 'Inicio',
      'blog': 'Noticias',
      'search': 'Buscar',
      'au1': 'Escrito Está ',
      'au2': 'es un ministerio profundamente espiritual que se dedica con '
          'pasión a la comunicación del Evangelio al mundo. Escrito Está busca '
          'producir un impacto en las vidas, a favor de Cristo, de cuatro'
          ' maneras: por medio del programa semanal, Internet, el ministerio '
          'evangelizador mundial, y recursos para compartir la fe y vivir una vida cristiana.',
      'au3': 'Visión General\n',
      'au4': 'Escrito Está es un ministerio cristiano internacional de televisión '
          'que se dedica a compartir el entendimiento de la Palabra de Dios con '
          'las personas de todo el mundo. Fue fundado en 1956 por George Vandeman, '
          'y el lema del ministerio se encuentra en Mateo 4:4: “Escrito está: No '
          'sólo de pan vivirá el hombre, sino de toda palabra que sale de la boca de Dios”.',
      'au5': 'Cada programa semanal aborda verdades perennes y las aplica a la '
          'vida diaria. Los programas suelen tratar temas tales como la soledad, '
          'el temor, la baja autoestima, la salud, los valores familiares y principios '
          'espirituales. Personas de todos los credos y religiones –incluso quienes '
          'no tienen ninguna fe—han sido inspiradas y estimuladas por las presentaciones '
          'directas y elevadoras de Escrito Está.',
      'sub1': 'Mantente al día con Escrito Está\n',
      'sub2': 'Suscríbete ahora mismo para recibir el devocional diario Una Mejor '
          'Manera de Vivir con el pastor Robert Costa.También podrás ver la '
          'revista digital Canales de Inspiración.'

    }
  };

  String translate(key) {
    return _localizedValues[locale.languageCode][key];
  }

  static String of(BuildContext context, String key) {
    return Localizations.of<MyLocalizations>(context,
        MyLocalizations).translate(key);
  }
}

class MyLocalizationsDelegate extends
LocalizationsDelegate<MyLocalizations> {

  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'es'].contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) {
    return SynchronousFuture<MyLocalizations>
      (MyLocalizations(locale));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}