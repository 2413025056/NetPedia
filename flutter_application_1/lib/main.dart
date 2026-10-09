import 'package:flutter/material.dart';

void main() {
  runApp(const NetPediaApp());
}

// ============================================================
// NETPEDIA APP
// Aplikasi Kamus Interaktif Istilah Jaringan Komputer
// Untuk Siswa SMK TJKT
// ============================================================

class NetPediaApp extends StatelessWidget {
  const NetPediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NetPedia',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3155D9),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

// ============================================================
// MODEL DATA
// ============================================================

class Category {
  final String name;
  final String description;
  final IconData icon;
  final Color color;

  const Category({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class Term {
  final String name;
  final String abbreviation;
  final String category;
  final String definition;
  final String explanation;
  final String example;
  final IconData icon;

  const Term({
    required this.name,
    required this.abbreviation,
    required this.category,
    required this.definition,
    required this.explanation,
    required this.example,
    required this.icon,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

// ============================================================
// DATA KATEGORI
// ============================================================

const List<Category> categories = [
  Category(
    name: 'Perangkat Jaringan',
    description: 'Perangkat keras yang digunakan untuk membangun dan menghubungkan jaringan.',
    icon: Icons.router_outlined,
    color: Color(0xFF3155D9),
  ),
  Category(
    name: 'Alamat Jaringan',
    description:
        'Istilah yang berkaitan dengan identitas dan pengalamatan perangkat.',
    icon: Icons.location_on_outlined,
    color: Color(0xFF8B5CF6),
  ),
  Category(
    name: 'Layanan Jaringan',
    description: 'Layanan dan protokol yang membantu perangkat berkomunikasi.',
    icon: Icons.miscellaneous_services_outlined,
    color: Color(0xFF0EA5A4),
  ),
];

// ============================================================
// DATA ISTILAH
// ============================================================

const List<Term> terms = [
  // ----------------------------------------------------------
  // PERANGKAT JARINGAN
  // ----------------------------------------------------------

  Term(
    name: 'Router',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition: 'Perangkat jaringan yang menghubungkan jaringan yang berbeda, misalnya jaringan rumah dengan jaringan internet.',
    explanation: 'Fungsi router adalah memilih jalur agar data sampai ke jaringan tujuan. Router membaca alamat IP tujuan pada paket data, lalu meneruskannya melalui jalur yang sesuai.',
    example: 'Di rumah, router menghubungkan jaringan Wi-Fi keluarga ke internet dan meneruskan permintaan dari ponsel ke layanan yang dibuka.',
    icon: Icons.router,
  ),

  Term(
    name: 'Switch',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition: 'Perangkat yang menghubungkan banyak perangkat, seperti komputer dan printer, dalam satu jaringan lokal berkabel.',
    explanation: 'Switch mempelajari alamat MAC perangkat yang terhubung pada setiap port. Saat menerima data, switch meneruskannya ke port tujuan jika alamatnya sudah diketahui, sehingga data tidak perlu dikirim ke semua perangkat.',
    example: 'Komputer, printer, dan server di laboratorium sekolah dapat dihubungkan ke switch agar saling bertukar data.',
    icon: Icons.hub_outlined,
  ),

  Term(
    name: 'Hub',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition: 'Perangkat jaringan sederhana yang menghubungkan beberapa perangkat dalam satu jaringan lokal melalui kabel.',
    explanation: 'Hub menerima sinyal pada satu port lalu menyalinnya ke semua port lain. Hub tidak memilih perangkat tujuan, sehingga perangkat yang tidak dituju juga menerima sinyal tersebut.',
    example: 'Pada jaringan lama untuk praktik dasar, beberapa komputer dapat disambungkan ke hub untuk memperagakan komunikasi dalam jaringan lokal.',
    icon: Icons.device_hub,
  ),

  Term(
    name: 'Access Point',
    abbreviation: 'AP',
    category: 'Perangkat Jaringan',
    definition: 'Perangkat yang menyediakan akses Wi-Fi agar ponsel, laptop, dan perangkat nirkabel lain dapat bergabung ke jaringan lokal.',
    explanation: 'Access Point memancarkan dan menerima sinyal Wi-Fi, lalu menjembatani komunikasi perangkat nirkabel dengan jaringan yang terhubung, biasanya melalui kabel ke switch atau router.',
    example: 'Sekolah dapat memasang access point di ruang kelas agar siswa dan guru terhubung ke jaringan sekolah melalui Wi-Fi.',
    icon: Icons.wifi,
  ),

  Term(
    name: 'Modem',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition: 'Perangkat yang menyesuaikan sinyal agar data dapat dikirim dan diterima melalui media komunikasi dari penyedia layanan internet.',
    explanation: 'Modem mengubah atau mengodekan sinyal digital dari jaringan lokal ke bentuk yang dapat dikirim melalui media layanan, lalu mengubah sinyal yang diterima kembali menjadi data. Jenis modem mengikuti teknologi koneksi yang digunakan.',
    example: 'Modem fiber di rumah menghubungkan jaringan pelanggan ke layanan internet melalui jaringan fiber dari penyedia layanan.',
    icon: Icons.settings_input_antenna,
  ),

  Term(
    name: 'Repeater',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition: 'Perangkat yang menerima lalu mengirim ulang sinyal jaringan untuk membantu menjangkau area yang lebih jauh.',
    explanation: 'Repeater memperkuat atau membentuk ulang sinyal yang melemah selama perjalanan, kemudian meneruskannya. Repeater memperluas jangkauan, tetapi tidak dengan sendirinya menambah kapasitas atau kecepatan layanan internet.',
    example: 'Repeater Wi-Fi dapat ditempatkan di area rumah yang jauh dari router agar sinyal lebih mudah dijangkau.',
    icon: Icons.repeat,
  ),

  Term(
    name: 'NIC',
    abbreviation: 'Network Interface Card',
    category: 'Perangkat Jaringan',
    definition: 'Komponen antarmuka jaringan yang memungkinkan komputer atau perangkat lain mengirim dan menerima data melalui jaringan.',
    explanation: 'NIC menghubungkan perangkat ke media jaringan, seperti kabel Ethernet atau Wi-Fi, dan membantu mengirim serta menerima data jaringan. NIC dapat berupa kartu terpisah atau bagian yang sudah tertanam di perangkat.',
    example: 'Komputer desktop menggunakan NIC Ethernet dan kabel LAN untuk bertukar data dengan komputer lain melalui switch.',
    icon: Icons.computer,
  ),

  Term(
    name: 'Server',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition: 'Komputer yang menyediakan data, aplikasi, atau layanan jaringan untuk digunakan oleh komputer lain yang disebut client.',
    explanation: 'Server menerima permintaan dari client melalui jaringan, menjalankan layanan yang sesuai, lalu mengirimkan balasan. Server dapat berupa komputer khusus atau komputer yang dikonfigurasi untuk tugas tersebut; web server adalah salah satu jenis layanan server.',
    example: 'Di sekolah, server dapat menyimpan berkas materi agar guru dan siswa dapat mengaksesnya melalui jaringan sesuai izin yang diberikan.',
    icon: Icons.dns_outlined,
  ),

  Term(
    name: 'Bridge',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition: 'Perangkat jaringan yang menghubungkan segmen-segmen jaringan lokal agar perangkat di segmen tersebut dapat berkomunikasi.',
    explanation: 'Bridge memeriksa alamat MAC pada data yang diterima dan meneruskannya ke segmen lain bila diperlukan. Dengan begitu, lalu lintas yang hanya ditujukan ke segmen yang sama tidak selalu perlu diteruskan ke segmen lain.',
    example: 'Bridge dapat menghubungkan dua segmen LAN di gedung sekolah agar komputer pada kedua segmen dapat saling mengakses layanan jaringan.',
    icon: Icons.account_tree_outlined,
  ),

  // ----------------------------------------------------------
  // ALAMAT JARINGAN
  // ----------------------------------------------------------
  Term(
    name: 'IP Address',
    abbreviation: 'Internet Protocol Address',
    category: 'Alamat Jaringan',
    definition: 'Alamat logis pada jaringan IP yang digunakan untuk mengenali sumber dan tujuan data, baik pada jaringan lokal maupun antarjaringan.',
    explanation: 'Perangkat menggunakan alamat IP sumber dan tujuan saat mengirim data. Router membaca alamat tujuan untuk meneruskan data ke jaringan yang tepat. Alamat IP dapat diberikan secara otomatis atau diatur secara manual.',
    example: 'Saat laptop membuka situs web, laptop menggunakan alamat IP untuk mengirim permintaan ke jaringan dan menerima balasan dari layanan tersebut.',
    icon: Icons.location_on,
  ),

  Term(
    name: 'IPv4',
    abbreviation: 'Internet Protocol version 4',
    category: 'Alamat Jaringan',
    definition: 'Versi Internet Protocol yang memakai alamat 32 bit dan biasanya ditulis sebagai empat angka desimal yang dipisahkan titik.',
    explanation: 'Setiap bagian penulisan IPv4 mewakili 8 bit. IPv4 dipakai untuk memberi alamat pada antarmuka jaringan dan membantu router mengirim paket menuju jaringan tujuan.',
    example: 'Laptop di jaringan rumah dapat memperoleh alamat IPv4 lokal seperti 192.168.1.10 dari router melalui DHCP.',
    icon: Icons.pin_outlined,
  ),

  Term(
    name: 'IPv6',
    abbreviation: 'Internet Protocol version 6',
    category: 'Alamat Jaringan',
    definition: 'Versi Internet Protocol yang memakai alamat 128 bit, dikembangkan antara lain untuk menyediakan jumlah alamat yang jauh lebih banyak daripada IPv4.',
    explanation: 'Alamat IPv6 ditulis dalam kelompok bilangan heksadesimal yang dipisahkan tanda titik dua. Perangkat dan jaringan yang mendukung IPv6 dapat menggunakan alamat ini untuk mengirim paket melalui jaringan IPv6.',
    example: 'Penyedia internet dapat memberikan alamat IPv6 kepada router rumah, lalu perangkat yang mendukung IPv6 menggunakannya saat mengakses layanan internet yang mendukung IPv6.',
    icon: Icons.language,
  ),

  Term(
    name: 'MAC Address',
    abbreviation: 'Media Access Control Address',
    category: 'Alamat Jaringan',
    definition: 'Alamat pada antarmuka jaringan yang digunakan untuk mengenali perangkat dalam komunikasi pada jaringan lokal.',
    explanation: 'Pada jaringan Ethernet atau Wi-Fi, data lokal membawa alamat MAC sumber dan tujuan. Switch menggunakannya untuk mempelajari perangkat pada port tertentu dan meneruskan data di jaringan lokal. MAC Address dapat diubah atau disamarkan oleh perangkat lunak tertentu.',
    example: 'Ketika laptop tersambung ke Wi-Fi sekolah, access point menggunakan informasi MAC pada komunikasi lokal untuk menangani lalu lintas perangkat tersebut.',
    icon: Icons.fingerprint,
  ),

  Term(
    name: 'Subnet Mask',
    abbreviation: '',
    category: 'Alamat Jaringan',
    definition: 'Nilai yang menunjukkan bagian alamat IPv4 yang menjadi identitas jaringan dan bagian yang digunakan untuk perangkat di jaringan itu.',
    explanation: 'Perangkat membandingkan alamat IP dengan subnet mask untuk menentukan apakah alamat tujuan berada di jaringan lokal. Jika berada di jaringan lain, data biasanya dikirim ke default gateway.',
    example: 'Pada jaringan 192.168.1.0 dengan subnet mask 255.255.255.0, perangkat seperti 192.168.1.10 dan 192.168.1.20 berada pada subnet yang sama.',
    icon: Icons.grid_3x3,
  ),

  Term(
    name: 'Default Gateway',
    abbreviation: '',
    category: 'Alamat Jaringan',
    definition: 'Alamat perangkat pada jaringan lokal yang menjadi tujuan pengiriman data saat perangkat perlu mengakses jaringan lain.',
    explanation: 'Perangkat membandingkan alamat tujuan dengan subnet lokalnya. Jika tujuan berada di luar subnet, perangkat mengirimkan paket ke default gateway; router kemudian meneruskannya sesuai rute yang tersedia.',
    example: 'Ponsel yang memakai Wi-Fi rumah mengirim permintaan ke alamat router sebagai default gateway saat membuka situs di internet.',
    icon: Icons.exit_to_app,
  ),

  Term(
    name: 'Network Address',
    abbreviation: '',
    category: 'Alamat Jaringan',
    definition: 'Alamat yang mewakili sebuah subnet IPv4, bukan alamat untuk satu perangkat biasa.',
    explanation: 'Network address diperoleh dari alamat IP dan subnet mask. Router menggunakan informasi jaringan ini dalam tabel rute untuk menentukan ke mana paket harus diteruskan. Dalam subnet IPv4 biasa, alamat ini tidak diberikan kepada host.',
    example: 'Pada subnet 192.168.1.0/24, 192.168.1.0 adalah network address yang mewakili subnet tersebut.',
    icon: Icons.account_tree,
  ),

  Term(
    name: 'Broadcast Address',
    abbreviation: '',
    category: 'Alamat Jaringan',
    definition: 'Alamat khusus IPv4 yang digunakan untuk mengirim data ke semua host pada subnet lokal yang sama.',
    explanation: 'Paket broadcast ditujukan kepada seluruh host pada subnet tersebut, bukan kepada satu perangkat tertentu. Router umumnya tidak meneruskan broadcast lokal ke jaringan lain.',
    example: 'Pada subnet 192.168.1.0/24, alamat broadcast-nya adalah 192.168.1.255; alamat ini mewakili pengiriman ke semua host di subnet tersebut.',
    icon: Icons.campaign_outlined,
  ),

  // ----------------------------------------------------------
  // LAYANAN JARINGAN
  // ----------------------------------------------------------
  Term(
    name: 'DHCP',
    abbreviation: 'Dynamic Host Configuration Protocol',
    category: 'Layanan Jaringan',
    definition: 'Protokol yang membantu perangkat memperoleh konfigurasi jaringan secara otomatis, seperti alamat IP, subnet mask, dan default gateway.',
    explanation: 'Perangkat meminta konfigurasi saat bergabung ke jaringan. Server DHCP menawarkan dan memberikan konfigurasi untuk jangka waktu tertentu, sehingga administrator tidak perlu mengatur setiap perangkat satu per satu.',
    example: 'Saat siswa menyambungkan laptop ke Wi-Fi sekolah, DHCP dapat memberikan alamat IP dan informasi jaringan tanpa pengaturan manual.',
    icon: Icons.settings_ethernet,
  ),

  Term(
    name: 'DNS',
    abbreviation: 'Domain Name System',
    category: 'Layanan Jaringan',
    definition: 'Sistem penamaan jaringan yang membantu mencari informasi alamat IP berdasarkan nama domain yang mudah dibaca manusia.',
    explanation: 'Perangkat meminta informasi nama domain kepada resolver DNS. Jika informasi belum tersedia di cache, resolver mencari jawaban dari server DNS lain, lalu mengembalikan hasilnya agar perangkat dapat menghubungi layanan tujuan.',
    example: 'Saat mengetik nama situs di browser, DNS membantu menemukan alamat IP yang diperlukan browser untuk menghubungi situs tersebut.',
    icon: Icons.dns_outlined,
  ),

  Term(
    name: 'HTTP',
    abbreviation: 'Hypertext Transfer Protocol',
    category: 'Layanan Jaringan',
    definition: 'Protokol yang mengatur permintaan dan balasan saat browser atau aplikasi bertukar data dengan layanan web.',
    explanation: 'Client mengirim permintaan, misalnya meminta halaman, lalu web server mengirimkan balasan. HTTP biasa tidak mengenkripsi isi komunikasi, sehingga HTTPS lebih sesuai untuk melindungi komunikasi web yang sensitif.',
    example: 'Browser meminta halaman artikel ke server web menggunakan HTTP ketika layanan tersebut memang menyediakan HTTP.',
    icon: Icons.http,
  ),

  Term(
    name: 'HTTPS',
    abbreviation: 'Hypertext Transfer Protocol Secure',
    category: 'Layanan Jaringan',
    definition: 'Penggunaan HTTP yang dilindungi TLS untuk membantu menjaga kerahasiaan dan keutuhan data serta memeriksa identitas server.',
    explanation: 'Browser dan server membuat koneksi TLS, memeriksa sertifikat server, lalu bertukar data melalui koneksi yang dienkripsi. HTTPS melindungi komunikasi, tetapi tidak dengan sendirinya menjamin bahwa isi atau pemilik situs dapat dipercaya.',
    example: 'Saat masuk ke akun sekolah melalui situs HTTPS, kata sandi dan data sesi dienkripsi selama dikirim antara browser dan server.',
    icon: Icons.lock_outline,
  ),

  Term(
    name: 'FTP',
    abbreviation: 'File Transfer Protocol',
    category: 'Layanan Jaringan',
    definition: 'Protokol untuk mengirim dan mengambil file antara client dan server melalui jaringan.',
    explanation: 'Client terhubung ke server FTP lalu menggunakan izin akun yang tersedia untuk melihat, mengunduh, atau mengunggah file. FTP biasa tidak mengenkripsi kredensial dan data; gunakan metode transfer aman yang disediakan administrator bila perlindungan diperlukan.',
    example: 'Dalam praktik jaringan, siswa dapat mengunggah berkas tugas ke server FTP laboratorium menggunakan akun yang diberikan guru.',
    icon: Icons.folder_open,
  ),

  Term(
    name: 'Web Server',
    abbreviation: '',
    category: 'Layanan Jaringan',
    definition: 'Perangkat lunak layanan yang menerima permintaan web dan mengirimkan halaman atau sumber daya yang diminta kepada client.',
    explanation: 'Web server menunggu permintaan melalui protokol web, mencari atau membuat sumber daya yang diminta, lalu mengirimkan balasan. Server juga dapat meneruskan pekerjaan tertentu ke aplikasi lain.',
    example: 'Komputer server sekolah dapat menjalankan web server untuk menampilkan portal informasi yang dibuka siswa melalui browser.',
    icon: Icons.web,
  ),

  Term(
    name: 'Proxy Server',
    abbreviation: '',
    category: 'Layanan Jaringan',
    definition: 'Server perantara yang menerima permintaan dari client dan meneruskannya sesuai aturan serta jenis proxy yang digunakan.',
    explanation: 'Client mengirim permintaan ke proxy; proxy dapat meneruskannya ke server tujuan dan mengembalikan hasilnya. Bergantung pada konfigurasi, proxy dapat membantu mengatur akses atau menyimpan salinan sementara, tetapi tidak semua proxy melakukan fungsi tersebut.',
    example: 'Jaringan sekolah dapat menggunakan proxy yang dikonfigurasi administrator untuk menerapkan kebijakan akses web bagi komputer laboratorium.',
    icon: Icons.swap_horiz,
  ),

  Term(
    name: 'VPN',
    abbreviation: 'Virtual Private Network',
    category: 'Layanan Jaringan',
    definition: 'Teknologi yang membuat koneksi virtual melalui jaringan lain agar perangkat dapat terhubung ke jaringan atau layanan tertentu.',
    explanation: 'Perangkat membuat koneksi ke layanan VPN. Bergantung pada protokol dan pengaturannya, data pada koneksi tersebut dapat dienkripsi dan diarahkan melalui jaringan VPN. VPN tidak otomatis membuat semua aktivitas atau tujuan internet aman.',
    example: 'Guru dapat memakai VPN yang disediakan sekolah untuk mengakses sumber daya jaringan internal saat bekerja dari luar sekolah.',
    icon: Icons.shield_outlined,
  ),
];

class _TermPhoto {
  final String url;
  final String attribution;

  const _TermPhoto({required this.url, required this.attribution});
}

const Map<String, _TermPhoto> _termPhotos = {
  'Router': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6d/ASUS_Wi-Fi_ROUTER_TUF_6500.jpg/960px-ASUS_Wi-Fi_ROUTER_TUF_6500.jpg',
    attribution: 'ASUS Wi-Fi ROUTER TUF 6500 — Dinkun Chen, CC BY-SA 4.0',
  ),
  'Switch': _TermPhoto(
    url: 'https://upload.wikimedia.org/wikipedia/commons/b/b9/2550T-PWR-Front.jpg',
    attribution: '2550T-PWR-Front — Geek2003, CC BY-SA 3.0',
  ),
  'Hub': _TermPhoto(
    url: 'https://upload.wikimedia.org/wikipedia/commons/d/d9/4_port_netgear_ethernet_hub.jpg',
    attribution: '4 port netgear ethernet hub, public domain',
  ),
  'Access Point': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/19/Outdoors_Wireless_Access_Point.jpg/960px-Outdoors_Wireless_Access_Point.jpg',
    attribution: 'Outdoors Wireless Access Point — Mbrickn, CC BY 4.0',
  ),
  'Modem': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2c/ADSL_modem_router_internals_labeled.jpg/960px-ADSL_modem_router_internals_labeled.jpg',
    attribution:
        'ADSL modem router internals labeled — Mike1024, public domain',
  ),
  'Repeater': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/8/82/Wireless_networking_wndw.pdf/page1-500px-Wireless_networking_wndw.pdf.jpg',
    attribution: 'Wireless Networking in the Developing World — CC BY-SA 3.0',
  ),
  'NIC': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/49/3Com-Etherlink-Network-Interface-Card-05.jpg/960px-3Com-Etherlink-Network-Interface-Card-05.jpg',
    attribution:
        '3Com Etherlink Network Interface Card — Uwe Aranas, CC BY-SA 3.0',
  ),
  'Server': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/74/Servers_in_a_Rack.jpg/960px-Servers_in_a_Rack.jpg',
    attribution: 'Servers in a Rack — Abigor, CC BY-SA 3.0',
  ),
  'Bridge': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/0/0a/Schema_bridge.jpg/960px-Schema_bridge.jpg',
    attribution: 'Schema bridge — Daniele Giacomini, CC BY-SA 2.5',
  ),
  'IP Address': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/5d/IP_stack_communication.svg/960px-IP_stack_communication.svg.png',
    attribution: 'IP stack communication — Cburnett, Kbrose, and JensLechtenboerger, CC BY-SA 4.0',
  ),
  'IPv4': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f8/IPv4_Packet-ar.svg/960px-IPv4_Packet-ar.svg.png',
    attribution: 'IPv4 Packet — Michel Bakni, CC BY-SA 4.0',
  ),
  'IPv6': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f7/IPv6_Fragmentation_Example.svg/960px-IPv6_Fragmentation_Example.svg.png',
    attribution: 'IPv6 Fragmentation Example — Jhoveran Cuno, CC BY-SA 4.0',
  ),
  'MAC Address': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9e/Network_card.jpg/960px-Network_card.jpg',
    attribution: 'Network card, CC BY-SA 3.0',
  ),
  'Subnet Mask': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a3/Address_space_in_Variable_Length_Subnet_Masking_%28VLSM%29.svg/960px-Address_space_in_Variable_Length_Subnet_Masking_%28VLSM%29.svg.png',
    attribution: 'Address space in VLSM — And1mu, CC BY-SA 4.0',
  ),
  'Default Gateway': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/63/TP-Link_AX1500_Wi-Fi_6_Router_Front.jpg/960px-TP-Link_AX1500_Wi-Fi_6_Router_Front.jpg',
    attribution: 'TP-Link AX1500 Wi-Fi 6 Router Front — Wikimedia Commons',
  ),
  'Network Address': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/a/a3/Address_space_in_Variable_Length_Subnet_Masking_%28VLSM%29.svg/960px-Address_space_in_Variable_Length_Subnet_Masking_%28VLSM%29.svg.png',
    attribution: 'Address space in VLSM — And1mu, CC BY-SA 4.0',
  ),
  'Broadcast Address': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f8/IPv4_Packet-ar.svg/960px-IPv4_Packet-ar.svg.png',
    attribution: 'IPv4 Packet — Michel Bakni, CC BY-SA 4.0',
  ),
  'DHCP': _TermPhoto(
    url: 'https://upload.wikimedia.org/wikipedia/commons/8/86/DHCP_Header_-_ar.png',
    attribution: 'DHCP Header — Michel Bakni, CC BY-SA 4.0',
  ),
  'DNS': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/60/DNS_Architecture.svg/960px-DNS_Architecture.svg.png',
    attribution: 'DNS Architecture — Aaron Filbert, CC BY-SA 4.0',
  ),
  'HTTP': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/fa/HTTP_connection_summary.png/960px-HTTP_connection_summary.png',
    attribution:
        'HTTP connection summary — Electronic Frontier Foundation, CC BY 3.0',
  ),
  'HTTPS': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/32/A_trusted_connection_framework_for_multilevel_secure_Local_Area_Networks_%28IA_atrustedconnecti109459182%29.pdf/page1-960px-A_trusted_connection_framework_for_multilevel_secure_Local_Area_Networks_%28IA_atrustedconnecti109459182%29.pdf.jpg',
    attribution:
        'A trusted connection framework — Jeffery Dwane Wilson, public domain',
  ),
  'FTP': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/bf/FTP_active_mode_ru.svg/960px-FTP_active_mode_ru.svg.png',
    attribution:
        'FTP active mode — Jérôme Blum and Alexander Golubev, CC BY-SA 4.0',
  ),
  'Web Server': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d1/First_Web_Server.jpg/960px-First_Web_Server.jpg',
    attribution: 'First Web Server — Coolcaesar, CC BY-SA 3.0',
  ),
  'Proxy Server': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/74/Servers_in_a_Rack.jpg/960px-Servers_in_a_Rack.jpg',
    attribution: 'Servers in a Rack — Abigor, CC BY-SA 3.0',
  ),
  'VPN': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/29/Virtual_Private_Network_overview_rus.svg/960px-Virtual_Private_Network_overview_rus.svg.png',
    attribution:
        'Virtual Private Network overview — Ludovic.ferre, CC BY-SA 3.0',
  ),
};

