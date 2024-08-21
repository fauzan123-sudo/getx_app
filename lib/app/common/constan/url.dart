class AppUrl {
  // String BASEAPI = "http://ngastaa.com/api/";
  static String BASEURL = "https://sianwar.smpannuralanwar.sch.id/api";
  // static String BASEURL = "http://192.168.18.21:8000/api";
  static String loginUrl = '$BASEURL/auth';
  static String homeUrl = '$BASEURL/home';

  // Bill
  static String list_tagihan = '$BASEURL/tagihan/list';

  // Payment
  static String list_r_pembayaran = '$BASEURL/riwayat-pembayaran/list';
  static String pembayaran_create = '$BASEURL/pembayaran/create';
  static String pembayaran = '$BASEURL/pembayaran/list';
  static String pembayaran_detail = '$BASEURL/pembayaran/detail';
  static String list_r_pembayaran_detail = '$BASEURL/riwayat-pembayaran/detail';

  // Transaction
  static String add_transaction = '$BASEURL/';

  // URl for image
  static String ImageUser = "https://i.ibb.co/k15qWF7/photo-1487412720507-e7ab37603c6f-ixlib-rb-4-0.jpg";
}
