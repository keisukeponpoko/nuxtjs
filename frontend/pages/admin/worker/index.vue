<template>
  <v-card>
    <v-card-title>
      <span class="headline">ワーカー一覧</span>
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
            <span>
              {{ props.header.text }}
            </span>
          </v-tooltip>
        </template>
        <template slot="items" slot-scope="props">
          <td><a :href="'/admin/worker/' + props.item.id">{{ props.item.id }}</a></td>
          <td class="text-xs-right">{{ props.item.name }}</td>
          <td class="text-xs-right">{{ props.item.date }}</td>
          <td class="text-xs-right">{{ props.item.role }}</td>
          <td class="text-xs-right">{{ props.item.articles }}</td>
          <td class="text-xs-right">{{ props.item.old_articles }}</td>
        </template>
      </v-data-table>
    </v-card-text>
  </v-card>
</template>


<script>
  export default {
    data () {
      return {
        headers: [
          { text: 'id', value: 'id' },
          { text: '名前', value: 'name' },
          { text: '最終稼働日', value: 'date' },
          { text: '役割', value: 'role' },
          { text: '現在の記事数', value: 'articles' },
          { text: '過去の記事数', value: 'old_articles' }
        ],
        desserts: [
          {
            id: 1,
            name: '太郎',
            role: '書き手',
            articles: '2本',
            old_articles: '10本',
            date: '2018-09-22'
          },
          {
            id: 2,
            name: '花子',
            role: '書き手',
            articles: '3本',
            old_articles: '0本',
            date: '2018-09-22'
          },
          {
            id: 3,
            name: '与四郎',
            role: '校正',
            articles: '0本',
            old_articles: '0本',
            date: '2018-09-22'
          }
        ]
      }
    }
  }
</script>
