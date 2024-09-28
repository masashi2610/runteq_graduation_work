
### 概要
■サービス概要
野球のスパイクに特化したサービスで、スパイクの管理・検索ができます

■ このサービスへの思い・作りたい理由
私は草野球を20年以上やっており、スパイクは2~3年に1度買い替えています
自分が使ってきたスパイクの管理や、新しいオススメのスパイク検索ができたら便利だと思いました

■ ユーザー層について
草野球ユーザー45万人
その中でもスパイクを履き替えるくらい、野球をやっているユーザー（想定10万人）

■サービスの利用イメージ
自分のスパイクを登録し、自分のスパイク遍歴が作れる
また、新しいスパイクを購入するときに、おすすめスパイクが検索できる

■ ユーザーの獲得について
個人で野球ブログ（月間10万PV）https://baseball-infomation.com/
を運営しているので、こちらで告知をします

■ サービスの差別化ポイント・推しポイント
自分のスパイクを登録しておくサービスは他にありません
また、野球スパイクのオススメを提案してくれるサービスも見たことがありません

■ 機能候補
MVPリリース：
・ユーザー登録/ログイン機能/Googleログイン機能
・スパイク登録機能(CRUDアクション)
本リリース：スパイクの提案機能

■ 機能の実装方針予定
スパイクの提案機能で、OpenAI APIと楽天APIによる提案を行いたいと思っています


### 画面遷移図
Figma：https://www.figma.com/design/NmKEucVCnFpJPlwXc6tykn/%E9%87%8E%E7%90%83%E3%82%B9%E3%83%91%E3%82%A4%E3%82%AF%E3%82%AA%E3%82%B9%E3%82%B9%E3%83%A1?node-id=0-1&t=jds1yKTri5xHK6It-1

### 機能一覧
- [ ] TOPページ
- [ ] ユーザー登録機能
- [ ] ログイン機能
- [ ] Googleログイン機能
- [ ] パスワード変更機能
- [ ] スパイク検索機能_OpenAI API連携（未ログインでも利用可能）
- [ ] スパイク検索機能_楽天API連携（未ログインでも利用可能）
- [ ] スパイク管理機能_スパイク一覧
- [ ] スパイク管理機能_スパイク登録
- [ ] スパイク管理機能_スパイク編集

### ER図
https://drive.google.com/file/d/1oaysKvdoQArJCPGTtoYslsd1IoM8oxrH/view?usp=sharing
