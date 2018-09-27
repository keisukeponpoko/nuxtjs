<template>
  <div>
    <v-card>
      <v-card-title>
        <span class="headline">校正済みの記事一覧</span>
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
            <td><router-link to="admin/article/1">{{ props.item.date }}</router-link></td>
            <td class="text-xs-right">{{ props.item.article }}</td>
            <td class="text-xs-right">{{ props.item.worker }}</td>
            <td class="text-xs-right">{{ props.item.status }}</td>
            <td class="text-xs-right"><router-link to="/admin/diff"><v-icon>spellcheck</v-icon></router-link></td>
            <td class="text-xs-right">
              <v-btn color="success">校正完了へ</v-btn>
              <v-btn color="error">差し戻し</v-btn>
            </td>
          </template>
        </v-data-table>
      </v-card-text>
    </v-card>

    <v-card>
      <v-card-title>
        <span class="headline">校正完了の記事一覧</span>
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
            <td class="text-xs-right">{{ props.item.worker }}</td>
            <td class="text-xs-right">{{ props.item.status }}</td>
            <td class="text-xs-right"><router-link to="/admin/diff"><v-icon>spellcheck</v-icon></router-link></td>
            <td class="text-xs-right">
              <v-btn color="success">公開へ</v-btn>
              <v-btn color="error">差し戻し</v-btn>
            </td>
          </template>
        </v-data-table>
      </v-card-text>
    </v-card>

    <v-card>
      <v-card-title>
        <span class="headline">作業中の記事一覧</span>
      </v-card-title>
      <v-card-text>
        <v-data-table
          :headers="headers"
          :items="dessertsss"
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
            <td class="text-xs-right">{{ props.item.worker }}</td>
            <td class="text-xs-right">{{ props.item.status }}</td>
            <td class="text-xs-right"><router-link to="/admin/diff"><v-icon>spellcheck</v-icon></router-link></td>
            <td class="text-xs-right"><v-btn color="success">校正中へ</v-btn></td>
          </template>
        </v-data-table>
      </v-card-text>
    </v-card>
  </div>
</template>


<script>
  export default {
    layout: 'admin',
    data () {
      return {
        headers: [
          { text: 'ステータス変更日時', value: 'date' },
          { text: '記事内容', value: 'article' },
          { text: 'ワーカー', value: 'worker' },
          { text: 'ステータス', value: 'status' },
          { text: '差分確認', value: 'diff' },
          { text: 'ボタン', value: 'action' },
        ],
        desserts: [
          {
            worker: '太郎',
            date: '2018-09-01',
            status: '要修正',
            article: 'DIY'
          },
          {
            worker: '花子',
            date: '2018-09-04',
            status: '要修正',
            article: 'ネタのタイトル'
          },
          {
            worker: '太郎',
            date: '2018-09-16',
            status: '要修正',
            article: '記事のタイトル'
          },
          {
            worker: '与四郎',
            date: '2018-09-22',
            status: '要修正',
            article: '収納'
          }
        ],
        dessertss: [
          {
            worker: '太郎',
            date: '2018-09-01',
            status: '校正完了',
            article: 'DIY'
          },
          {
            worker: '花子',
            date: '2018-09-04',
            status: '校正完了',
            article: 'ネタのタイトル'
          },
          {
            worker: '太郎',
            date: '2018-09-16',
            status: '校正完了',
            article: '記事のタイトル'
          },
          {
            worker: '与四郎',
            date: '2018-09-22',
            status: '校正完了',
            article: '収納'
          }
        ],
        dessertsss: [
          {
            worker: '太郎',
            date: '2018-09-01',
            status: '作業中',
            article: 'DIY'
          },
          {
            worker: '花子',
            date: '2018-09-04',
            status: '作業中',
            article: 'ネタのタイトル'
          },
          {
            worker: '太郎',
            date: '2018-09-16',
            status: '作業中',
            article: '記事のタイトル'
          },
          {
            worker: '与四郎',
            date: '2018-09-22',
            status: '作業中',
            article: '収納'
          }
        ]
      }
    }
  }
</script>