// ============================================================
// DATA SOAL LATIHAN
// ============================================================

const List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    question: 'Perangkat yang digunakan untuk menghubungkan beberapa jaringan adalah...',
    options: ['Switch', 'Router', 'Hub', 'Repeater'],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: 'Alamat yang digunakan untuk mengidentifikasi perangkat dalam jaringan disebut...',
    options: ['IP Address', 'DNS', 'HTTP', 'FTP'],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: 'Perangkat yang menghubungkan beberapa komputer dalam jaringan lokal adalah...',
    options: ['Router', 'Switch', 'Modem', 'DNS'],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: 'Layanan yang memberikan IP Address secara otomatis adalah...',
    options: ['DNS', 'HTTP', 'DHCP', 'FTP'],
    correctAnswer: 2,
  ),
  QuizQuestion(
    question:
        'Layanan yang menerjemahkan nama domain menjadi alamat IP adalah...',
    options: ['DHCP', 'DNS', 'VPN', 'FTP'],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: 'Protokol yang digunakan untuk transfer file adalah...',
    options: ['FTP', 'HTTP', 'DNS', 'DHCP'],
    correctAnswer: 0,
  ),
  QuizQuestion(
    question: 'Alamat perangkat pada antarmuka jaringan disebut...',
    options: ['DNS', 'MAC Address', 'Gateway', 'HTTP'],
    correctAnswer: 1,
  ),
  QuizQuestion(
    question: 'Teknologi yang digunakan untuk membuat koneksi jaringan virtual adalah...',
    options: ['VPN', 'Hub', 'Switch', 'NIC'],
    correctAnswer: 0,
  ),
];

