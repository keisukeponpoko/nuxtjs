<template>
  <v-card>
    <v-card-title>
      <span class="headline">「DIY」記事進捗</span>
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
          <td class="text-xs-right">{{ props.item.worker }}</td>
          <td class="text-xs-right">{{ props.item.status }}</td>
          <td class="text-xs-right"><a href="/admin/diff"><v-icon>spellcheck</v-icon></a></td>
        </template>
      </v-data-table>
    </v-card-text>
  </v-card>
</template>


<script>
  export default {
    layout: 'admin',
    data () {
      return {
        headers: [
          { text: 'ステータス変更日時', value: 'date' },
          { text: 'ワーカー', value: 'worker' },
          { text: 'ステータス', value: 'status' },
          { text: '差分確認', value: 'diff' },
        ],
        desserts: [
          {
            worker: '管理者',
            date: '2018-09-01',
            status: '担当設定',
          },
          {
            worker: '太郎',
            date: '2018-09-01',
            status: '原稿提出',
          },
          {
            worker: '花子',
            date: '2018-09-04',
            status: '校正完了',
          },
          {
            worker: '太郎',
            date: '2018-09-16',
            status: '原稿提出',
          },
          {
            worker: '与四郎',
            date: '2018-09-22',
            status: '校正完了',
          }
        ]
      }
    }
  }
</script>
