<template>
  <v-card>
    <v-card-title>
      <span class="headline">ネタ一覧</span>
    </v-card-title>
    <v-card-text>
      <v-data-table
        v-model="selected"
        :headers="headers"
        :items="topic"
        :pagination.sync="pagination"
        select-all
        item-key="id"
        class="elevation-1"
        :rows-per-page-items="[10,20]"
      >
        <template slot="headers" slot-scope="props">
          <tr>
            <th>
              <v-checkbox
                :input-value="props.all"
                :indeterminate="props.indeterminate"
                primary
                hide-details
                @click.native="toggleAll"
              ></v-checkbox>
            </th>
            <th
              v-for="header in props.headers"
              :key="header.text"
              :class="['column sortable', pagination.descending ? 'desc' : 'asc', header.value === pagination.sortBy ? 'active' : '']"
              @click="changeSort(header.value)"
            >
              <v-icon small>arrow_upward</v-icon>
              {{ header.text }}
            </th>
          </tr>
        </template>
        <template slot="items" slot-scope="props">
          <tr :active="props.selected" @click="props.selected = !props.selected">
            <td>
              <v-checkbox
                :input-value="props.selected"
                primary
                hide-details
              ></v-checkbox>
            </td>
            <td>{{ props.item.id }}</td>
            <td class="text-xs-right">{{ props.item.date }}</td>
            <td class="text-xs-right">{{ props.item.desire }}</td>
            <td class="text-xs-right">{{ props.item.title }}</td>
            <td class="text-xs-right">{{ props.item.idea }}</td>
            <td class="text-xs-right">{{ props.item.category }}</td>
            <td class="text-xs-right">{{ props.item.sub_category }}</td>
            <td class="text-xs-right">{{ props.item.article_type }}</td>
            <td class="text-xs-right">{{ props.item.rank }}</td>
            <td class="text-xs-right">{{ props.item.description }}</td>
            <td class="text-xs-right">{{ props.item.comment }}</td>
          </tr>
        </template>
      </v-data-table>
    </v-card-text>
  </v-card>
</template>

<script>
  export default {
    layout: 'editor',
    data: () => ({
      pagination: {
        sortBy: 'id'
      },
      selected: [],
      headers: [
        { text: 'ID', value: 'id' },
        { text: '作成日時', value: 'date' },
        { text: '希望者', value: 'desire' },
        { text: 'ネタ', value: 'title' },
        { text: 'ネタ元', value: 'idea' },
        { text: 'カテゴリ', value: 'category' },
        { text: 'サブカテゴリ', value: 'sub_category' },
        { text: '記事型', value: 'article_type' },
        { text: '種別', value: 'rank' },
        { text: '説明', value: 'description' },
        { text: 'コメント', value: 'comment' },
      ],
      topic: [
        {
          id: 1,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        },
        {
          id: 2,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        },
        {
          id: 3,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        },
        {
          id: 4,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        },
        {
          id: 5,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        },
        {
          id: 6,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        },
        {
          id: 7,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        },
        {
          id: 8,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        },
        {
          id: 9,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        },
        {
          id: 10,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        },
        {
          id: 11,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        },
        {
          id: 12,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        },
        {
          id: 13,
          desire: '2人',
          date: '2018-09-22',
          title: '家がすごい綺麗になったよ',
          idea: 'ネタ元',
          category: 'DIY',
          sub_category: 'サブカテゴリ',
          article_type: '家周り',
          rank: 'ランク',
          description: '説明',
          comment: 'こめんと'
        }
      ]
    }),

    methods: {
      toggleAll () {
        if (this.selected.length) this.selected = []
        else this.selected = this.topics.slice()
      },
      changeSort (column) {
        if (this.pagination.sortBy === column) {
          this.pagination.descending = !this.pagination.descending
        } else {
          this.pagination.sortBy = column
          this.pagination.descending = false
        }
      }
    }
  }
</script>