// ============================================================
// WELCOME SCREEN
// ============================================================

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFEAF0FF), Color(0xFFF9FAFD), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const Spacer(),

                // Logo
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF3155D9).withOpacity(.18),
                        blurRadius: 30,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.hub,
                    size: 62,
                    color: Color(0xFF3155D9),
                  ),
                ),

                const SizedBox(height: 26),

                const Text(
                  'NetPedia',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Kamus Interaktif Istilah\nJaringan Komputer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                    color: Color(0xFF5D6472),
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9EEFF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Untuk Siswa SMK TJKT',
                    style: TextStyle(
                      color: Color(0xFF3155D9),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(height: 55),

                // Ilustrasi
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _welcomeDevice(Icons.router_outlined),
                    Container(
                      width: 65,
                      height: 3,
                      color: const Color(0xFF3155D9),
                    ),
                    _welcomeDevice(Icons.laptop_mac_outlined),
                  ],
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const MainScreen()),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF3155D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MULAI BELAJAR',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_rounded),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'Belajar istilah jaringan jadi lebih mudah 🚀',
                  style: TextStyle(color: Color(0xFF777E8B), fontSize: 13),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _welcomeDevice(IconData icon) {
    return Container(
      width: 82,
      height: 82,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFDDE3F2)),
      ),
      child: Icon(icon, size: 45, color: const Color(0xFF3155D9)),
    );
  }
}

