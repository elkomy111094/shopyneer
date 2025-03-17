enum Environment { development, staging, production }

class EnvironmentConfig {
  static const Environment currentEnvironment = Environment.development;

  static String get baseUrl {
    switch (currentEnvironment) {
      case Environment.staging:
        return "https://staging.api.example.com";
      case Environment.production:
        return "https://api.example.com";
      default:
        return "https://dev.api.example.com";
    }
  }
}
