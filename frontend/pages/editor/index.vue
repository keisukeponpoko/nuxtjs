<template>
  <div>
    <v-card>
      <v-card-title>
        <span class="headline">作業中記事一覧</span>
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
            <td class="text-xs-right"><a href="/editor/diff"><v-icon>spellcheck</v-icon></a></td>
          </template>
        </v-data-table>
      </v-card-text>
    </v-card>

    <v-card>
      <v-card-title>
        <span class="headline">作業待ち中記事一覧</span>
      </v-card-title>
      <v-card-text>
        <v-data-table
          :headers="headers"
          :items="dessertss"
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
            <td class="text-xs-right"><a href="/editor/diff"><v-icon>spellcheck</v-icon></a></td>
          </template>
        </v-data-table>
      </v-card-text>
    </v-card>
  </div>
</template>


<script>
  export default {
    layout: 'editor',
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
            status: '校正差し戻し',
            article: 'DIY'
          },
          {
            date: '2018-09-16',
            status: '担当振り分け済み',
            article: '記事のタイトル'
          }
        ],
        dessertss: [
          {
            date: '2018-09-04',
            status: '校正中',
            article: 'ネタのタイトル'
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
