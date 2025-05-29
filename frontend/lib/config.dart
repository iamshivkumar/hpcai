class Config {
  static late String baseUrl;

  static void dev() {
    baseUrl = 'http://localhost:8080';
  }

  static void prod() {
    // baseUrl = 'https://learn-apis-jvkobau5ya-el.a.run.app';
    baseUrl = 'http://3.108.63.64';
  }
}
