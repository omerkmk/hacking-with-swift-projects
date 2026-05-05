# Project 1 — Storm Viewer

UIKit tabanlı galeri: uygulama bundle’ındaki `nssl*` fırtına görsellerini listeler, seçilen görseli tam ekran gösterir.

## Özellikler

- `UITableView` ile dosya adı listesi
- `DetailViewController` ile büyük görüntüleme
- Büyük başlık (`prefersLargeTitles`)
- Sağ üstte paylaşım / öneri (`UIActivityViewController`)

## Çalıştırma

`Project1.xcodeproj` dosyasını Xcode’da aç, bir simülatör veya cihaz seçip Run.

## Notlar

- Görseller `Project1/Content/` altında; liste `FileManager` ile bundle kökünden `nssl` önekine göre filtrelenir.