// ============================================================
// MAIN SCREEN
// ============================================================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final Set<String> favorites = {};
  final Set<String> studiedTerms = {};

  int bestQuizScore = 0;
  int totalQuiz = 0;

  void toggleFavorite(String termName) {
    setState(() {
      if (favorites.contains(termName)) {
        favorites.remove(termName);
      } else {
        favorites.add(termName);
      }
    });
  }

  void markStudied(String termName) {
    if (!studiedTerms.contains(termName)) {
      setState(() {
        studiedTerms.add(termName);
      });
    }
  }

  void updateQuizResult(int score) {
    setState(() {
      totalQuiz++;
      if (score > bestQuizScore) {
        bestQuizScore = score;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardPage(
        favorites: favorites,
        studiedTerms: studiedTerms,
        onFavorite: toggleFavorite,
        onStudied: markStudied,
        onOpenCategory: (category) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CategoryTermsPage(
                category: category,
                favorites: favorites,
                onFavorite: toggleFavorite,
                onStudied: markStudied,
              ),
            ),
          );
        },
        onOpenQuiz: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => QuizPage(onFinished: updateQuizResult),
            ),
          );
        },
      ),
      FavoritesPage(
        favorites: favorites,
        onFavorite: toggleFavorite,
        onStudied: markStudied,
      ),
      ProgressPage(
        studiedCount: studiedTerms.length,
        favoriteCount: favorites.length,
        bestQuizScore: bestQuizScore,
        totalQuiz: totalQuiz,
      ),
    ];

    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE4EAFF),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border),
            selectedIcon: Icon(Icons.bookmark),
            label: 'Favorit',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// DASHBOARD
