import 'localization/loc_keys.dart';

abstract class AppConfig {
  static String baseUrl = 'https://worker.bnoop.net/api/';
  static String baseImgUrl = "https://worker.bnoop.net/";

  static String version = 'v1/';
}

const kUserLangKey = "lang";
const kDefaultLanguage = Loc.en;
const kUserKey = "user";
const kUserProfileKey = "userProfile";
const kUserToken = "token";
const kUserOnBoardIsSkipped = "onBoardingSkipped";
const kUserAddressList = "addressList";
bool kUpdateContactsMaybeLater = false;

///firebase
const firebaseApiKey = 'AIzaSyAiJDY15P4hRNQcZKn8fIekoA9COcUIeDU';
const firebaseAppId = '1:1051843546353:android:b820677e74be5beafc2d50';
const firebaseMessagingSenderId = '1051843546353';
const firebaseMessagingProjectId = 'test-c8634';

abstract class EndPoints {
  // auth
  static String loginWithDataBase = 'Auth/LogInMobileApp';
  static String profileDataWithDataBase = 'User/GetUserProfile';
  static String serviceContract({required String serviceId}) => 'OrderReport/GetServiceContract/$serviceId';
  static String contractsWithDataBase = 'Order/GetOrderContracts';
  static String advertismentWithDataBase = 'Advertisement/GetAll';
  static String preVisits = 'Order/GetPreviousOrder';
  static String nextVisits = 'Order/GetFutureOrder';

  static String registerWithDataBase = 'Auth/RegesterMobileApp';
  static String updateProfileWithDataBase = 'User/UpdateUserProfile';
  static String checkOtpWithDataBase = 'Auth/CheckLoginOTP';
  static String updateUserWithDataBase = 'profile';
/////////////////////////////////////////////////////////
  //shifts
  static String getShifts = 'Shift/GetAll';
/////////////////////////////
  //nationalities
  static String getNationalities = 'Nationality/GetAll';
  /////////////////////////////////////////////////
  // servicePerHour
  static String getServicePerHourNearCompanies({
    required String serviceId,
    required int distance,
    required String addressId,
  }) =>
      'ServicePriceHead/GetNearbyServices?ServiceId=$serviceId&UserAddressId=$addressId&DistanceInKilometers=$distance';
  ///////////////////////////////////////////////
  //order
  static String addOrder = 'Order';
  static String addContracts = 'my-contacts';

  static String updateContracts({required int id}) => 'my-contacts/$id';

  static String countries = 'location/countries';

  static String placeOfWOrk = 'work-categories';

  static String states({required countryId}) =>
      'location/states?country_id=$countryId';

  static String cities({required stateId}) =>
      'location/cities?state_id=$stateId';

  static String uploadContact = 'my-contacts/upload';

  static String unCompletedContact = 'my-contacts/uncompleted';

  static String getProfile = "profile";

  static String getRecentlyProfileImages = "profile-photo-history";

  static String aboutApp = "about-app";

  static String getFriendConnections = "connections";

  static String chatWithAi = "assistant";

  static String deleteFriendConnections(int id) => "connections/$id";

  static String deleteManyContacts({required List<int> contactIds}) {
    return 'my-contacts/destroy/many?${Uri(
      queryParameters: {
        for (var i = 0; i < contactIds.length; i++)
          'ids[$i]': contactIds[i].toString()
      },
    )}';
  }

  //////////////////////////////
  //////////////UserAddres
  static String getAllAddress(String userId) => 'UserAddres/GetByUserId/$userId';
  static String addAddress = 'UserAddres';

  static String code = ''; // todo
  static String logout = ''; // todo
  static String updateDeviceToken = ''; // todo
}
