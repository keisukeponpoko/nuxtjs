<template>
  <v-card>
    <v-card-title>
      <span class="headline">記事一覧</span>
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
          <td>
            <router-link :to="{path: '/admin/article/' + props.item.id}">
              {{ props.item.id }}
            </router-link>
          </td>
          <td class="text-xs-right">{{ props.item.name }}</td>
          <td class="text-xs-right">{{ props.item.worker }}</td>
          <td class="text-xs-right">{{ props.item.status }}</td>
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
          { text: 'id', value: 'id' },
          { text: 'ネタ名', value: 'name' },
          { text: 'ワーカー', value: 'worker' },
          { text: 'ステータス', value: 'status' },
        ],
        desserts: [
          {
            id: 1,
            name: 'DIY',
            worker: '太郎',
            status: '校正中',
          },
          {
            id: 2,
            name: '収納',
            worker: '太郎',
            status: '校正中',
          },
          {
            id: 3,
            name: 'インテリア',
            worker: '花子',
            status: '校正中',
          }
        ]
      }
    }
  }
</script>
