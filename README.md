# TurSirketiVeriTabani-
Tur Şirketi veritabanınızı oluşturma.  Excel dosyasındaki verileri kayıt etme.


# Tur Şİrketinin Özellikleri

İstanbul’un çeşitli yerlerini turistlere rehberler eşliğinde gezdiren ve tanıtan bir tur şirketimiz var. Turlar günlük turlar ve bir günde sadece bir bölge ziyaret edilebiliyor.

# Rehberler:

- Rehberlerimiz en az bir dil biliyor. (Kadın veya erkek olabiliyor.)

- Rehberler gezdirecekleri tüm yerler hakkında bilgi sahibi.

- Rehberlerin Ad, Soyad, iletişim bilgileri sistemde mevcut.

# Turistler:

- Kayıt açılırken Ad, Soyad, Türkiye’ye geliş tarihleri, cinsiyet, ülke, uyruk bilgileri gibi bilgileri alınıyor.

- Kayıt günü rehber atamaları yapılıyor ve alacağı turların faturası kesiliyor.

# Gezilecek yerler:

- Her biri için farklı ücret mevcut. (Ulaşım, Müze girişi vs. sebebiyle)

- Dolar ve Euro cinsinden de ücretleri görebilmeliyim.

- 10 yaş altı çocuklar için yarım, 60 yaş üstü için indirimli, diğerleri için tam ücret kesilecek.

# Ülke-Uyruk-Dil:

- Ülke ve Diller tanımlanırken primary key olarak dil ve ülke kodları kullanılacak. (TR, UK gibi.)

# Ödeme:

- Bir faturada birkaç tur olabiliyor.

- Bir tura birden fazla kişi için bilet alınabiliyor. (Ödeme kredi kartı veya nakit olabiliyor)

# Kısıtlar:

- Boş geçilmemesi gereken alanlara NOT NULL constraint verilmeli.

- Rehberlerde Adres kolonunda değer girilmemişse Bilinmiyor yazsın.

# Yapılması İstenilen SQL Sorguları

--1-Rehberlerimin bu zamana kadar ilgilendikleri tüm turistleri ülke ve uyruk bilgileri ile getiriniz.

--2-Her bir tur için indirimli, tam, yarım fiyatını listeleyen sorguyu yazın. Zam veya indirim uygulanmış turların da geçmişe yönelik tüm fiyat bilgisi gelsin.
--Rapor şu şekilde olmalı;
--Ayasofya | Tam | 120 | 2015-05-05
--Ayasofya | Yarım | 60 | 2015-05-05   ....vb

--3-şu zamana kadar yapılan en pahalı tura hangi turistim dahil olmuş, bu turun ödemesini kim yapmış ve bu turiste hangi tur rehberi atanmış? Aynı fiyat bilgisine sahip diğer kayıtlar da gelsin.

--4-Almanya uyruklu turistlerimden tam bilet ile tura katılan turistlerim nereleri hangi tur rehberi ile ziyaret etmiş.

--5-ıngilizce bildiği halde ülkesi de uyruğu da ıngiltere olmayan turistlere rehberlik eden tur rehberlerim kimler? ılgilendiği turist bilgileri ile beraber raporlansın.

--6-Listemde olduğu halde rehberlerimin bildiği diller arasında yer almayan diller hangileridir?

--7-Ülkesi Japonya olan müşterilerim fatura ödemelerini hangi para biriminde yapmışlar. (Turist Ad, Soyad, Ülke, FaturaTarihi, Ödemeşekli, ParaBirimi)

--8-Nakit ödeme yapmamayı tercih eden müşterilerim hangi ülkelerden (Sorguyu diğer ödeme şekil(ler)ini bilmiyormuş gibi yazınız)
