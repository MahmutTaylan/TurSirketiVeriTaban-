--1-Rehberlerimin bu zamana kadar ilgilendikleri t�m turistleri �lke ve uyruk bilgileri ile getiriniz.
	
	select r.AdSoyad as Rehber,t.AdSoyad as Turist,t.Uyruk from Rehberler r 
	inner join Turitler_Rehberler_GidilecekYerler tr on r.RehberID=tr.RehberID
	inner join Turistler t on t.TuristID=tr.TuristID

--2-Her bir tur i�in indirimli, tam, yar�m fiyat�n� listeleyen sorguyu yaz�n. Zam veya indirim uygulanm�� turlar�n da ge�mi�e y�nelik t�m fiyat bilgisi gelsin.
--Rapor �u �ekilde olmal�;
--Ayasofya | Tam | 120 | 2015-05-05
--Ayasofya | Yar�m | 60 | 2015-05-05   ....vb

	select GidelecekYerAdi,BiletT�r�,Fiyat,FaturaTarihi from FaturaDetay fd inner join GidilecekYerler g on g.GidilecekYerID=fd.GidilecekYerID

--3-�u zamana kadar yap�lan en pahal� tura hangi turistim dahil olmu�, bu turun �demesini kim yapm�� ve bu turiste hangi tur rehberi atanm��? Ayn� fiyat bilgisine sahip di�er kay�tlar da gelsin.
	
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
         
--4-Almanya uyruklu turistlerimden tam bilet ile tura kat�lan turistlerim nereleri hangi tur rehberi ile ziyaret etmi�.

	select t.AdSoyad as Turist,gy.GidelecekYerAdi as GidilecekYer,r.AdSoyad as Rehber from Turistler t 
	inner join Faturalar f on f.TuristID=t.TuristID
	inner join FaturaDetay fd on f.FaturaID=fd.FaturaID
	inner join Turitler_Rehberler_GidilecekYerler tr on t.TuristID=tr.TuristID
	inner join GidilecekYerler gy on gy.GidilecekYerID=tr.GidilecekYerID
	inner join Rehberler r on r.RehberID=tr.RehberID
	where t.Uyruk='Dutch' and BiletT�r�='Tam'

--5-�ngilizce bildi�i halde �lkesi de uyru�u da �ngiltere olmayan turistlere rehberlik eden tur rehberlerim kimler? �lgilendi�i turist bilgileri ile beraber raporlans�n.

	select distinct r.AdSoyad as RehberAdSoyad,t.AdSoyad,t.TuristID,t.Cinsiyet,t.DogumTarihi,t.GeldigiTarih,t.UlkeAdi,t.Uyruk from Turistler t 	
	inner join Turitler_Rehberler_GidilecekYerler tr on t.TurisTID=tr.TurisTID
	inner join Rehberler r on r.RehberID=tr.RehberID
	inner join Turistler_Diller td on td.TuristID=t.TuristID
	inner join Diller d on d.DilID=td.DilID
	where Uyruk!= 'English' and UlkeAdi!= 'English' and DilAdi='�ngilizce'

--6-Listemde oldu�u halde rehberlerimin bildi�i diller aras�nda yer almayan diller hangileridir?

	SELECT DISTINCT D.DilAdi
	FROM Rehberler R
	JOIN Rehberler_Diller RD ON R.RehberID = RD.RehberID
	RIGHT JOIN Diller D ON RD.DilID = D.DilID
	WHERE RD.RehberID IS NULL	 

--7-�lkesi Japonya olan m��terilerim fatura �demelerini hangi para biriminde yapm��lar. (Turist Ad, Soyad, �lke, FaturaTarihi, �deme�ekli, ParaBirimi)

	SELECT T.AdSoyad, T.UlkeAdi, FD.FaturaTarihi, O.OdemeSekli, FD.ParaBirimi
FROM Turistler T
JOIN Faturalar F ON T.TuristID = F.TuristID
JOIN Odeme O ON F.TuristID = O.TuristID
JOIN FaturaDetay FD ON F.FaturaID = FD.FaturaID
WHERE T.UlkeAdi = 'Japanese'

--8-Nakit �deme yapmamay� tercih eden m��terilerim hangi �lkelerden (Sorguyu di�er �deme �ekil(ler)ini bilmiyormu� gibi yaz�n�z)

	SELECT DISTINCT T.UlkeAdi
	FROM Turistler T
	JOIN Odeme O ON T.TuristID = O.TuristID
	WHERE O.OdemeSekli <> 'Nakit'


