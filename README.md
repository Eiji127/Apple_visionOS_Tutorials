# Apple visionOS Tutorials
## 1. [Creating 2D shapes with SwiftUI](https://developer.apple.com/documentation/visionos/creating-2d-shapes-in-visionos-with-swiftui)
![スクリーンショット 2024-11-27 21 45 29](https://github.com/user-attachments/assets/1c8f492f-d204-469f-b168-5b8c01d0946e)

## 2. [Creating 3D entities with RealityKit](https://developer.apple.com/documentation/visionos/creating-3d-shapes-in-visionos-with-realitykit)
![スクリーンショット 2024-12-03 18 33 47](https://github.com/user-attachments/assets/3cea144f-5ce8-4925-b7ee-4ffcf6d3dc7a)

- 3Dオブジェクト（マテリアル）の追加方法   
  ① マテリアルの作成 (SimpleMaterial)  
  ② メッシュを生成 (MeshResource)  
  ③ 3Dモデルのレンダリング (ModelComponent)
- [マテリアル](https://cgworld.jp/terms/%E3%83%9E%E3%83%86%E3%83%AA%E3%82%A2%E3%83%AB%EF%BC%8FMaterial.html#:~:text=%E3%83%9E%E3%83%86%E3%83%AA%E3%82%A2%E3%83%AB%EF%BC%88material%EF%BC%89%20%E3%81%AF%E3%80%813D,%E3%81%AE%E8%A1%A8%E7%8F%BE%E3%81%8C%E5%AE%9F%E7%8F%BE%E3%81%A7%E3%81%8D%E3%82%8B%E3%80%82)とは「3Dモデルの質感を決定するもので、たとえば木材、金属、ガラスなどに見えるように制御することができる。」のこと。
- [メッシュ](https://forest.watch.impress.co.jp/docs/serial/blenderwthing/1423222.html#:~:text=%E5%85%A8%E3%82%B8%E3%82%AA%E3%83%A1%E3%83%88%E3%83%AA-,%E3%83%A1%E3%83%83%E3%82%B7%E3%83%A5,-3DCG%E3%81%A7%E7%AB%8B%E4%BD%93)とは「3DCGで立体を表すデータ形式の1つである[「ポリゴンメッシュ」](https://ja.wikipedia.org/wiki/%E3%83%9D%E3%83%AA%E3%82%B4%E3%83%B3%E3%83%A1%E3%83%83%E3%82%B7%E3%83%A5)のこと。ポリゴン（多角形の面）が集合した中空の構造で形状を表現する。」のこと。
- [ジオメトリ](https://forest.watch.impress.co.jp/docs/serial/blenderwthing/1423222.html#:~:text=Web%E3%80%8D%E3%82%92%E6%A4%9C%E8%A8%BC%EF%BC%81-,%E3%82%B8%E3%82%AA%E3%83%A1%E3%83%88%E3%83%AA,-%E3%80%8C%E5%BD%A2%E7%8A%B6%E3%80%8D%E3%81%BE%E3%81%9F%E3%81%AF%E3%80%8C%E5%BD%A2%E7%8A%B6)とは「「形状」または「形状データ」のことを指す。」のこと。
  
## 3. [Creating SwiftUI windows in visionOS](https://developer.apple.com/documentation/visionos/creating-a-new-swiftui-window-in-visionos)
<img width="1092" alt="スクリーンショット 2024-12-04 15 40 35" src="https://github.com/user-attachments/assets/2ea73ad2-336b-48b2-8e52-18cf3dd10e9b">

- 複数のWindowを表示したい場合は一意のIDをWindowに対して、割り振ってあげる必要がある。
  - Indentifiableに準拠した構造体を用意してあげている、(`NewWindowID`)
  - Windowを増やすときは、IDの値を1だけインクリメントなどして、変更してあげる必要がある。
  - 新たなWindowを表示するときは、以下のものを定義してあげることで可能となる。
    ```swift:
    /// OpenWindowActionインスタンスを取得するための環境値
    @Environment(\.openWindow) private var openWindow
    ```
## 4. [Creating 3D models as movable windows](https://developer.apple.com/documentation/visionos/creating-a-volumetric-window-in-visionos)
<img width="676" alt="スクリーンショット 2024-12-04 19 01 52" src="https://github.com/user-attachments/assets/1c0f1c1c-272d-49f9-9ee9-fc1a861cc7e6">

- [ローカル座標](http://3dcg.homeip.net/3d_process/3d_Process_coordinate.php#:~:text=%E3%81%8C%E3%81%82%E3%82%8A%E3%81%BE%E3%81%99-,%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E5%BA%A7%E6%A8%99,-%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E5%BA%A7%E6%A8%99%E3%81%A8)：3D 空間に配置されるオブジェクトを基準とした座標の事をいう。つまり、ローカル座標は一つだけ存在するわけではない。
- [グローバル座標](http://3dcg.homeip.net/3d_process/3d_Process_coordinate.php#:~:text=%E3%81%84%E3%82%8B%E3%81%8B%E3%82%89%E3%81%A7%E3%81%99%E3%80%82-,%E3%82%B0%E3%83%AD%E3%83%BC%E3%83%90%E3%83%AB%E5%BA%A7%E6%A8%99,-%E3%82%B0%E3%83%AD%E3%83%BC%E3%83%90%E3%83%AB%E5%BA%A7%E6%A8%99%E3%81%A8)：三次元空間そのもの（世界）の位置を表す座標のこと。北極点が移動する事がないように、グローバル座標で指定された座標は絶対無二の存在であり決して移動することのない座標となっている。
- GeometryReader3Dで、高さ、横幅、奥行きの情報を取得する。
- RealityView内で3Dモデルを配置する。
- ボリュメトリック・ウィンドウのサイズが変更された時に、3Dモデルのサイズ変更を反映させるためには、RealityViewのupdateクロージャの中でサイズ変更処理を行う。

## 5. [Displaying text in visionOS](https://developer.apple.com/documentation/visionos/displaying-text-in-visionos)
<img width="718" alt="スクリーンショット 2024-12-05 1 56 26" src="https://github.com/user-attachments/assets/edf9845a-c3da-4efe-995c-2332ef20b28a">

## 6. [Adding a depth effect to text in visionOS](https://developer.apple.com/documentation/visionos/adding-a-depth-effect-to-text-in-visionos)
<img width="778" alt="スクリーンショット 2024-12-06 16 40 14" src="https://github.com/user-attachments/assets/87db9f15-cad9-45eb-a30c-ae0b3e0e6e99">

