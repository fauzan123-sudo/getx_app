class HomeCardEntities {
  final String date;
  final String label;
  final String description;
  final String cost;

  HomeCardEntities(
      {required this.date,
      required this.label,
      required this.description,
      required this.cost});
}

final List<HomeCardEntities> listAllHomeCard = [
  HomeCardEntities(
      date: 'Senin, 12 Januari 2020',
      label: 'Menunggu Pembayaran',
      description: 'SPP, Ujian Tengah Semester 1',
      cost: 'Rp. 100.000'),
  HomeCardEntities(
      date: 'Selasa, 13 Februari 2021',
      label: 'Pending',
      description: 'SPP, Ujian Semester 1, LKS, Ujian Semester 2, ....',
      cost: 'Rp. 200.000'),
  HomeCardEntities(
      date: 'Senin, 14 Maret 2022',
      label: 'Sudah Dibayar',
      description: 'SPP, Ujian Semester 1, LKS',
      cost: 'Rp. 230.000'),
  HomeCardEntities(
      date: 'Senin, 15 April 2023',
      label: 'Sudah Dibayar',
      description: 'SPP, Ujian Semester 1, LKS, Ujian Semester 2, ....',
      cost: 'Rp. 550.000'),
  HomeCardEntities(
      date: 'Senin, 16 Mei 2024',
      label: 'Sudah Dibayar',
      description: 'LKS, Ujian Semester 2, ....',
      cost: 'Rp. 240.000'),
  HomeCardEntities(
      date: 'Senin, 17 Juni 2025',
      label: 'Sudah Dibayar',
      description: 'SPP',
      cost: 'Rp. 450.000'),
];
