# Reusable Flutter code

This repository exists for reusing flutter code to maintain a consistent look 
and feel across a variety of It Is Written apps.


## Animation Widgets

Wrap any widget you want to animate with these widgets!  
  
**Example**

```dart
ReverseScaleAnimation(
  child: Container(
    width: width * .45,
    child: Image.asset(
        'assets/line_tall.jpg'),
  )
)
```

### Page Route Animations

Gives you nice custom transitions between pages!  
  
**Example**

```dart
void goToProgram(Program program) {
  Navigator.push(
      context,
      ScaleRoute(
        page: ProgramPage(
          program: program,
      ),
    )
  );
}
```

## Locale managment

Locale is detected upon app launch, if the user decides to change the language 
manually the app will store that preference as a bit value through the use of [Shared Preferences](https://pub.dev/packages/shared_preferences).
The app will load the selected language if the bit value is set

**Example in main.dart**
  
*Set the state before running MaterialApp()*

```dart
@override
void initState() {
    super.initState();
    this._fetchLocale().then((locale) {
      setState(() {
        this.localeLoaded = true;
        this.locale = locale;
      });
    });
}
```
  
*Write a function to check if the preference is set, and return the Locale for the rest of 
the app to use.*

```dart
_fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    
    if (prefs.getString('language_code') == null) {
      return null;
    }
    
    return Locale(
        prefs.getString('language_code'), prefs.getString('country_code')
    );
}
```
  
*Write a function to retrieve language when you need to change widgets based on it*

```dart
_getLanguageCode(BuildContext context) {
  return Localizations.localeOf(context).languageCode;
}
```
  
*Build widgets for certain languages*

```dart
  _getLanguageCode(context) == 'en' ? AnimationConfiguration.staggeredList() : Center()
```
  
## Theme settings and dark mode

MaterialApp() has built in fields for **theme** and **darkTheme**. We define 
overall color scheme here then call ThemeData when we need it.  
  
**Example in main.dart**

```dart
theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xff004b80),
    appBarTheme: AppBarTheme(
      color: Color(0xff004b80)
    ),
),

darkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xff4E4E4D),
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
        color: Color(0xff4E4E4D)
),
```

*To call theme colors elsewhere in the app*

```dart
BoxDecoration(
    color: Theme.of(context).primaryColor
)
```


