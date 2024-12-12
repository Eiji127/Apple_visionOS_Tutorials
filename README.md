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

## 7. [Creating an interactive 3D model in visionOS](https://developer.apple.com/documentation/visionos/creating-an-interactable-3d-model-in-visionos)
<img width="778" alt="スクリーンショット 2024-12-10 16 40 14" src="https://github.com/user-attachments/assets/4e358cec-149f-4d6f-ae6f-d988b1b977f0">  

- ルートコンポーネント (Root Component)
  - **意味**  
    - 3Dオブジェクトやキャラクターを構成する「中心」となる部分。
  - **例え**  
    - 3Dキャラクターを作るとき、キャラクター全体をまとめて動かしたり、回転させたりする「基準」となる土台のようなもの。例えば、人形があったら「人形全体を支えるベース」がルートコンポーネントに相当します。
  - **役割**  
    - オブジェクト全体の動きや位置を管理する。  
    - 他の部品（腕や足など）がすべてこのルートコンポーネントに紐づいている。  
    - ルートコンポーネントを動かすと、すべての部品が一緒に動く。
- コリジョンコンポーネント (Collision Component)
  - **意味**  
    - 3Dオブジェクトが他のオブジェクトと衝突するかどうかを判断するための「当たり判定」を作る部分。
  - **例え**  
    - ゲームでキャラクターが壁にぶつかるシーンを想像してください。このとき、キャラクターや壁に「見えない枠」が設定されていて、その枠同士がぶつかったときに「衝突」と認識されます。この「見えない枠」がコリジョンコンポーネントです。
  - **役割**  
    - 物理的な衝突を計算する。  
      - （例: キャラクターが壁を突き抜けないようにする）  
    - オブジェクトが他のオブジェクトと接触した際のイベント（ダメージや跳ね返りなど）を引き起こす。  
    - 形状はシンプルな図形（球、箱、カプセルなど）で設定されることが多い。これは計算を軽くするため。

## 8. [Creating an immersive space in visionOS](https://developer.apple.com/documentation/visionos/creating-immersive-spaces-in-visionos-with-swiftui)
<img width="778" alt="スクリーンショット 2024-12-10 16 40 14" src="https://github.com/user-attachments/assets/c832f642-5d72-453a-bd73-fdf977015d45">  

- TurnTableSystem 
  - 今回独自で実装している構造体。
  - 速度と回転軸を定義するTurnTableComponentを通して、エンティティの回転ダイナミクスを管理するコア機能を実行する。
- SIMD3
  - 「Single Instruction, Multiple Data」の略。
  - 3次元のベクトル（x, y, z座標を持つ点や方向）を扱うための構造体（データ型）。
  - 座標計算、回転や拡大縮小などの行列・ベクトル演算が効率良く行える。
- deltaTime
  - 前回のフレーム更新から今回のフレーム更新までに経過した時間を指す。
  - フレームごとに描画や物理演算を行えるが、処理速度やマシンスペックによってフレーム間隔は常に一定ではない。そのため、オブジェクトを動かすときに「1フレームで何秒経過したか」を考慮して動きを計算することで、時間ベースの安定した動き（フレームレートに左右されない動き）を実現できる。
- ハロー効果（Halo Effect）
  - **意味**  
    - オブジェクトの周囲にぼんやりとした光の輪や輝きがにじんで見える現象を指すこと。
  - **例え**
    - ライト周りのにじみ：明るい光源を背景にしたとき、光源の周囲に淡い発光が広がるような描画が行われる場合があります。これを「ハロー」と呼ぶことがあります。
    - オブジェクトの縁取り効果：非常に強い光や特殊なシェーダー、ポストエフェクト（例えばブルーム効果）を使うことで、物体の輪郭付近に光のにじみが発生し、ハローのような見た目が出ます。
  - **役割**
    - リアリズムの強化：現実世界では、強い光源を見るとカメラや人間の目にも光のにじみが見えることがあります。これを再現することでよりリアルな映像表現が可能になります。
    - 雰囲気作り：幻想的なシーンや、夢のような世界観を表現する際に、ハロー効果は柔らかな雰囲気を強調する表現として利用できます。
