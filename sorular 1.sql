--1-Rehberlerimin bu zamana kadar ilgilendikleri tüm turistleri ülke ve uyruk bilgileri ile getiriniz.
	
	select r.AdSoyad as Rehber,t.AdSoyad as Turist,t.Uyruk from Rehberler r 
	inner join Turitler_Rehberler_GidilecekYerler tr on r.RehberID=tr.RehberID
	inner join Turistler t on t.TuristID=tr.TuristID

--2-Her bir tur için indirimli, tam, yarým fiyatýný listeleyen sorguyu yazýn. Zam veya indirim uygulanmýþ turlarýn da geçmiþe yönelik tüm fiyat bilgisi gelsin.
--Rapor þu þekilde olmalý;
--Ayasofya | Tam | 120 | 2015-05-05
--Ayasofya | Yarým | 60 | 2015-05-05   ....vb

	select GidelecekYerAdi,BiletTürü,Fiyat,FaturaTarihi from FaturaDetay fd inner join GidilecekYerler g on g.GidilecekYerID=fd.GidilecekYerID

--3-þu zamana kadar yapýlan en pahalý tura hangi turistim dahil olmuþ, bu turun ödemesini kim yapmýþ ve bu turiste hangi tur rehberi atanmýþ? Ayný fiyat bilgisine sahip diðer kayýtlar da gelsin.
	
SELECT TOP 1
    t.AdSoyad AS TuristAdSoyad,
    f.OdemeSekli AS OdemeSekli,
    r.AdSoyad AS RehberAdSoyad
FROM
    Turistler t
INNER JOIN
    Turitler_Rehberler_GidilecekYerler trg ON t.TuristID = trg.TuristID
INNER JOIN
    Rehberler r ON trg.RehberID = r.RehberID
INNER JOIN
    Faturalar fa ON t.TuristID = fa.TuristID
INNER JOIN
    FaturaDetay fd ON fa.FaturaID = fd.FaturaID
INNER JOIN
    GidilecekYerler gy ON fd.GidilecekYerID = gy.GidilecekYerID
INNER JOIN
    Odeme f ON t.TuristID = f.TuristID
WHERE
    fd.Fiyat = (SELECT MAX(Fiyat)FROM FaturaDetay)
         
--4-Almanya uyruklu turistlerimden tam bilet ile tura katýlan turistlerim nereleri hangi tur rehberi ile ziyaret etmiþ.

	select t.AdSoyad as Turist,gy.GidelecekYerAdi as GidilecekYer,r.AdSoyad as Rehber from Turistler t 
	inner join Faturalar f on f.TuristID=t.TuristID
	inner join FaturaDetay fd on f.FaturaID=fd.FaturaID
	inner join Turitler_Rehberler_GidilecekYerler tr on t.TuristID=tr.TuristID
	inner join GidilecekYerler gy on gy.GidilecekYerID=tr.GidilecekYerID
	inner join Rehberler r on r.RehberID=tr.RehberID
	where t.Uyruk='Dutch' and BiletTürü='Tam'

--5-ýngilizce bildiði halde ülkesi de uyruðu da ýngiltere olmayan turistlere rehberlik eden tur rehberlerim kimler? ýlgilendiði turist bilgileri ile beraber raporlansýn.

	select distinct r.AdSoyad as RehberAdSoyad,t.AdSoyad,t.TuristID,t.Cinsiyet,t.DogumTarihi,t.GeldigiTarih,t.UlkeAdi,t.Uyruk from Turistler t 	
	inner join Turitler_Rehberler_GidilecekYerler tr on t.TurisTID=tr.TurisTID
	inner join Rehberler r on r.RehberID=tr.RehberID
	inner join Turistler_Diller td on td.TuristID=t.TuristID
	inner join Diller d on d.DilID=td.DilID
	where Uyruk!= 'English' and UlkeAdi!= 'English' and DilAdi='Ýngilizce'

--6-Listemde olduðu halde rehberlerimin bildiði diller arasýnda yer almayan diller hangileridir?

	SELECT DISTINCT D.DilAdi
	FROM Rehberler R
	JOIN Rehberler_Diller RD ON R.RehberID = RD.RehberID
	RIGHT JOIN Diller D ON RD.DilID = D.DilID
	WHERE RD.RehberID IS NULL	 

--7-Ülkesi Japonya olan müþterilerim fatura ödemelerini hangi para biriminde yapmýþlar. (Turist Ad, Soyad, Ülke, FaturaTarihi, Ödemeþekli, ParaBirimi)

	SELECT T.AdSoyad, T.UlkeAdi, FD.FaturaTarihi, O.OdemeSekli, FD.ParaBirimi
FROM Turistler T
JOIN Faturalar F ON T.TuristID = F.TuristID
JOIN Odeme O ON F.TuristID = O.TuristID
JOIN FaturaDetay FD ON F.FaturaID = FD.FaturaID
WHERE T.UlkeAdi = 'Japanese'

--8-Nakit ödeme yapmamayý tercih eden müþterilerim hangi ülkelerden (Sorguyu diðer ödeme þekil(ler)ini bilmiyormuþ gibi yazýnýz)

	SELECT DISTINCT T.UlkeAdi
	FROM Turistler T
	JOIN Odeme O ON T.TuristID = O.TuristID
	WHERE O.OdemeSekli <> 'Nakit'


