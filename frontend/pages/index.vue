<template>
  <v-stepper v-model="e1">
    <v-stepper-header>
      <v-stepper-step :complete="e1 > 1" step="1">ネタを選ぶ</v-stepper-step>

      <v-divider></v-divider>

      <v-stepper-step :complete="e1 > 2" step="2">記事を書く</v-stepper-step>

      <v-divider></v-divider>

      <v-stepper-step :complete="e1 > 3" step="3">校正を受ける</v-stepper-step>

      <v-divider></v-divider>

      <v-stepper-step :complete="e1 > 4" step="4">修正する</v-stepper-step>

      <v-divider></v-divider>

      <v-stepper-step :complete="e1 > 5" step="5">記事完成</v-stepper-step>

      <v-divider></v-divider>


      <v-stepper-step step="6">記事公開！</v-stepper-step>
    </v-stepper-header>

    <v-stepper-items>
      <v-stepper-content step="1">
        <v-card
          class="mb-5"
          color="grey lighten-4"
          height="200px"
        ><v-card-text class="body-2">
          1. <router-link to="/admin/topic">管理者用ネタシート</router-link>に管理者がネタを追加する。<br />
          2. <router-link to="/editor/topic">書き手さん用ネタシート</router-link>で書き手さんが担当したいネタを選ぶ。<br />
          3. あるいは、<router-link to="/editor/topic">書き手さん用ネタシート</router-link>で書き手さんがネタを追加する？<br />
          4. <router-link to="/admin/topic">管理者用ネタシート</router-link>で、管理者がネタを書き手さんに振り分ける。
        </v-card-text></v-card>

        <v-btn
          color="primary"
          @click="e1 = 2"
        >
          Next
        </v-btn>
      </v-stepper-content>

      <v-stepper-content step="2">
        <v-card
          class="mb-5"
          color="grey lighten-4"
          height="200px"
        ><v-card-text class="body-2">
          1. <router-link to="/editor">書き手さんページ</router-link>を見て、そこにある作業中の記事を書き手さんが書いて、校正に回す
        </v-card-text></v-card>

        <v-btn
          color="primary"
          @click="e1 = 3"
        >
          Next
        </v-btn>

        <v-btn flat　@click="e1 = 1">Back</v-btn>
      </v-stepper-content>

      <v-stepper-content step="3">
        <v-card
          class="mb-5"
          color="grey lighten-4"
          height="200px"
        ><v-card-text class="body-2">
          1. <router-link to="/checker">校正さんページ</router-link>を見て、そこにある校正中の記事を校正さんが校正して、確認に回す<br />
          2. <router-link to="/admin">管理者用ページ</router-link>を見て、校正の修正点を、書き手さんに伝える
        </v-card-text></v-card>

        <v-btn
          color="primary"
          @click="e1 = 4"
        >
          Next
        </v-btn>

        <v-btn flat　@click="e1 = 2">Back</v-btn>
      </v-stepper-content>

      <v-stepper-content step="4">
        <v-card
          class="mb-5"
          color="grey lighten-4"
          height="200px"
        ><v-card-text class="body-2">
          1. <router-link to="/editor">書き手さんページ</router-link>を見て、そこにある校正済みの記事を書き手さんが修正して、校正に回す<br />
          2. これらを繰り返す
        </v-card-text></v-card>

        <v-btn
          color="primary"
          @click="e1 = 5"
        >
          Next
        </v-btn>

        <v-btn flat　@click="e1 = 3">Back</v-btn>
      </v-stepper-content>

      <v-stepper-content step="5">
        <v-card
          class="mb-5"
          color="grey lighten-4"
          height="200px"
        ><v-card-text class="body-2">
          1. <router-link to="/admin">管理者用ページ</router-link>を見て、完成した記事を公開する準備する
        </v-card-text></v-card>

        <v-btn
          color="primary"
          @click="e1 = 6"
        >
          Next
        </v-btn>

        <v-btn flat　@click="e1 = 4">Back</v-btn>
      </v-stepper-content>

      <v-stepper-content step="6">
        <v-card
          class="mb-5"
          color="grey lighten-4"
          height="200px"
        ><v-card-text class="body-2">
          1. 公開される！
        </v-card-text></v-card>

        <v-btn
          color="primary"
          @click="e1 = 1"
        >
          Return
        </v-btn>

        <v-btn flat　@click="e1 = 5">Back</v-btn>
      </v-stepper-content>
    </v-stepper-items>
  </v-stepper>
</template>


<script>
  export default {
    data () {
      return {
        e1: 0
      }
    }
  }
</script>
