class InformasiPublik {
  final String title;
  final String docs;

  InformasiPublik({this.title, this.docs});
}

List<InformasiPublik> informasiPublik = [
  InformasiPublik(
      title: 'Informasi Publik Yang Wajib Diumumkan Serta Merta',
      docs: 'file/SERTAMERTA.pdf'),
  InformasiPublik(
      title: 'Informasi Publik Yang Disediakan Setiap Saat',
      docs: 'file/SETIAPSAAT.pdf'),
  InformasiPublik(
      title:
          'Informasi Publik Yang Wajib Disediakan Dan Diumumkan Secara Berkala',
      docs: 'file/SECARABERKALA.pdf')
];
