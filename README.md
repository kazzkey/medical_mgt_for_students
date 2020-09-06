# README

# 学生医療管理プログラム

## 概要
相互合意の上、学生が病欠や怪我で休んだ際、学生(&保護者)、教師、地元医療関係者三者が情報共有できるアプリケーション。

## コンセプト
学生(&保護者)、教師、地元医療関係者をつなぐプラットフォームアプリケーション

## バージョン
Ruby 2.6.5 Rails 5.2.4.3

## 機能一覧
- [ ] 生徒、教師or医師新規登録機能
  - [ ] <生徒>メールアドレス、名前、生徒ID、学校ID、生年月日、学年、血液型、パスワードは必須
  - [ ] <教師or医師>メールアドレス、名前、学校ID、パスワードは必須
- [ ] ログイン機能
- [ ] 投稿一覧表示機能
- [ ] 投稿機能
- [ ] コメント投稿機能
- [ ] プロフィール機能(生徒のみ)
- [ ] メモ機能(教師のみ)
- [ ] 健康診断情報一覧表示機能(教師、医師のみ)
- [ ] 健康診断結果記入機能(教師、医師のみ)
- [ ] 診断された生徒の健康情報の編集、削除機能(教師、医師のみ)


## カタログ設計
https://docs.google.com/spreadsheets/d/1Od1rLYQk-nKfthdyAalR7eQBLiPtgJQtUd2bnxoDOBc/edit?usp=sharing

## テーブル定義&ER図
https://docs.google.com/spreadsheets/d/1Z4iUGVCiUZDAqWcowWQWp1fsP5iF3dYwSnf6eRYTfTY/edit#gid=0


## 使用Gem
- devise
- font-awesome-sass
- simple_form
- summernote-rails
- kaminari
