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
  final List<String> relatedTermNames;
  final String studyTip;

  const Term({
    required this.name,
    required this.abbreviation,
    required this.category,
    required this.definition,
    required this.explanation,
    required this.example,
    required this.icon,
    this.relatedTermNames = const [],
    this.studyTip = '',
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
  Category(
    name: 'Topologi Jaringan',
    description:
        'Pola susunan perangkat dan jalur hubungan dalam sebuah jaringan.',
    icon: Icons.account_tree_outlined,
    color: Color(0xFFF59E0B),
  ),
  Category(
    name: 'Alat Praktik Jaringan',
    description: 'Peralatan untuk memasang, memeriksa, dan merapikan instalasi jaringan.',
    icon: Icons.build_outlined,
    color: Color(0xFF0EA5A4),
  ),
  Category(
    name: 'Pemecahan Masalah Jaringan',
    description: 'Perintah dan gejala dasar untuk memeriksa koneksi jaringan.',
    icon: Icons.troubleshoot,
    color: Color(0xFF3155D9),
  ),
  Category(
    name: 'Kinerja Jaringan',
    description:
        'Ukuran dan kondisi yang memengaruhi kelancaran komunikasi jaringan.',
    icon: Icons.speed_outlined,
    color: Color(0xFF8B5CF6),
  ),
  Category(
    name: 'Keamanan Jaringan',
    description:
        'Cara dasar mengatur akses dan melindungi data saat berkomunikasi.',
    icon: Icons.security_outlined,
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
    relatedTermNames: ['Switch', 'IP Address', 'Default Gateway'],
    studyTip: 'Ikuti perjalanan paket: router meneruskan data antarjaringan, sedangkan switch menghubungkan perangkat dalam satu LAN.',
  ),

  Term(
    name: 'Switch',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition: 'Perangkat yang menghubungkan banyak perangkat, seperti komputer dan printer, dalam satu jaringan lokal berkabel.',
    explanation: 'Switch mempelajari alamat MAC perangkat yang terhubung pada setiap port. Saat menerima data, switch meneruskannya ke port tujuan jika alamatnya sudah diketahui, sehingga data tidak perlu dikirim ke semua perangkat.',
    example: 'Komputer, printer, dan server di laboratorium sekolah dapat dihubungkan ke switch agar saling bertukar data.',
    icon: Icons.hub_outlined,
    relatedTermNames: ['Router', 'Hub', 'MAC Address'],
    studyTip: 'Bedakan switch dan hub: switch meneruskan data ke port tujuan berdasarkan alamat MAC, sedangkan hub menyalinnya ke port lain.',
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
    relatedTermNames: ['Router', 'NIC', 'DHCP'],
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

  Term(
    name: 'Kabel UTP',
    abbreviation: 'Unshielded Twisted Pair',
    category: 'Perangkat Jaringan',
    definition: 'Kabel jaringan tembaga yang berisi pasangan kawat berpilin tanpa pelindung logam menyeluruh.',
    explanation: 'Pilinan kawat membantu mengurangi gangguan pada sinyal. Kabel UTP umum digunakan untuk Ethernet dan biasanya dipasang dengan konektor RJ45 pada kedua ujungnya.',
    example: 'Kabel UTP dapat menghubungkan komputer di laboratorium ke switch agar komputer masuk ke jaringan lokal.',
    icon: Icons.cable,
  ),

  Term(
    name: 'Kabel STP',
    abbreviation: 'Shielded Twisted Pair',
    category: 'Perangkat Jaringan',
    definition: 'Kabel jaringan tembaga berisi pasangan kawat berpilin yang memiliki lapisan pelindung untuk membantu mengurangi gangguan listrik dari luar.',
    explanation: 'Pelindung pada kabel STP membantu mengurangi gangguan elektromagnetik. Pemasangan dan grounding perlu mengikuti jenis kabel serta perangkat yang digunakan agar pelindungnya berfungsi dengan baik.',
    example: 'Kabel STP dapat dipilih untuk jalur Ethernet di area kerja yang berdekatan dengan mesin listrik dan memiliki gangguan elektromagnetik.',
    icon: Icons.cable,
  ),

  Term(
    name: 'Fiber Optik',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition: 'Media jaringan yang membawa data sebagai pulsa cahaya melalui serat kaca atau plastik yang sangat halus.',
    explanation: 'Perangkat pemancar mengubah data menjadi sinyal cahaya, lalu serat optik membawanya ke penerima yang mengubahnya kembali menjadi data. Fiber optik umum dipakai untuk koneksi berkapasitas tinggi dan jarak jauh; pemasangannya memerlukan konektor serta perangkat optik yang sesuai.',
    example: 'Penyedia internet dapat menggunakan kabel fiber optik dari jaringan distribusi hingga perangkat terminasi di rumah pelanggan.',
    icon: Icons.fiber_manual_record,
  ),

  Term(
    name: 'Kabel Koaksial',
    abbreviation: 'Coaxial cable',
    category: 'Perangkat Jaringan',
    definition: 'Kabel yang memiliki konduktor di tengah, lapisan isolasi, dan pelindung konduktif di bagian luar.',
    explanation: 'Susunan lapisannya membantu membawa sinyal listrik sekaligus mengurangi gangguan dari luar. Kabel koaksial digunakan pada beberapa instalasi televisi kabel, antena, dan sistem CCTV sesuai perangkatnya.',
    example: 'Kabel koaksial dapat menghubungkan antena televisi ke televisi atau perangkat penerima yang memiliki konektor koaksial.',
    icon: Icons.cable,
  ),

  Term(
    name: 'Konektor RJ45',
    abbreviation: 'Registered Jack 45',
    category: 'Perangkat Jaringan',
    definition: 'Konektor modular yang umum dipasang pada ujung kabel twisted pair Ethernet untuk menghubungkan kabel ke port jaringan.',
    explanation: 'Konektor dipasang pada kabel dengan urutan kawat yang sesuai standar pemasangan. Istilah RJ45 sering dipakai sehari-hari untuk konektor Ethernet 8P8C; konektor harus cocok dengan jenis kabel dan perangkat.',
    example: 'Kabel UTP yang sudah dipasangi konektor RJ45 dapat dicolokkan ke port Ethernet pada komputer dan switch.',
    icon: Icons.settings_ethernet,
  ),

  Term(
    name: 'Patch Cord',
    abbreviation: '',
    category: 'Perangkat Jaringan',
    definition: 'Kabel jaringan pendek yang sudah dipasangi konektor pada kedua ujungnya untuk menghubungkan perangkat atau titik terminasi jaringan.',
    explanation: 'Patch cord memudahkan penyambungan tanpa perlu memasang konektor sendiri saat digunakan. Jenis kabel dan konektornya harus sesuai dengan port dan media jaringan, misalnya kabel Ethernet tembaga dengan konektor RJ45.',
    example: 'Di ruang server, patch cord menghubungkan port patch panel ke switch; di meja kerja, kabel ini dapat menghubungkan komputer ke soket jaringan.',
    icon: Icons.cable,
  ),

  Term(
    name: 'Topologi Star',
    abbreviation: '',
    category: 'Topologi Jaringan',
    definition: 'Topologi jaringan dengan setiap perangkat terhubung ke satu perangkat pusat, biasanya switch atau hub.',
    explanation: 'Perangkat pusat meneruskan komunikasi antarperangkat. Susunan ini mudah ditambah dan gangguan pada satu kabel biasanya hanya memutus perangkat pada kabel tersebut. Namun, jika perangkat pusat rusak, komunikasi jaringan yang bergantung padanya dapat terganggu.',
    example: 'Di laboratorium komputer, setiap PC dapat dihubungkan dengan kabel tersendiri ke satu switch di rak jaringan.',
    icon: Icons.hub_outlined,
  ),

  Term(
    name: 'Topologi Bus',
    abbreviation: '',
    category: 'Topologi Jaringan',
    definition: 'Topologi jaringan yang menghubungkan beberapa perangkat pada satu jalur kabel utama.',
    explanation: 'Data dibagikan melalui kabel utama dan perangkat tujuan menerima data yang sesuai. Susunannya sederhana dan membutuhkan kabel utama yang relatif sedikit, tetapi kerusakan pada jalur utama dapat mengganggu banyak perangkat. Topologi ini lebih umum dipelajari sebagai konsep atau jaringan lama daripada dipakai pada LAN modern.',
    example: 'Diagram jaringan bus dapat menunjukkan beberapa komputer tersambung ke satu kabel utama dengan terminator di kedua ujungnya.',
    icon: Icons.linear_scale,
  ),

  Term(
    name: 'Topologi Ring',
    abbreviation: '',
    category: 'Topologi Jaringan',
    definition: 'Topologi jaringan yang menghubungkan perangkat dalam jalur melingkar, sehingga tiap perangkat memiliki hubungan dengan perangkat di sebelahnya.',
    explanation: 'Data diteruskan dari satu perangkat ke perangkat berikutnya mengitari ring sampai mencapai tujuan; pada teknologi yang dirancang untuk itu, alur ini dapat membuat giliran pengiriman lebih teratur. Kekurangannya, putusnya satu jalur dapat mengganggu ring biasa dan penelusuran gangguan bisa lebih sulit; sebagian rancangan memakai jalur cadangan.',
    example: 'Topologi ring dapat dipelajari melalui diagram beberapa komputer yang tersambung melingkar, atau pada jaringan industri tertentu yang dirancang dengan jalur redundan.',
    icon: Icons.autorenew,
  ),

  Term(
    name: 'Topologi Mesh',
    abbreviation: '',
    category: 'Topologi Jaringan',
    definition: 'Topologi jaringan yang menghubungkan perangkat melalui beberapa jalur; pada mesh penuh setiap pasangan perangkat memiliki hubungan langsung.',
    explanation: 'Banyak jalur dapat memberi pilihan rute lain jika salah satu hubungan terputus. Namun, mesh penuh membutuhkan banyak sambungan dan lebih rumit serta mahal untuk dipasang. Mesh parsial menghubungkan hanya sebagian pasangan perangkat.',
    example: 'Jaringan Wi-Fi mesh di rumah memakai beberapa node yang saling berkomunikasi untuk memperluas cakupan; susunannya tidak selalu mesh penuh.',
    icon: Icons.device_hub_outlined,
  ),

  Term(
    name: 'Topologi Tree',
    abbreviation: '',
    category: 'Topologi Jaringan',
    definition: 'Topologi jaringan bertingkat yang menyusun beberapa kelompok star di bawah jalur atau perangkat penghubung utama.',
    explanation: 'Perangkat cabang terhubung ke switch tingkat akses, lalu switch tersebut terhubung ke tingkat yang lebih tinggi. Susunan ini memudahkan jaringan diperluas dan dikelompokkan, tetapi gangguan pada jalur atau perangkat tingkat atas dapat memengaruhi cabang di bawahnya.',
    example: 'Jaringan sekolah dapat memakai switch utama yang terhubung ke switch di tiap lantai, lalu komputer di setiap ruang terhubung ke switch lantai.',
    icon: Icons.account_tree_outlined,
  ),

  Term(
    name: 'Tang Crimping',
    abbreviation: '',
    category: 'Alat Praktik Jaringan',
    definition: 'Alat tangan untuk memasang konektor modular, seperti konektor Ethernet 8P8C yang umum disebut RJ45, pada kabel jaringan yang sesuai.',
    explanation: 'Setelah jaket kabel dikupas dan kawat disusun menurut standar pengkabelan yang ditentukan, konektor dipasang ke kabel lalu ditekan dengan tang crimping. Gunakan tang dan konektor yang cocok dengan jenis serta ukuran kabel. Jauhkan jari dari bagian penjepit dan gunakan kabel latihan yang tidak tersambung ke perangkat aktif.',
    example: 'Siswa memasang konektor pada kabel UTP untuk membuat kabel jaringan, kemudian memeriksa susunan kawatnya dengan LAN tester.',
    icon: Icons.build_outlined,
  ),

  Term(
    name: 'LAN Tester',
    abbreviation: 'Local Area Network cable tester',
    category: 'Alat Praktik Jaringan',
    definition: 'Alat untuk memeriksa sambungan dan urutan kawat pada kabel jaringan, seperti kabel Ethernet twisted pair.',
    explanation: 'Tester mengirimkan sinyal uji dari satu ujung kabel dan menunjukkan hasil yang diterima pada ujung lainnya. Model sederhana dapat membantu menemukan kawat putus, hubungan singkat, atau urutan yang salah, tetapi tidak membuktikan bahwa koneksi internet atau seluruh kinerja jaringan sudah baik. Lepaskan kabel dari switch, komputer, dan perangkat bertegangan sebelum menguji, kecuali alat dan prosedur memang dirancang untuk pengujian tersebut.',
    example: 'Setelah membuat kabel patch UTP, siswa menyambungkan kedua ujungnya ke LAN tester untuk memastikan tiap kawat terhubung dengan urutan yang sesuai.',
    icon: Icons.cable_outlined,
  ),

  Term(
    name: 'Punch-down Tool',
    abbreviation: 'Insulation Displacement Contact (IDC) tool',
    category: 'Alat Praktik Jaringan',
    definition: 'Alat untuk menekan kawat jaringan ke terminal IDC pada keystone jack atau patch panel.',
    explanation: 'Mata alat menekan kawat ke celah terminal IDC sehingga kontak listrik terbentuk; mata potong pada beberapa alat juga memotong sisa kawat. Ikuti diagram T568A atau T568B yang dipakai pada kedua ujung instalasi, pilih mata alat yang sesuai, dan arahkan sisi pemotong dengan benar. Pegang alat pada gagangnya karena ujungnya tajam.',
    example: 'Siswa memasang kabel permanen pada keystone jack di faceplate atau pada port patch panel menggunakan punch-down tool.',
    icon: Icons.hardware_outlined,
  ),

  Term(
    name: 'Pengupas Kabel',
    abbreviation: 'Cable stripper',
    category: 'Alat Praktik Jaringan',
    definition: 'Alat untuk mengupas sebagian jaket luar kabel agar bagian dalam dapat disiapkan tanpa merusak kawat atau seratnya.',
    explanation: 'Atur atau pilih ukuran pengupas sesuai jenis kabel, lalu kupas jaket secukupnya dengan tekanan ringan. Jangan menarik pisau ke arah tubuh atau tangan, dan periksa agar isolasi konduktor di dalam tidak ikut tergores. Gunakan alat pengupas yang sesuai untuk kabel tembaga atau kabel fiber; alat untuk kabel tembaga tidak otomatis aman untuk serat optik.',
    example: 'Saat menyiapkan kabel UTP untuk konektor, siswa mengupas sedikit jaket luarnya agar pasangan kawat dapat disusun.',
    icon: Icons.content_cut_outlined,
  ),

  Term(
    name: 'Pengikat Kabel',
    abbreviation: 'Cable tie',
    category: 'Alat Praktik Jaringan',
    definition:
        'Pengikat untuk menyatukan dan merapikan kabel agar jalurnya tertata.',
    explanation: 'Masukkan ujung pengikat ke penguncinya dan kencangkan secukupnya. Ikatan yang terlalu kuat dapat menekan kabel dan mengganggu lapisan atau kinerjanya. Kelompokkan kabel tanpa menutup ventilasi perangkat, menjaga jalur keluar-masuk, dan gunakan pemotong yang tepat agar sisi potongan tidak tajam.',
    example: 'Siswa mengikat beberapa kabel jaringan di rak praktik agar jalurnya rapi, mudah ditelusuri, dan tidak menghalangi ventilasi switch.',
    icon: Icons.link,
  ),

  // ----------------------------------------------------------
  // ALAMAT JARINGAN
  // ----------------------------------------------------------
  Term(
    name: 'IP Address',
    abbreviation: 'Internet Protocol Address',
    category: 'Alamat Jaringan',
    definition: 'Alamat logis yang diberikan pada antarmuka perangkat agar data dapat dikirim dari sumber ke tujuan melalui jaringan IP.',
    explanation: 'IP Address membantu perangkat dan router mengetahui asal data dan jaringan tujuannya. Alamat ini dapat diberikan otomatis oleh DHCP atau diatur manual. Alamat IP dapat berubah, dan tidak sama dengan MAC Address.',
    example: 'Saat ponsel membuka situs, paket data memakai alamat IP ponsel sebagai sumber dan alamat IP layanan sebagai tujuan.',
    icon: Icons.location_on,
    relatedTermNames: ['IPv4', 'Subnet Mask', 'Default Gateway', 'MAC Address'],
    studyTip: 'IP mengidentifikasi antarmuka pada jaringan; MAC dipakai untuk pengiriman lokal. Keduanya punya fungsi berbeda.',
  ),

  Term(
    name: 'IPv4',
    abbreviation: 'Internet Protocol version 4',
    category: 'Alamat Jaringan',
    definition: 'Versi IP dengan alamat sepanjang 32 bit yang ditulis sebagai empat angka desimal dipisahkan titik.',
    explanation: 'IPv4 memberi alamat sumber dan tujuan pada paket. Setiap angka pada penulisannya mewakili 8 bit; alamat dan subnet mask membantu perangkat menentukan apakah tujuan berada di jaringan lokal.',
    example: 'Laptop dapat menerima IPv4 lokal 192.168.1.10 dari router rumah melalui DHCP.',
    icon: Icons.pin_outlined,
    relatedTermNames: ['IP Address', 'IPv6', 'Subnet Mask'],
  ),

  Term(
    name: 'IPv6',
    abbreviation: 'Internet Protocol version 6',
    category: 'Alamat Jaringan',
    definition: 'Versi IP dengan alamat sepanjang 128 bit, yang menyediakan ruang alamat jauh lebih besar daripada IPv4.',
    explanation: 'Alamat IPv6 ditulis dalam kelompok angka heksadesimal yang dipisahkan tanda titik dua. Perangkat yang mendukung IPv6 dapat memakai alamat ini untuk mengirim paket melalui jaringan IPv6.',
    example: 'Jika jaringan rumah dan situs mendukung IPv6, ponsel dapat memakai alamat IPv6 saat mengakses situs tersebut.',
    icon: Icons.language,
  ),

  Term(
    name: 'MAC Address',
    abbreviation: 'Media Access Control Address',
    category: 'Alamat Jaringan',
    definition: 'Alamat pada antarmuka Ethernet atau Wi-Fi yang digunakan untuk pengiriman data pada jaringan lokal.',
    explanation: 'Switch menggunakan alamat MAC tujuan untuk meneruskan bingkai ke perangkat yang sesuai pada LAN. MAC Address berbeda dari IP Address dan pada beberapa perangkat dapat diubah atau diacak oleh sistem operasi.',
    example: 'Saat komputer mengirim data ke printer yang berada di LAN yang sama, alamat MAC printer digunakan untuk mengantarkan bingkai lokal tersebut.',
    icon: Icons.fingerprint,
    relatedTermNames: ['IP Address', 'Switch', 'NIC'],
  ),

  Term(
    name: 'Subnet Mask',
    abbreviation: '',
    category: 'Alamat Jaringan',
    definition: 'Nilai yang menunjukkan bagian network dan bagian host pada alamat IPv4.',
    explanation: 'Perangkat memakai IP Address bersama subnet mask untuk memeriksa apakah tujuan berada pada subnet yang sama. Jika tidak, paket dikirim ke default gateway.',
    example: 'Dengan IP 192.168.1.10 dan subnet mask 255.255.255.0, komputer dapat mengenali 192.168.1.20 sebagai alamat dalam subnet lokal yang sama.',
    icon: Icons.grid_3x3,
    relatedTermNames: ['IPv4', 'Network Address', 'Broadcast Address', 'Default Gateway'],
    studyTip: 'Gunakan IP dan subnet mask bersama-sama untuk menentukan apakah alamat tujuan berada di subnet yang sama.',
  ),

  Term(
    name: 'Default Gateway',
    abbreviation: '',
    category: 'Alamat Jaringan',
    definition: 'Alamat router atau perangkat jaringan yang menjadi jalur keluar perangkat dari subnet lokal menuju jaringan lain.',
    explanation: 'Perangkat mengirim paket ke default gateway ketika alamat tujuan tidak berada di subnet lokal. Gateway kemudian meneruskan paket sesuai rute yang tersedia. Istilah “gateway” pada pengaturan dasar perangkat sering merujuk pada default gateway.',
    example: 'Pada Wi-Fi rumah, ponsel memakai alamat IP router sebagai default gateway untuk mencapai situs di internet.',
    icon: Icons.exit_to_app,
    relatedTermNames: ['Router', 'IP Address', 'Subnet Mask'],
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
    definition: 'Protokol yang membagikan pengaturan jaringan secara otomatis kepada perangkat, seperti IP Address, subnet mask, dan default gateway.',
    explanation: 'Saat bergabung ke jaringan, perangkat meminta konfigurasi kepada server DHCP. Server memberikan konfigurasi untuk masa sewa tertentu agar alamat dapat dikelola dan digunakan tanpa mengatur setiap perangkat secara manual.',
    example: 'Ketika laptop siswa tersambung ke Wi-Fi sekolah, DHCP dapat memberikan IP Address dan gateway secara otomatis.',
    icon: Icons.settings_ethernet,
    relatedTermNames: ['IP Address', 'Subnet Mask', 'Default Gateway'],
    studyTip: 'Ingat DHCP sebagai pemberi konfigurasi otomatis: alamat IP, subnet mask, dan gateway biasanya didapat dalam satu proses.',
  ),

  Term(
    name: 'DNS',
    abbreviation: 'Domain Name System',
    category: 'Layanan Jaringan',
    definition: 'Sistem yang membantu menemukan informasi jaringan, termasuk alamat IP, berdasarkan nama domain.',
    explanation: 'Perangkat meminta resolver DNS mencari alamat IP untuk nama domain. Setelah memperoleh jawaban, perangkat dapat mencoba menghubungi server tujuan. DNS membantu pengguna memakai nama yang mudah diingat.',
    example: 'Saat mengetik nama situs di browser, DNS membantu mencari alamat IP yang perlu dihubungi browser.',
    icon: Icons.dns_outlined,
    relatedTermNames: ['IP Address', 'Web Server', 'HTTP'],
    studyTip: 'DNS mencari alamat berdasarkan nama domain; setelah alamat ditemukan, browser tetap perlu menghubungi server web.',
  ),

  Term(
    name: 'TCP',
    abbreviation: 'Transmission Control Protocol',
    category: 'Layanan Jaringan',
    definition: 'Protokol transport yang mengirim data antar aplikasi dengan membangun koneksi dan mengatur agar data diterima berurutan.',
    explanation: 'TCP memeriksa data yang diterima dan dapat mengirim ulang bagian yang hilang. Karena itu TCP cocok untuk komunikasi yang membutuhkan data lengkap dan berurutan, meskipun pengaturan ini menambah proses komunikasi.',
    example: 'Unduhan berkas melalui jaringan umumnya memakai TCP agar bagian-bagian berkas dapat diterima dan disusun dengan benar.',
    icon: Icons.compare_arrows,
    relatedTermNames: ['UDP', 'HTTP', 'HTTPS'],
    studyTip: 'Bandingkan kebutuhan aplikasi: TCP mengutamakan data lengkap dan berurutan, sedangkan UDP mengurangi proses pengiriman.',
  ),

  Term(
    name: 'UDP',
    abbreviation: 'User Datagram Protocol',
    category: 'Layanan Jaringan',
    definition: 'Protokol transport yang mengirim datagram tanpa membangun koneksi dan tanpa menjamin setiap datagram sampai atau tiba berurutan.',
    explanation: 'UDP memiliki proses pengiriman yang sederhana dan tidak menunggu konfirmasi penerimaan dari penerima. Aplikasi dapat memilih UDP ketika pengiriman cepat atau jeda kecil lebih penting, lalu menangani kehilangan data bila diperlukan.',
    example: 'Sebagian aplikasi panggilan suara atau video langsung dapat menggunakan UDP agar percakapan tidak terlalu tertunda; aplikasi biasanya mengelola dampak paket yang hilang.',
    icon: Icons.flash_on_outlined,
    relatedTermNames: ['TCP', 'Latency', 'Packet Loss'],
  ),

  Term(
    name: 'HTTP',
    abbreviation: 'Hypertext Transfer Protocol',
    category: 'Layanan Jaringan',
    definition: 'Protokol untuk mengatur pertukaran permintaan dan balasan antara aplikasi client dan layanan web.',
    explanation: 'Browser mengirim permintaan, misalnya meminta halaman, lalu server mengirimkan balasan. HTTP biasa tidak mengenkripsi data, sehingga informasi sensitif lebih baik dikirim melalui HTTPS.',
    example: 'Browser meminta halaman informasi dari web server menggunakan HTTP saat membuka layanan yang tidak memakai HTTPS.',
    icon: Icons.http,
    relatedTermNames: ['HTTPS', 'DNS', 'Web Server'],
  ),

  Term(
    name: 'HTTPS',
    abbreviation: 'Hypertext Transfer Protocol Secure',
    category: 'Layanan Jaringan',
    definition: 'HTTP yang menggunakan TLS untuk mengenkripsi komunikasi dan membantu memeriksa identitas server.',
    explanation: 'Browser memeriksa sertifikat server lalu membuat koneksi TLS sebelum bertukar data. HTTPS melindungi data selama perjalanan, tetapi tidak menjamin bahwa semua isi situs pasti benar atau aman.',
    example: 'Saat siswa masuk ke portal sekolah melalui HTTPS, kata sandi dienkripsi ketika dikirim antara browser dan server.',
    icon: Icons.lock_outline,
    relatedTermNames: ['HTTP', 'Enkripsi', 'Web Server'],
    studyTip: 'HTTPS melindungi komunikasi dengan TLS; tetap periksa alamat situs karena enkripsi tidak menjamin isi situs dapat dipercaya.',
  ),

  Term(
    name: 'FTP',
    abbreviation: 'File Transfer Protocol',
    category: 'Layanan Jaringan',
    definition: 'Protokol untuk mengirim atau mengambil file antara client dan server melalui jaringan.',
    explanation: 'Client masuk ke server dengan izin yang diberikan, lalu dapat mengunggah atau mengunduh file. FTP biasa tidak mengenkripsi kata sandi dan data, sehingga untuk data sensitif gunakan pilihan transfer aman yang disediakan administrator.',
    example: 'Dalam praktik, siswa mengunggah file tugas ke server FTP laboratorium menggunakan akun yang diberikan guru.',
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
    definition: 'Teknologi yang membuat koneksi virtual melalui jaringan lain, sering digunakan untuk mengakses jaringan pribadi dari lokasi berbeda.',
    explanation: 'Perangkat terhubung ke server VPN dan membuat jalur komunikasi virtual. Perlindungan enkripsi bergantung pada protokol serta konfigurasi VPN; VPN tidak otomatis menjamin semua situs atau aktivitas aman.',
    example: 'Guru dapat memakai VPN resmi sekolah untuk mengakses berkas pada jaringan internal saat bekerja dari rumah.',
    icon: Icons.shield_outlined,
  ),

  Term(
    name: 'Ping',
    abbreviation: '',
    category: 'Pemecahan Masalah Jaringan',
    definition: 'Perintah diagnostik yang mengirim permintaan ICMP Echo untuk memeriksa apakah alamat tujuan dapat dijangkau melalui jaringan.',
    explanation: 'Jika menerima balasan, ping biasanya menampilkan waktu bolak-balik (round-trip time) dan jumlah paket yang dibalas. Ping berguna untuk pemeriksaan awal, tetapi balasan yang gagal belum tentu berarti perangkat mati karena ICMP dapat dibatasi; balasan yang berhasil juga tidak memastikan semua layanan pada perangkat itu berfungsi.',
    example: 'Siswa dapat menjalankan ping ke alamat gateway sekolah untuk memeriksa apakah komputer mendapat balasan dari router lokal.',
    icon: Icons.network_ping,
    relatedTermNames: ['Default Gateway', 'Packet Loss', 'Latency'],
    studyTip: 'Gunakan ping sebagai pemeriksaan awal, lalu uji layanan yang dibutuhkan karena balasan ping saja tidak membuktikan semua layanan aktif.',
  ),

  Term(
    name: 'Packet Loss',
    abbreviation: '',
    category: 'Pemecahan Masalah Jaringan',
    definition: 'Kondisi ketika sebagian paket data yang dikirim tidak sampai ke tujuan atau tidak diterima kembali.',
    explanation: 'Packet loss dapat terlihat sebagai paket yang tidak mendapat balasan saat pengujian atau sebagai suara/video tersendat dan koneksi yang tidak stabil. Penyebabnya dapat beragam, misalnya gangguan sinyal, kabel atau port bermasalah, perangkat yang kelebihan beban, maupun kemacetan jaringan; pengukuran saja belum menentukan penyebabnya.',
    example: 'Jika dari 20 permintaan ping hanya 18 yang mendapat balasan, terdapat 2 permintaan yang tidak mendapat balasan selama pengujian itu; periksa jalur dan ulangi tes sebelum menyimpulkan penyebabnya.',
    icon: Icons.signal_wifi_statusbar_connected_no_internet_4,
    relatedTermNames: ['Ping', 'Latency', 'Kepadatan Lalu Lintas Jaringan'],
  ),

  Term(
    name: 'Latency',
    abbreviation: '',
    category: 'Kinerja Jaringan',
    definition: 'Waktu tunda yang diperlukan data untuk bergerak antara dua titik jaringan.',
    explanation: 'Latency dipengaruhi oleh jarak, jalur, pemrosesan perangkat, dan antrean pada jaringan. Hasil ping umumnya menunjukkan waktu pergi-pulang (RTT), bukan waktu satu arah. Latency tinggi dapat terasa sebagai jeda saat membuka layanan interaktif meskipun koneksi tetap tersambung.',
    example: 'Saat bermain gim melalui internet, latency yang tinggi dapat membuat aksi pemain tampil terlambat dibandingkan saat tombol ditekan.',
    icon: Icons.timer_outlined,
    relatedTermNames: ['Ping', 'Bandwidth', 'Packet Loss'],
    studyTip: 'Latency adalah waktu tunda, bukan kapasitas jalur. Ping biasanya menampilkan waktu pergi-pulang (RTT).',
  ),

  Term(
    name: 'Firewall',
    abbreviation: '',
    category: 'Keamanan Jaringan',
    definition: 'Sistem keamanan yang mengizinkan atau membatasi lalu lintas jaringan berdasarkan aturan yang ditetapkan.',
    explanation: 'Firewall dapat berupa fitur perangkat lunak atau perangkat khusus. Firewall memeriksa informasi lalu lintas, seperti alamat dan port, lalu menerapkan aturan. Firewall membantu mengurangi akses yang tidak diinginkan, tetapi bukan pengganti pembaruan sistem, kata sandi kuat, atau perlindungan lainnya.',
    example: 'Firewall komputer sekolah dapat diatur agar hanya aplikasi dan koneksi yang diizinkan administrator yang dapat berkomunikasi melalui jaringan.',
    icon: Icons.security,
  ),

  Term(
    name: 'Enkripsi',
    abbreviation: '',
    category: 'Keamanan Jaringan',
    definition: 'Proses mengubah data yang dapat dibaca menjadi bentuk tersandi agar isinya tidak mudah dipahami tanpa kunci yang sesuai.',
    explanation: 'Pengirim mengenkripsi data dengan metode dan kunci tertentu, lalu penerima yang berwenang menggunakan kunci yang sesuai untuk mengembalikannya. Enkripsi membantu melindungi kerahasiaan data saat disimpan atau dikirim, tetapi tidak otomatis melindungi perangkat yang sudah dibobol atau membuktikan bahwa isi data benar.',
    example: 'Saat siswa membuka situs sekolah dengan HTTPS, enkripsi TLS membantu melindungi data yang dikirim antara browser dan server dari pembacaan mudah oleh pihak lain di jalur jaringan.',
    icon: Icons.lock_outline,
  ),

  Term(
    name: 'Bandwidth',
    abbreviation: '',
    category: 'Kinerja Jaringan',
    definition: 'Kapasitas maksimum suatu jalur jaringan untuk membawa data dalam satu waktu, biasanya dinyatakan dalam bit per detik.',
    explanation: 'Bandwidth menggambarkan kapasitas jalur, bukan jaminan kecepatan yang selalu diterima satu pengguna. Kecepatan aktual juga dipengaruhi kualitas koneksi, perangkat, layanan tujuan, dan banyaknya pengguna yang berbagi jalur.',
    example: 'Jika koneksi internet sekolah digunakan banyak kelas untuk mengunduh video bersamaan, kapasitas bandwidth dibagi di antara lalu lintas yang aktif.',
    icon: Icons.speed,
    relatedTermNames: ['Latency', 'Kepadatan Lalu Lintas Jaringan', 'Packet Loss'],
    studyTip: 'Bandwidth adalah kapasitas maksimum jalur, bukan kecepatan yang selalu diterima satu pengguna.',
  ),

  Term(
    name: 'Kepadatan Lalu Lintas Jaringan',
    abbreviation: 'Network congestion',
    category: 'Kinerja Jaringan',
    definition: 'Kondisi ketika jumlah data yang melewati suatu bagian jaringan mendekati atau melebihi kapasitas yang tersedia.',
    explanation: 'Saat jalur atau perangkat jaringan menerima lebih banyak data daripada yang dapat diteruskan, data dapat mengantre. Antrean yang panjang dapat menambah latency; jika antrean penuh, sebagian paket dapat dibuang dan terjadi packet loss. Kondisi ini berbeda dari gangguan pada satu perangkat atau kabel.',
    example: 'Ketika banyak siswa mengakses video daring pada jam yang sama, jaringan sekolah dapat terasa lambat karena lalu lintas menumpuk pada jalur internet bersama.',
    icon: Icons.traffic_outlined,
    relatedTermNames: ['Bandwidth', 'Latency', 'Packet Loss'],
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
  'Kabel UTP': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c7/Coiled-up_Ethernet_cable.jpg/960px-Coiled-up_Ethernet_cable.jpg',
    attribution: 'Coiled-up Ethernet cable — Jakub T. Jankiewicz, CC BY-SA 4.0',
  ),
  'Kabel STP': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f1/Twisted_pair_sftp.svg/960px-Twisted_pair_sftp.svg.png',
    attribution: 'Twisted pair S/FTP — cmglee, CC BY-SA 4.0',
  ),
  'Fiber Optik': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f5/Optical_fiber_cable-01ASD.jpg/960px-Optical_fiber_cable-01ASD.jpg',
    attribution: 'Optical fiber cable — Asurnipal, CC BY-SA 4.0',
  ),
  'Kabel Koaksial': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/54/Coaxial_cable_cutaway-es.svg/960px-Coaxial_cable_cutaway-es.svg.png',
    attribution: 'Coaxial cable cutaway — Tkgd2007 and Begoon, CC BY 4.0',
  ),
  'Konektor RJ45': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/4d/Assemblaggio_cavo_RJ45_passo_3.jpg/960px-Assemblaggio_cavo_RJ45_passo_3.jpg',
    attribution: 'Assemblaggio cavo RJ45 — Giacomo Alessandroni, CC BY-SA 4.0',
  ),
  'Patch Cord': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/78/Patch_cable_with_RJ45_connector.jpg/960px-Patch_cable_with_RJ45_connector.jpg',
    attribution:
        'Patch cable with RJ45 connector — heimnetzwerke.net, CC BY 4.0',
  ),
  'Topologi Star': _TermPhoto(
    url: 'https://upload.wikimedia.org/wikipedia/commons/3/35/Extended-star-topology.png',
    attribution: 'Extended star topology — Costello, public domain',
  ),
  'Topologi Bus': _TermPhoto(
    url: 'https://upload.wikimedia.org/wikipedia/commons/1/11/Bus_Network_Topology.png',
    attribution: 'Bus Network Topology — Bakshi41c, CC BY-SA 3.0',
  ),
  'Topologi Ring': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9d/SERCOS_III_Control_Interface_Ring_Topology_diagram.svg/960px-SERCOS_III_Control_Interface_Ring_Topology_diagram.svg.png',
    attribution: 'SERCOS III Ring Topology — SCH56, public domain',
  ),
  'Topologi Mesh': _TermPhoto(
    url:
        'https://upload.wikimedia.org/wikipedia/commons/c/ce/Mesh-topology.png',
    attribution: 'Mesh topology — Prinsen, public domain',
  ),
  'Topologi Tree': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1f/Intercpunettree.svg/960px-Intercpunettree.svg.png',
    attribution: 'Intercpunettree — KCVelaga, CC BY-SA 4.0',
  ),
  'Tang Crimping': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/3/3e/Crimping-pliers-pro-RJ-0a.jpg/960px-Crimping-pliers-pro-RJ-0a.jpg',
    attribution: 'Crimping pliers pro RJ — Adamantios, CC BY-SA 3.0',
  ),
  'LAN Tester': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/5/54/Teste_cabo.jpg/960px-Teste_cabo.jpg',
    attribution: 'Teste cabo — Mvdiogo, CC BY-SA 4.0',
  ),
  'Punch-down Tool': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/9a/Ideal_punchdown_tool.jpg/960px-Ideal_punchdown_tool.jpg',
    attribution: 'Ideal punchdown tool — J.C. Fields, CC BY-SA 3.0',
  ),
  'Pengupas Kabel': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/18/Cable_stripper%2C_cable_tester_%28RJ45%2C_RJ11%29%2C_LSA-Tool_and_crimping_tool.jpg/960px-Cable_stripper%2C_cable_tester_%28RJ45%2C_RJ11%29%2C_LSA-Tool_and_crimping_tool.jpg',
    attribution: 'Cable stripper, cable tester and LSA tool — heimnetzwerke.net, CC BY 4.0',
  ),
  'Pengikat Kabel': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/e/ed/100x_Nylon_Cable_Zip_10cm_Tie_Wraps_%282USD_on_eBay%29_%288924977735%29.jpg/960px-100x_Nylon_Cable_Zip_10cm_Tie_Wraps_%282USD_on_eBay%29_%288924977735%29.jpg',
    attribution: 'Nylon cable zip ties — Artem M., CC BY-SA 2.0',
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
  'TCP': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/2/2d/Internetworking_with_Internet_Protocol_%28IP%29_and_Transmission_Control_Protocol_%28TCP%29_within_the_Military_%28IA_internetworkingw1094543854%29.pdf/page1-960px-Internetworking_with_Internet_Protocol_%28IP%29_and_Transmission_Control_Protocol_%28TCP%29_within_the_Military_%28IA_internetworkingw1094543854%29.pdf.jpg',
    attribution:
        'Internetworking with IP and TCP — Bruce R. Eikenberg, public domain',
  ),
  'UDP': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/16/UDP_IP_Ethernet.jpg/960px-UDP_IP_Ethernet.jpg',
    attribution: 'UDP IP Ethernet — Arkrishna, public domain',
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
  'Ping': _TermPhoto(
    url: 'https://upload.wikimedia.org/wikipedia/commons/e/e2/Ping_iputils_screenshot.png',
    attribution:
        'Ping iputils screenshot — YOSHIFUJI Hideaki / USAGI-WIDE Project, GPL',
  ),
  'Packet Loss': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6f/Army_Packet_Radio_Network_Protocol_Study_-_SRI%2C_November_1977.pdf/page1-500px-Army_Packet_Radio_Network_Protocol_Study_-_SRI%2C_November_1977.pdf.jpg',
    attribution:
        'Army Packet Radio Network Protocol Study — SRI, public domain',
  ),
  'Latency': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/6d/IPv6_geolocation_using_latency_constraints_%28IA_ipvgeolocationus1094541452%29.pdf/page1-960px-IPv6_geolocation_using_latency_constraints_%28IA_ipvgeolocationus1094541452%29.pdf.jpg',
    attribution: 'IPv6 geolocation using latency constraints — Tony V.H. Tran, public domain',
  ),
  'Firewall': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/60/DMZ_network_diagram_2_firewall.svg/960px-DMZ_network_diagram_2_firewall.svg.png',
    attribution: 'DMZ network diagram 2 firewall — Pbroks13, public domain',
  ),
  'Enkripsi': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/9/90/CCMP_Encryption_Working_Block_Diagram.pdf/page1-960px-CCMP_Encryption_Working_Block_Diagram.pdf.jpg',
    attribution:
        'CCMP Encryption Working Block Diagram — Cipher swami, CC BY-SA 4.0',
  ),
  'Bandwidth': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b3/Bandwidth_Management_in_Resource_Constrained_Networks_%28IA_bandwidthmanagem109456866%29.pdf/page1-960px-Bandwidth_Management_in_Resource_Constrained_Networks_%28IA_bandwidthmanagem109456866%29.pdf.jpg',
    attribution:
        'Bandwidth Management in Resource Constrained Networks, public domain',
  ),
  'Kepadatan Lalu Lintas Jaringan': _TermPhoto(
    url: 'https://thumb.wikimedia.org/wikipedia/commons/thumb/6/69/Traffic_congestion_analysis_for_a_software-defined_network_%28IA_trafficcongestio1094558337%29.pdf/page1-960px-Traffic_congestion_analysis_for_a_software-defined_network_%28IA_trafficcongestio1094558337%29.pdf.jpg',
    attribution: 'Traffic congestion analysis for a software-defined network — Moniqua J. Maxie, public domain',
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
                                    favorites: favorites,
                                    onFavoriteByName: onFavorite,
                                    onStudied: onStudied,
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
                        favorites: favorites,
                        onFavoriteByName: onFavorite,
                        onStudied: onStudied,
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
  final Set<String> favorites;
  final ValueChanged<String>? onFavoriteByName;
  final ValueChanged<String>? onStudied;

  const TermDetailPage({
    super.key,
    required this.term,
    required this.isFavorite,
    required this.onFavorite,
    this.favorites = const {},
    this.onFavoriteByName,
    this.onStudied,
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
    final onFavoriteByName = widget.onFavoriteByName;
    if (onFavoriteByName == null) {
      widget.onFavorite();
    } else {
      onFavoriteByName(widget.term.name);
    }
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
    final relatedTerms = terms
        .where((term) => widget.term.relatedTermNames.contains(term.name))
        .toList();

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

          if (relatedTerms.isNotEmpty) ...[
            const SizedBox(height: 15),
            _DetailSection(
              icon: Icons.device_hub_outlined,
              title: 'Istilah Terkait',
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: relatedTerms.map((relatedTerm) {
                  return ActionChip(
                    avatar: const Icon(Icons.menu_book_outlined, size: 17),
                    label: Text(relatedTerm.name),
                    onPressed: () {
                      widget.onStudied?.call(relatedTerm.name);
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => TermDetailPage(
                            term: relatedTerm,
                            isFavorite: widget.favorites.contains(
                              relatedTerm.name,
                            ),
                            onFavorite: () {},
                            favorites: widget.favorites,
                            onFavoriteByName: widget.onFavoriteByName,
                            onStudied: widget.onStudied,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              onIconTap: () => _showDetailPopup(
                context,
                'Istilah Terkait',
                relatedTerms.map((term) => term.name).join(', '),
              ),
            ),
          ],

          if (widget.term.studyTip.isNotEmpty) ...[
            const SizedBox(height: 15),
            _DetailSection(
              icon: Icons.tips_and_updates_outlined,
              title: 'Tips Belajar',
              child: Text(
                widget.term.studyTip,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Color(0xFF46516A),
                ),
              ),
              onIconTap: () => _showDetailPopup(
                context,
                'Tips Belajar',
                widget.term.studyTip,
              ),
            ),
          ],

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
                                  favorites: widget.favorites,
                                  onFavoriteByName: widget.onFavorite,
                                  onStudied: widget.onStudied,
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
                                  favorites: favoriteTerms
                                      .map((favoriteTerm) => favoriteTerm.name)
                                      .toSet(),
                                  onFavoriteByName: onFavorite,
                                  onStudied: onStudied,
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
