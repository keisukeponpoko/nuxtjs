<template>
  <v-card>
    <v-card-title>
      <span class="headline">差分  <a @click="$router.go(-1)">戻る</a></span>
    </v-card-title>
    <v-card-text>
      <span v-html="html"></span>
    </v-card-text>
  </v-card>
</template>

<script>
  const jsdiff = require('diff');
  import {Diff2Html} from 'diff2html'

  const oldArticle = '';

  const newArticle = '<h1>#3「欲しいモノがなければ、自分で作ればいい」ai.さん</h1>\n' +
    '<div class="interview-photo">\n' +
    '<img src="https://cdn.roomclip.jp/roomclip-bucket/img_640/e46583c3ad438add31fc512e2ad721af04daf16b.jpg" alt=""><div class="photo-caption">\n' +
    '\n' +
    '</div>\n' +
    '</div>\n' +
    '<div class="interview-photo">\n' +
    '<img src="https://cdn.roomclip.jp/roomclip-bucket/img_640/67ff83150d2ceb1c434f94fd26b72f8a1e5c88f2.jpg" alt=""><div class="photo-caption">\n' +
    '\n' +
    '</div>\n' +
    '</div>\n' +
    '<h2>DIYのきっかけはお父さんの日曜大工</h2>\n' +
    '<p class="rc-question">ーai.さんといえば、やはりDIYのことを聞かないとですね。元々のきっかけはなんだったんですか？</p>\n' +
    '<p>「日曜大工が好きだった父の影響ですね。小学3,4年生のころから余った木材をもらって作り始めました。初めて作ったのは小さなトランク風の小物入れ。お気に入りの曲を録音していたカセットテープの収納用です。かわいいものを欲しくて作ったんですが、表に絵を描いちゃったので、今思うとそんなにかわいくはなかったかな（笑）そこからすごく工作を好きになりました」</p><p>「父からは『欲しいモノがなければ、自分で作ればいい』ということを学んだと思います。ちなみに母は藤の家具や植物、花がすごく好きだったんです。ナチュラルテイスト好きは母の影響ですね」</p>\n' +
    '<div class="interview-photo">\n' +
    '<img src="https://cdn.roomclip.jp/roomclip-bucket/img_640/803fa4cb247329fc52ad9077d4c1ce0c4ca6ff47.jpg" alt=""><div class="photo-caption">\n' +
    '\n' +
    '</div>\n' +
    '</div>\n' +
    '<h2>新婚後はリメイクが中心</h2>\n' +
    '<p class="rc-question">ー本格的に家具のDIYやリメイクを始めたのはいつごろですか？</p>\n' +
    '<p>「結婚して夫と２人で暮らし始めてからです。新婚のときに一通り家具はそろえたんですが、使っているうちに何か違うという気持ちが大きくなっていったんです。それで自分で角を削ったり取手をかえたりと、細かく改造していました」</p>\n' +
    '<p>「ある時は食器棚を見ていて、塗装が気に入らないなって思って全部削っちゃったこともあるんです。回りを養生テープで囲んで。夫は『何か工事でもするの』って驚いていました（笑）」</p>\n' +
    '<p class="rc-question">ーそれはすごいですね！その時はリメイク中心だったんですね。</p>\n' +
    '<p>「そうですね。その後、5年ほど前に今のマンションに引っ越したんですが、その時に新婚時に買った家具を全部リサイクルショップに売っちゃったんです。夫は『それ、結構高くなかったっけ…』って目を丸くしてましたけどね。そこから本格的にゼロから家具を作るようになりました」</p>\n' +
    '<div class="interview-photo">\n' +
    '<img src="https://cdn.roomclip.jp/roomclip-bucket/img_640/833a192cc80efe47a47dc15743075ff16e785db7.jpg" alt=""><div class="photo-caption">\n' +
    '\n' +
    '</div>\n' +
    '</div>\n' +
    '<div class="interview-photo">\n' +
    '<img src="https://cdn.roomclip.jp/roomclip-bucket/img_640/dc93f98c7f9ad2a581eded6dfe753d8d653f41f9.jpg" alt=""><div class="photo-caption">\n' +
    '\n' +
    '</div>\n' +
    '</div>\n' +
    '<h2>おすすめのホームセンターはコーナン</h2>\n' +
    '<p class="rc-question">ー今はどれくらいのペースでDIYをしてるんですか？</p>\n' +
    '<p>「だいたい2ヶ月に1回くらい新しい家具や雑貨を作っています。ホームセンターに自分で車運転していって、木材とか金具を買ってきます。お気に入りのホームセンターはコーナンです！木材の切り方がすごく丁寧だし、店員さんも親切なんですよ」</p>\n' +
    '<p>「平日、自宅から夫と子供を送り出してからが私の時間です。リビングでテーブルや椅子を端に寄せて、下にピクニックシートを引いてDIYをしています」</p>\n' +
    '<p class="rc-question">ーご家族の反応はいかがですか？</p>\n' +
    '<p>「夫はアウトドア派でインテリアはそれほど興味はないんです。でも私のインテリアのセンスには気を使ってくれてます。この前もテントを買ったときに、部屋のテイストに合うように茶色のテントを選んでくれたんです。小4と小1の息子は最近ちょっとずつインテリアに興味を持つようになってきました」</p>\n' +
    '<p>「部屋の中は自分の好きなモノだらけです。最近悩んでいるのは余った木片の置き場。木は絶対に何かに使えるので捨てられないんですよね。今は布袋に入れて部屋の隅に置いています。RoomClipにもアップしたんですよ」</p>\n' +
    '<div class="interview-photo">\n' +
    '<img src="https://cdn.roomclip.jp/roomclip-bucket/img_640/51b831b8c77952d7c9183fe453a70d786445a094.jpg" alt=""><div class="photo-caption">\n' +
    '\n' +
    '</div>\n' +
    '</div>\n' +
    '<h2>1000円かからずにDIYはできる</h2>\n' +
    '<p class="rc-question">ーai.さんのDIYやリメイクを参考にしているRoomClipのユーザーさんも多くいます。</p>\n' +
    '<p>「作り方を聞かれたりするのはすごく嬉しいですね。実は『作り方』というタグを作って、制作手順を載せたりもしてるんです。ブログだと文章で細かく書く必要があるけど、RoomClipだと手順ごとに短いコメントで説明できるのでやりやすいです」</p>\n' +
    '<p>「100均で売っているものを使えば1000円もかからずに簡単な家具って作れるんです。主婦で、自由に使えるお金もなくて、子育てで時間がなくたって十分にDIYはできますし、すごく楽しめます。私にできるんだから、みんなだってできると思います」</p>\n' +
    '<div class="interview-photo">\n' +
    '<img src="https://cdn.roomclip.jp/roomclip-bucket/img_640/6e2884e64013e4779aa0cf727191a0345040b555.jpg" alt=""><div class="photo-caption">\n' +
    '\n' +
    '</div>\n' +
    '</div>\n' +
    '<div class="interview-photo">\n' +
    '<img src="https://cdn.roomclip.jp/roomclip-bucket/img_640/0a95ce21da5da7003ac3457f104c228ee22c834c.jpg" alt=""><div class="photo-caption">\n' +
    '\n' +
    '</div>\n' +
    '</div>\n' +
    '<h2>主婦だって頑張れば素敵な部屋を作れる</h2>\n' +
    '<p class="rc-question">ー好きなインテリアショップとかはあるんですか？</p>\n' +
    '<p>「コーナン以外だと（笑）、八王子にあるGreen Gallery Gardensがすごく好きです。週に1回は観に行っているんじゃないかな。毎週行っても新しい発見があるんです。欲しいものがあるのはもちろん、自分で作れそうなものはよーく観察して次のDIYの参考にしたりしてます。オーナーさんのセンスが好きなんですね」</p>\n' +
    '<p class="rc-question">ーRoomClipはどうですか？</p>\n' +
    '<p>「同じインテリアの趣味を持っている人たち、インテリアが好きな人たちと部屋の写真を見せ合えるのがやっぱりすごくいいですね。こんなアプリは今までなかったので、もう完全に趣味になっています。主婦だって頑張れば素敵な部屋を作れるよ、というのをなるべく多くの人に知ってほしいと思っています」</p>\n' +
    '<p class="rc-question">ーどうもありがとうございました。</p>\n' +
    '<p>「ありがとうございました！！」</p>\n' +
    '<div class="interview-photo">\n' +
    '<img src="https://cdn.roomclip.jp/roomclip-bucket/img_640/16c1e157e0f55f42172f80cad211e3a1fc6325a0.jpg" alt=""><div class="photo-caption">\n' +
    '\n' +
    '</div>\n' +
    '</div>\n' +
    '<div class="interview-photo">\n' +
    '<img src="https://cdn.roomclip.jp/roomclip-bucket/img_640/7067910b852cc9aa7dfafc4074d7098c033b7f49.jpg" alt=""><div class="photo-caption">\n' +
    '\n' +
    '</div>\n' +
    '</div><hr>\n' +
    '<p>ご自宅の駅前のスターバックスでインタビューに応じて下さったai.さん。<br>\n' +
    'DIYやリメイクの話をすごく楽しそうに話して下さいました。<br>\n' +
    'ai.さんはブログ「Natuple」でもご自宅のDIYのヒミツなどを公開されています。<br>\n' +
    '\n' +
    '</p>\n' +
    '<div class="optional-btn-container">\n' +
    '<a href="http://ameblo.jp/natu-ple/" target="_blank" class="optional-btn"> ai.さんのブログ「Natuple」を見る</a>\n' +
    '</div>';


  export default {
    layout: 'editor',
    computed: {
      html() {
        const unifiedDiff = jsdiff.createPatch("DIYの記事", oldArticle, newArticle);
        return Diff2Html.getPrettyHtml(unifiedDiff, {inputFormat: 'diff', showFiles: true, matching: 'lines'});
      }
    }
  }
</script>
