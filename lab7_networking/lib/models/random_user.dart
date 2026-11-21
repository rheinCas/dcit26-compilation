/// A user parsed from randomuser.me. All values are generated sample data.
/// Password, salt and hash fields are deliberately NOT stored.
class RandomUser {
  const RandomUser({
    required this.fullName,
    required this.gender,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.timezone,
    required this.email,
    required this.dob,
    required this.age,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.idName,
    required this.idValue,
    required this.nationality,
    required this.username,
    required this.uuid,
    required this.pictureUrl,
    required this.thumbnailUrl,
  });

  final String fullName;
  final String gender;
  final String street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final String timezone;
  final String email;
  final String dob;
  final String age;
  final String registered;
  final String phone;
  final String cell;
  final String idName;
  final String idValue;
  final String nationality;
  final String username;
  final String uuid;
  final String pictureUrl;
  final String thumbnailUrl;

  /// Builds a user from the `results[0]` map.
  factory RandomUser.fromJson(Map<String, dynamic> json) {
    final name = _map(json['name']);
    final location = _map(json['location']);
    final street = _map(location['street']);
    final timezone = _map(location['timezone']);
    final login = _map(json['login']);
    final dob = _map(json['dob']);
    final registered = _map(json['registered']);
    final id = _map(json['id']);
    final picture = _map(json['picture']);

    final fullName = [
      _text(name['title']),
      _text(name['first']),
      _text(name['last']),
    ].where((part) => part != 'Not available').join(' ');

    final streetText = [
      _text(street['number']),
      _text(street['name']),
    ].where((part) => part != 'Not available').join(' ');

    final tzOffset = _text(timezone['offset']);
    final tzDescription = _text(timezone['description']);
    final timezoneText = (tzOffset == 'Not available' &&
            tzDescription == 'Not available')
        ? 'Not available'
        : '$tzOffset $tzDescription'.replaceAll('Not available', '').trim();

    return RandomUser(
      fullName: fullName.isEmpty ? 'Unknown user' : fullName,
      gender: _text(json['gender']),
      street: streetText.isEmpty ? 'Not available' : streetText,
      city: _text(location['city']),
      state: _text(location['state']),
      country: _text(location['country']),
      postcode: _text(location['postcode']), // number OR string
      timezone: timezoneText.isEmpty ? 'Not available' : timezoneText,
      email: _text(json['email']),
      dob: _date(dob['date']),
      age: _text(dob['age']),
      registered: _date(registered['date']),
      phone: _text(json['phone']),
      cell: _text(json['cell']),
      idName: _text(id['name']),
      idValue: _text(id['value']),
      nationality: _text(json['nat']),
      username: _text(login['username']),
      uuid: _text(login['uuid']),
      pictureUrl: _text(picture['large'], fallback: ''),
      thumbnailUrl: _text(picture['thumbnail'], fallback: ''),
    );
  }

  /// Safely turns a JSON value into a Map (empty if missing).
  static Map<String, dynamic> _map(dynamic value) =>
      value is Map<String, dynamic> ? value : <String, dynamic>{};

  /// Turns any value into text, with a fallback when it is null or empty.
  static String _text(dynamic value, {String fallback = 'Not available'}) {
    if (value == null) return fallback;
    final text = value.toString().trim();
    return text.isEmpty ? fallback : text;
  }

  /// Shows only the date part (2015-06-10) of an ISO date string.
  static String _date(dynamic value) {
    final text = _text(value);
    return text.length >= 10 ? text.substring(0, 10) : text;
  }
}