// ============================================================

class DashboardPage extends StatelessWidget {
  final Set<String> favorites;
  final Set<String> studiedTerms;
  final Function(String) onFavorite;
  final Function(String) onStudied;
  final Function(String) onOpenCategory;
  final VoidCallback onOpenQuiz;

  const DashboardPage({
    super.key,
    required this.favorites,
    required this.studiedTerms,
    required this.onFavorite,
    required this.onStudied,
    required this.onOpenCategory,
    required this.onOpenQuiz,
  });

  @override
  Widget build(BuildContext context) {
    final progress = studiedTerms.length / terms.length;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8EDFF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.hub, color: Color(0xFF3155D9)),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NetPedia',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Belajar TJKT lebih seru',
                          style: TextStyle(
                            color: Color(0xFF737A89),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_rounded),
                  ),
                ],
              ),
            ),
          ),

          // Greeting
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3155D9), Color(0xFF5272E8)],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Halo, Siswa TJKT! 👋',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            'Siap belajar istilah jaringan hari ini?',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.16),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${studiedTerms.length} istilah sudah dipelajari',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.school_rounded,
                      color: Colors.white,
                      size: 72,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Search
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            sliver: SliverToBoxAdapter(
              child: InkWell(
                borderRadius: BorderRadius.circular(17),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SearchPage(
                        favorites: favorites,
                        onFavorite: onFavorite,
                        onStudied: onStudied,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 54,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(color: const Color(0xFFDDE2EC)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search_rounded, color: Color(0xFF687083)),
                      SizedBox(width: 12),
                      Text(
                        'Cari istilah...',
                        style: TextStyle(color: Color(0xFF8A91A0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Categories
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Kategori',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoriesPage(
                            favorites: favorites,
                            onFavorite: onFavorite,
                            onStudied: onStudied,
                          ),
                        ),
                      );
                    },
                    child: const Text('Lihat Semua'),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => onOpenCategory(category.name),
                      child: Container(
                        width: 145,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFE2E6EF)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: category.color.withOpacity(.12),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Icon(category.icon, color: category.color),
                            ),
                            const Spacer(),
                            Text(
                              category.name,
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '${terms.where((t) => t.category == category.name).length} istilah',
                              style: TextStyle(
                                fontSize: 11,
                                color: category.color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Learning cards
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Belajar & Latihan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: _DashboardActionCard(
                      title: 'Latihan',
                      subtitle: 'Uji pemahamanmu',
                      icon: Icons.quiz_outlined,
                      color: const Color(0xFFFF8A4C),
                      buttonText: 'Mulai Latihan',
                      onTap: onOpenQuiz,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: _ProgressCard(progress: progress)),
                ],
              ),
            ),
          ),

          // Favorite
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Favorit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  if (favorites.isNotEmpty)
                    Text(
                      '${favorites.length} istilah',
                      style: const TextStyle(
                        color: Color(0xFF3155D9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
            sliver: SliverToBoxAdapter(
              child: favorites.isEmpty
                  ? _EmptyFavoriteCard()
                  : Column(
                      children: favorites.take(3).map((name) {
                        final term = terms.firstWhere((t) => t.name == name);

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TermTile(
                            term: term,
                            isFavorite: true,
                            onFavorite: () => onFavorite(term.name),
                            onTap: () {
                              onStudied(term.name);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => TermDetailPage(
                                    term: term,
                                    isFavorite: favorites.contains(term.name),
                                    onFavorite: () => onFavorite(term.name),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// DASHBOARD WIDGETS
// ============================================================

class _DashboardActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _DashboardActionCard({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E6EF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const Spacer(),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Color(0xFF737A89), fontSize: 11),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: color,
                side: BorderSide(color: color.withOpacity(.5)),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final double progress;

  const _ProgressCard({required this.progress});

  @override
  Widget build(BuildContext context) {
    final percentage = (progress * 100).round();

    return Container(
      height: 175,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E6EF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Progress Belajar',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
          ),
          const Spacer(),
          Center(
            child: SizedBox(
              width: 68,
              height: 68,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 7,
                    backgroundColor: const Color(0xFFE8EBF1),
                    color: const Color(0xFF3155D9),
                  ),
                  Text(
                    '$percentage%',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: Text(
              '${(progress * terms.length).round()} / ${terms.length} istilah',
              style: const TextStyle(color: Color(0xFF737A89), fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyFavoriteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E6EF)),
      ),
      child: const Row(
        children: [
          Icon(Icons.bookmark_border, size: 32, color: Color(0xFF8A91A0)),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              'Belum ada istilah favorit.\nSimpan istilah penting untuk dipelajari kembali.',
              style: TextStyle(
                color: Color(0xFF737A89),
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CATEGORY PAGE
// ============================================================

class CategoriesPage extends StatelessWidget {
  final Set<String> favorites;
  final Function(String) onFavorite;
  final Function(String) onStudied;

  const CategoriesPage({
    super.key,
    required this.favorites,
    required this.onFavorite,
    required this.onStudied,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 5),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Kategori Materi',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 22),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Pilih materi yang ingin kamu pelajari.',
                style: TextStyle(color: Color(0xFF737A89), fontSize: 14),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final category = categories[index];
                final categoryTerms = terms
                    .where((t) => t.category == category.name)
                    .toList();

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(22),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoryTermsPage(
                            category: category.name,
                            favorites: favorites,
                            onFavorite: onFavorite,
                            onStudied: onStudied,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: const Color(0xFFE1E5EE)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 62,
                            height: 62,
                            decoration: BoxDecoration(
                              color: category.color.withOpacity(.12),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Icon(
                              category.icon,
                              size: 31,
                              color: category.color,
                            ),
                          ),
                          const SizedBox(width: 17),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category.name,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  category.description,
                                  style: const TextStyle(
                                    color: Color(0xFF737A89),
                                    fontSize: 12,
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 9),
                                Text(
                                  '${categoryTerms.length} materi istilah',
                                  style: TextStyle(
                                    color: category.color,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 17,
                            color: Color(0xFF8A91A0),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }, childCount: categories.length),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CATEGORY TERMS PAGE
// ============================================================

class CategoryTermsPage extends StatelessWidget {
  final String category;
  final Set<String> favorites;
  final Function(String) onFavorite;
  final Function(String) onStudied;

  const CategoryTermsPage({
    super.key,
    required this.category,
    required this.favorites,
    required this.onFavorite,
    required this.onStudied,
  });

  @override
  Widget build(BuildContext context) {
    final categoryData = categories.firstWhere((c) => c.name == category);

    final categoryTerms = terms.where((t) => t.category == category).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: categoryData.color.withOpacity(.10),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: categoryData.color.withOpacity(.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    categoryData.icon,
                    color: categoryData.color,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    categoryData.description,
                    style: TextStyle(
                      color: categoryData.color,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Text(
            'Materi ${category}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 5),

          Text(
            '${categoryTerms.length} istilah tersedia untuk dipelajari.',
            style: const TextStyle(color: Color(0xFF737A89), fontSize: 13),
          ),

          const SizedBox(height: 15),

          ...categoryTerms.map(
            (term) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TermTile(
                term: term,
                isFavorite: favorites.contains(term.name),
                onFavorite: () => onFavorite(term.name),
                onTap: () {
                  onStudied(term.name);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TermDetailPage(
                        term: term,
                        isFavorite: favorites.contains(term.name),
                        onFavorite: () => onFavorite(term.name),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TERM TILE
// ============================================================

class TermTile extends StatelessWidget {
  final Term term;
  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onTap;

  const TermTile({
    super.key,
    required this.term,
    required this.isFavorite,
    required this.onFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE2E6EF)),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF0FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.network_check, color: Color(0xFF3155D9)),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    term.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (term.abbreviation.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      term.abbreviation,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF737A89),
                      ),
                    ),
                  ],
                  const SizedBox(height: 5),
                  Text(
                    term.definition,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      height: 1.4,
                      color: Color(0xFF737A89),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onFavorite,
              icon: Icon(
                isFavorite
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_border_rounded,
                color: isFavorite
                    ? const Color(0xFF3155D9)
                    : const Color(0xFF8A91A0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// DETAIL ISTILAH
// ============================================================

class TermDetailPage extends StatefulWidget {
  final Term term;
  final bool isFavorite;
  final VoidCallback onFavorite;

  const TermDetailPage({
    super.key,
    required this.term,
    required this.isFavorite,
    required this.onFavorite,
  });

  @override
  State<TermDetailPage> createState() => _TermDetailPageState();
}

class _TermDetailPageState extends State<TermDetailPage> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void favorite() {
    widget.onFavorite();
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = categories.firstWhere(
      (c) => c.name == widget.term.category,
    );
    final termPhoto = _termPhotos[widget.term.name]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Istilah'),
        actions: [
          IconButton(
            onPressed: favorite,
            icon: Icon(
              isFavorite
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_border_rounded,
              color: isFavorite
                  ? const Color(0xFF3155D9)
                  : const Color(0xFF555D6D),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 35),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [category.color, category.color.withOpacity(.75)],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.18),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(widget.term.icon, color: Colors.white, size: 38),
                ),
                const SizedBox(height: 15),
                Text(
                  widget.term.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (widget.term.abbreviation.isNotEmpty) ...[
                  const SizedBox(height: 7),
                  Text(
                    widget.term.abbreviation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 18),

          ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.network(
              termPhoto.url,
              height: 190,
              width: double.infinity,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return Container(
                  height: 190,
                  color: const Color(0xFFEAF0FF),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Color(0xFF3155D9),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 190,
                  color: const Color(0xFFEAF0FF),
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_not_supported_outlined,
                        size: 36,
                        color: Color(0xFF3155D9),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Foto materi tidak dapat dimuat',
                        style: TextStyle(color: Color(0xFF555D6D)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 4, right: 4),
            child: Text(
              'Sumber: ${termPhoto.attribution} • Wikimedia Commons',
              style: const TextStyle(color: Color(0xFF737A89), fontSize: 10),
            ),
          ),

          const SizedBox(height: 22),

          _DetailSection(
            icon: Icons.lightbulb_outline_rounded,
            title: 'Pengertian',
            child: Text(
              widget.term.definition,
              style: const TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Color(0xFF555D6D),
              ),
            ),
            onIconTap: () =>
                _showDetailPopup(context, 'Pengertian', widget.term.definition),
          ),

          const SizedBox(height: 15),

          _DetailSection(
            icon: Icons.menu_book_rounded,
            title: 'Penjelasan',
            child: Text(
              widget.term.explanation,
              style: const TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Color(0xFF555D6D),
              ),
            ),
            onIconTap: () => _showDetailPopup(
              context,
              'Penjelasan',
              widget.term.explanation,
            ),
          ),

          const SizedBox(height: 15),

          _DetailSection(
            icon: Icons.school_outlined,
            title: 'Contoh Penggunaan',
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4FF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                widget.term.example,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Color(0xFF46516A),
                ),
              ),
            ),
            onIconTap: () => _showDetailPopup(
              context,
              'Contoh Penggunaan',
              widget.term.example,
            ),
          ),

          const SizedBox(height: 20),

          FilledButton.icon(
            onPressed: favorite,
            icon: Icon(
              isFavorite
                  ? Icons.bookmark_remove_outlined
                  : Icons.bookmark_add_outlined,
            ),
            label: Text(
              isFavorite ? 'Hapus dari Favorit' : 'Simpan ke Favorit',
            ),
            style: FilledButton.styleFrom(
              backgroundColor: category.color,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showDetailPopup(BuildContext context, String title, String content) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Text(content, style: const TextStyle(height: 1.6)),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Tutup'),
        ),
      ],
    ),
  );
}

class _DetailSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;
  final VoidCallback onIconTap;

  const _DetailSection({
    required this.icon,
    required this.title,
    required this.child,
    required this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E6EF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onIconTap,
                tooltip: 'Tampilkan $title',
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints.tightFor(
                  width: 32,
                  height: 32,
                ),
                icon: Icon(icon, color: const Color(0xFF3155D9), size: 21),
              ),
              const SizedBox(width: 9),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          child,
        ],
      ),
    );
  }
}

// ============================================================
// SEARCH PAGE
// ============================================================

class SearchPage extends StatefulWidget {
  final Set<String> favorites;
  final Function(String) onFavorite;
  final Function(String) onStudied;

  const SearchPage({
    super.key,
    required this.favorites,
    required this.onFavorite,
    required this.onStudied,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final results = terms.where((term) {
      final q = query.toLowerCase();

      return term.name.toLowerCase().contains(q) ||
          term.abbreviation.toLowerCase().contains(q) ||
          term.category.toLowerCase().contains(q) ||
          term.definition.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cari Istilah',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Ketik istilah jaringan...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: query.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            query = '';
                          });
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                  borderSide: const BorderSide(color: Color(0xFFE0E4EC)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                  borderSide: const BorderSide(color: Color(0xFFE0E4EC)),
                ),
              ),
            ),
          ),

          Expanded(
            child: results.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 60,
                          color: Color(0xFF9BA2AF),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Istilah tidak ditemukan',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Coba gunakan kata kunci lain.',
                          style: TextStyle(
                            color: Color(0xFF737A89),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final term = results[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TermTile(
                          term: term,
                          isFavorite: widget.favorites.contains(term.name),
                          onFavorite: () {
                            widget.onFavorite(term.name);
                            setState(() {});
                          },
                          onTap: () {
                            widget.onStudied(term.name);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TermDetailPage(
                                  term: term,
                                  isFavorite: widget.favorites.contains(
                                    term.name,
                                  ),
                                  onFavorite: () {
                                    widget.onFavorite(term.name);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// FAVORITES PAGE
// ============================================================

class FavoritesPage extends StatelessWidget {
  final Set<String> favorites;
  final Function(String) onFavorite;
  final Function(String) onStudied;

  const FavoritesPage({
    super.key,
    required this.favorites,
    required this.onFavorite,
    required this.onStudied,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteTerms = terms
        .where((term) => favorites.contains(term.name))
        .toList();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 4),
            child: Text(
              'Favorit',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              'Istilah yang kamu simpan untuk dipelajari kembali.',
              style: TextStyle(color: Color(0xFF737A89), fontSize: 13),
            ),
          ),
          Expanded(
            child: favoriteTerms.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark_border_rounded,
                          size: 70,
                          color: Color(0xFF9BA2AF),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Belum ada Favorit',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Simpan istilah penting agar mudah\nkamu pelajari kembali.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF737A89),
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                    itemCount: favoriteTerms.length,
                    itemBuilder: (context, index) {
                      final term = favoriteTerms[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TermTile(
                          term: term,
                          isFavorite: true,
                          onFavorite: () => onFavorite(term.name),
                          onTap: () {
                            onStudied(term.name);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TermDetailPage(
                                  term: term,
                                  isFavorite: true,
                                  onFavorite: () => onFavorite(term.name),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROGRESS PAGE
// ============================================================

class ProgressPage extends StatelessWidget {
  final int studiedCount;
  final int favoriteCount;
  final int bestQuizScore;
  final int totalQuiz;

  const ProgressPage({
    super.key,
    required this.studiedCount,
    required this.favoriteCount,
    required this.bestQuizScore,
    required this.totalQuiz,
  });

  @override
  Widget build(BuildContext context) {
    final progress = studiedCount / terms.length;
    final percentage = (progress * 100).round();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
        children: [
          const Text(
            'Progress Belajar',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 5),
          const Text(
            'Pantau perkembangan belajarmu di NetPedia.',
            style: TextStyle(color: Color(0xFF737A89), fontSize: 13),
          ),

          const SizedBox(height: 25),

          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3155D9), Color(0xFF607BE8)],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                const Text(
                  'Total Progress',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: 140,
                  height: 140,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 12,
                        backgroundColor: Colors.white24,
                        color: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$percentage%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Text(
                            'selesai',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  '$studiedCount dari ${terms.length} istilah telah dipelajari',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _StatCard(
                  icon: Icons.menu_book_rounded,
                  value: '$studiedCount',
                  label: 'Dipahami',
                  color: const Color(0xFF3155D9),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  icon: Icons.bookmark_rounded,
                  value: '$favoriteCount',
                  label: 'Favorit',
                  color: const Color(0xFF8B5CF6),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _StatCard(
                  icon: Icons.quiz_rounded,
                  value: '$totalQuiz',
                  label: 'Latihan',
                  color: const Color(0xFFFF8A4C),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  icon: Icons.emoji_events_rounded,
                  value: '$bestQuizScore',
                  label: 'Skor Terbaik',
                  color: const Color(0xFF0EA5A4),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            'Kategori yang Tersedia',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 12),

          ...categories.map((category) {
            final categoryTerms = terms
                .where((term) => term.category == category.name)
                .toList();

            final studiedInCategory = categoryTerms
                .where((term) => _containsStudied(term.name))
                .length;

            final categoryProgress = studiedInCategory / categoryTerms.length;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _CategoryProgress(
                category: category,
                progress: categoryProgress,
                studied: studiedInCategory,
                total: categoryTerms.length,
              ),
            );
          }),
        ],
      ),
    );
  }

  bool _containsStudied(String name) {
    // Progress kategori akan ditampilkan berdasarkan
    // progress umum pada versi single-file ini.
    return false;
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: const Color(0xFFE2E6EF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 25),
          const SizedBox(height: 13),
          Text(
            value,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Color(0xFF737A89)),
          ),
        ],
      ),
    );
  }
}

class _CategoryProgress extends StatelessWidget {
  final Category category;
  final double progress;
  final int studied;
  final int total;

  const _CategoryProgress({
    required this.category,
    required this.progress,
    required this.studied,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E6EF)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(category.icon, color: category.color),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  category.name,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                '${(progress * 100).round()}%',
                style: TextStyle(
                  color: category.color,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
            backgroundColor: const Color(0xFFE8EBF1),
            color: category.color,
          ),
          const SizedBox(height: 7),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$studied dari $total istilah',
              style: const TextStyle(color: Color(0xFF737A89), fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// QUIZ PAGE
// ============================================================

class QuizPage extends StatefulWidget {
  final Function(int) onFinished;

  const QuizPage({super.key, required this.onFinished});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int? selectedAnswer;
  int correctCount = 0;

  void selectAnswer(int index) {
    setState(() {
      selectedAnswer = index;
    });
  }

  void nextQuestion() {
    if (selectedAnswer == null) return;

    if (selectedAnswer == quizQuestions[currentQuestion].correctAnswer) {
      correctCount++;
    }

    if (currentQuestion == quizQuestions.length - 1) {
      final score = ((correctCount / quizQuestions.length) * 100).round();

      widget.onFinished(score);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => QuizResultPage(
            score: score,
            correct: correctCount,
            total: quizQuestions.length,
          ),
        ),
      );
    } else {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = quizQuestions[currentQuestion];
    final progress = (currentQuestion + 1) / quizQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Latihan NetPedia',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: const Color(0xFFE3E7EF),
                    color: const Color(0xFF3155D9),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${currentQuestion + 1}/${quizQuestions.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF3155D9),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF0FF),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Row(
              children: [
                Icon(Icons.quiz_rounded, color: Color(0xFF3155D9), size: 28),
                SizedBox(width: 12),
                Text(
                  'Uji Pemahamanmu!',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3155D9),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Text(
            question.question,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 25),

          ...List.generate(question.options.length, (index) {
            final selected = selectedAnswer == index;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () => selectAnswer(index),
                borderRadius: BorderRadius.circular(17),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xFFE7ECFF) : Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                      color: selected
                          ? const Color(0xFF3155D9)
                          : const Color(0xFFE0E4EC),
                      width: selected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selected
                              ? const Color(0xFF3155D9)
                              : const Color(0xFFF0F2F6),
                        ),
                        child: Text(
                          String.fromCharCode(65 + index),
                          style: TextStyle(
                            color: selected
                                ? Colors.white
                                : const Color(0xFF626A79),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          question.options[index],
                          style: TextStyle(
                            fontWeight: selected
                                ? FontWeight.w800
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                      if (selected)
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFF3155D9),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 15),

          SizedBox(
            height: 54,
            child: FilledButton(
              onPressed: selectedAnswer == null ? null : nextQuestion,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF3155D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: Text(
                currentQuestion == quizQuestions.length - 1
                    ? 'SELESAI'
                    : 'SOAL BERIKUTNYA',
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// QUIZ RESULT
// ============================================================

class QuizResultPage extends StatelessWidget {
  final int score;
  final int correct;
  final int total;

  const QuizResultPage({
    super.key,
    required this.score,
    required this.correct,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    String message;

    if (score >= 80) {
      message = 'Hebat! Pemahamanmu sudah bagus 🚀';
    } else if (score >= 60) {
      message = 'Bagus! Tingkatkan lagi pemahamanmu 💪';
    } else {
      message = 'Jangan menyerah! Yuk pelajari lagi 📚';
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 105,
                  height: 105,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEAF0FF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    score >= 70
                        ? Icons.emoji_events_rounded
                        : Icons.menu_book_rounded,
                    size: 55,
                    color: const Color(0xFF3155D9),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Latihan Selesai!',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800),
                ),

                const SizedBox(height: 8),

                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xFF737A89)),
                ),

                const SizedBox(height: 30),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: const Color(0xFFE1E5EE)),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'SKOR KAMU',
                        style: TextStyle(
                          color: Color(0xFF737A89),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '$score',
                        style: const TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF3155D9),
                        ),
                      ),
                      const Text(
                        'dari 100',
                        style: TextStyle(color: Color(0xFF737A89)),
                      ),
                      const Divider(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _ResultStat(
                            value: '$correct',
                            label: 'Benar',
                            icon: Icons.check_circle_outline,
                          ),
                          _ResultStat(
                            value: '${total - correct}',
                            label: 'Salah',
                            icon: Icons.cancel_outlined,
                          ),
                          _ResultStat(
                            value: '$total',
                            label: 'Soal',
                            icon: Icons.quiz_outlined,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 53,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF3155D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: const Text(
                      'KEMBALI KE NETPEDIA',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizPage(onFinished: (_) {}),
                      ),
                    );
                  },
                  child: const Text('Coba Latihan Lagi'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResultStat extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const _ResultStat({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF3155D9)),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
        ),
        Text(
          label,
          style: const TextStyle(color: Color(0xFF737A89), fontSize: 11),
        ),
      ],
    );
  }
}
