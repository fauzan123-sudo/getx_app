class HomeListDetail {
  final String paymentName;
  final String cost;

  HomeListDetail({required this.paymentName, required this.cost});
}

final List<HomeListDetail> listDetail = [
  HomeListDetail(paymentName: 'SPP FEBRUARI ', cost: 'Rp50.000'),
  HomeListDetail(paymentName: 'LKS KELAS 2 ', cost: 'Rp70.000'),
];
