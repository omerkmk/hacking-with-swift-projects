# Project 4 — Easy Browser

`WKWebView` ile sınırlı bir “mini tarayıcı”: önceden tanımlı siteler arasında gezinme ve temel gezinim kontrolleri.

## Özellikler

- İlerleme çubuğu (`UIProgressView`, `estimatedProgress` gözlemi)
- Geri / ileri / yenileme (toolbar)
- İzin verilen alan adları dışına çıkmayı `WKNavigationDelegate` ile engelleme
- “Open” ile site seçimi (`UIAlertController`)

## Çalıştırma

`Project4.xcodeproj` dosyasını Xcode’da açıp çalıştır.

## Not

Gerçek üretim uygulamalarında yükleme ve hata yönetimi için asenkron ağ ve daha sıkı URL doğrulama kullanılır.
