# README

## 作った目的
Nuxt&vuetifyを使って、結構多めのページがあるWEBサイト作ってみたかった。

## 概要
Routingとかレンダリングは、NuxtJSに任せています。
RailsはAPIサーバとして一部利用してます。

## 確認方法

```
# Rails起動
$ bundle install --path vendor/bundle --jobs=4
$ bundle exec rails server -e development
```

```
# Nuxt起動
$ cd frontend
$ yarn install
$ yarn run dev
```

これで、
http://localhost:3333
を見れば確認できるはず！
