<template>
  <v-card>
    <v-card-title>
      <span class="headline">校正中記事一覧</span>
    </v-card-title>
    <v-card-text>
      <v-data-table
        :headers="headers"
        :items="desserts"
        class="elevation-1"
      >
        <template slot="headerCell" slot-scope="props">
          <v-tooltip bottom>
            <span slot="activator">
              {{ props.header.text }}
            </span>
          </v-tooltip>
        </template>
        <template slot="items" slot-scope="props">
          <td>{{ props.item.date }}</td>
          <td class="text-xs-right">{{ props.item.article }}</td>
          <td class="text-xs-right">{{ props.item.status }}</td>
          <td class="text-xs-right"><router-link to="/checker/diff"><v-icon>spellcheck</v-icon></router-link></td>
        </template>
      </v-data-table>
    </v-card-text>
  </v-card>
</template>


<script>
  export default {
    layout: 'checker',
    data () {
      return {
        headers: [
          { text: 'ステータス変更日時', value: 'date' },
          { text: '記事内容', value: 'article' },
          { text: 'ステータス', value: 'status' },
          { text: '差分確認', value: 'diff' },
        ],
        desserts: [
          {
            date: '2018-09-01',
            status: '校正中',
            article: 'DIY'
          },
          {
            date: '2018-09-04',
            status: '校正中',
            article: 'ネタのタイトル'
          },
          {
            date: '2018-09-16',
            status: '校正中',
            article: '記事のタイトル'
          },
          {
            date: '2018-09-22',
            status: '校正中',
            article: '収納'
          }
        ]
      }
    }
  }
</script>
