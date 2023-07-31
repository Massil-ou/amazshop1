class aws {
  static String urlDEV = "http://107.22.131.46/AmazShop/services/";
  static String url = urlDEV;

  static String getUrl(String env) {
    if (env == "dev") {
      url = "http://107.22.131.46/AmazShop/services";
    }
    return url;
  }
}
