/// table information for "favorite"
class FavouritesTable {
  static String tableName = 'favorite';
  static String columnId = 'id';
  static String columnTimeStamp = 'timestamp';
  static String columnFirstName = 'first_name';
  static String columnLastName = 'last_name';
  static String columnProfilePicture = 'profile_picture';
  static String columnDateOfBirth = 'date_of_birth';
  static String columnJob = 'job';
  static String columnEmail = 'email';
  static String columnPhone = 'phone';
  static String columnCity = 'city';
  static String columnZipcode = 'zipcode';
  static String columnStreet = 'street';
  static String columnState = 'state';
  static String columnCountry = 'country';
  static String columnGender = 'gender';

  static get tableCreationQuery => "CREATE TABLE $tableName ("
      "$columnId INTEGER PRIMARY KEY,"
      "$columnTimeStamp DATE DEFAULT (datetime('now','localtime')),"
      "$columnFirstName TEXT NOT NULL,"
      "$columnLastName TEXT NOT NULL,"
      "$columnProfilePicture TEXT NOT NULL,"
      "$columnDateOfBirth TEXT NOT NULL,"
      "$columnJob TEXT NOT NULL,"
      "$columnEmail TEXT NOT NULL,"
      "$columnPhone TEXT NOT NULL,"
      "$columnCity TEXT NOT NULL,"
      "$columnZipcode TEXT NOT NULL,"
      "$columnStreet TEXT NOT NULL,"
      "$columnState TEXT NOT NULL,"
      "$columnCountry TEXT NOT NULL,"
      "$columnGender TEXT NOT NULL)";
}
