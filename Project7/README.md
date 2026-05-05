# Project 7 — Petitions

Örnek JSON beslemesinden dilekçe listesi çeker; tabloda başlık ve özet gösterir, detayda tam metin.

## Özellikler

- `Codable` modeller (`Petition`, `Petitions`)
- `JSONDecoder` ile ayrıştırma
- Tab bar ile iki farklı örnek URL (kurs verisi)
- Ek düğmeler: Credits, Filter, yenileme, sıralama (senin uygulamanın sürümüne göre)

## Çalıştırma

`Project7.xcodeproj` dosyasını Xcode’da açıp çalıştır. İlk açılışta ağ erişimi gerekir.

## Not

Kurs örneği senkron `Data(contentsOf:)` kullanabilir; üretimde `URLSession` ve arka plan hata yönetimi tercih edilir.
