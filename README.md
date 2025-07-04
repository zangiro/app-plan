# 気になるグルメ発掘ナビ

サービスURL：[気になるグルメ発掘ナビ](https://kininaru-gurume.com)

![気になるグルメ発掘ナビ](https://kininaru-gurume.com/assets/ogp.png)

## サービス概要

自分の知らないご当地グルメ、郷土料理発見を目的とするアプリです<br>
使い方は気になったタグを選ぶだけ、少ない操作数で記事の一覧を表示します。<br>
一覧は画像メインとなっており、ページいっぱいに表示。<br>
ページ移動を少なくしつつ他の料理と見比べることができます。<br>
タグも料理画像もシンプルに多量表示し、直感的に選べられるようにしました。

## サービスへの想い、作りたい理由

自分も美味しいもの食べるのが好きなんですが、美味しいものが各地にいっぱいあって何を選んだらいいかよく迷います。<br>
情報がありすぎるがゆえに調べたり探したりが面倒だったりもします。<br>
食事しに行く機会があっても選択肢として思い浮かぶのは、基本知名度の高い定番のものが多いです。<br>
事前に見た目だけでも知っていたらもっと選択肢の幅が増えたかもしれないと思います。<br>
<br>
という実体験から詳細情報は二の次で「短時間」「少ない手間」「直感的」にいろんな料理情報の検索、見比べができたら便利と思いこのアプリを作ってみようと思いました。

## ユーザー層について

- グルメへの知識が少ないが、各地のグルメに興味がある方。
- 少ない手間でいろんなグルメを見比べしたい方。

## サービスの利用イメージ

- ユーザーは、自由なタグを選択し、関連する記事が画像一覧として表示されます。<br>
- 記事を選択することで詳細が表示され、料理の情報が取得できます。<br>
- ログインをすることで、選択した料理が提供されている近隣の店舗の情報を同時に取得できます。

## ユーザーの獲得について

- Xでの宣伝
- 同スクール内でのMattermostでの告知

## サービスの差別化ポイント・推しポイント

ちょっとした時間にサッといろんな料理情報を見比べして新しい発見を得るという目的で作りました。<br>
手間を極力減らし少ない操作でたくさんの料理情報が取得できるという点に特化しています。<br>
調べるだけなら類似サービスでも行えますが、本アプリは料理の情報を調べつつ同時に店舗検索もでき、より利用者の情報を集める際の手間を省くことに特化しました。

## 機能一覧

**基本機能**
- **ログイン機能**
- **パスワードリセット機能**
- **Googleログイン機能**
- **タグによるグルメ検索機能**
- **あいまい検索機能**
- **オートコンプリート機能**

**ログイン後に使用できる機能**
- **記事投稿機能**
- **コメント機能**
- **いいね機能**
- **Google MAP APIを使用した店舗検索機能**
- **閲覧履歴機能**

## 使用技術

| カテゴリ | 技術 |
| ---- | ---- |
| フロントエンド | Bootstrap 5.3.3 / JavaScript |
| バックエンド | Rails 7.2.2 (Ruby 3.2.3) |
| データベース | PostgreSQL |
| 開発環境 | Docker |
| インフラ | Fly.io / AmazonS3 |
| API | Google Maps API, Google Places API, Geocoding API, Google OAuth2 |
| 認証 | Sorcery, Googleログイン |
| CI/CD | GitHub Actions |

## 画面遷移図
https://www.figma.com/design/fQ8mAXdM7n3zbtiJbPCkt9/%E5%8D%92%E5%88%B6%E4%BD%9C%E7%94%A8?node-id=0-1&p=f&t=gx8iWT5gnubTgq2Y-0

## ■ ER図
[![kininaru-gureme](https://i.gyazo.com/bcaa7d5f8863c264b677e63c8665a83d.png)](https://gyazo.com/bcaa7d5f8863c264b677e63c8665a83d)
詳細は[こちら](https://dbdiagram.io/d/683fd04161dc3bf08d7c3962)