import axios from 'axios'
import Vue from 'vue'

export const state = () => ({
  list: []
})

export const actions = {
  async fetch ({ commit }) {
    const { data } = await axios.get('http://localhost:3000/topics/')
    commit('fetch', data)
  },
  async store ({ commit }, params) {
    const { data } = await axios.post('http://localhost:3000/topics/', params)
    if (data) {
      commit('store', data)
    }
  },
  async update ({ commit, state }, {params, index}) {
    const id = state.list[index].id
    const { data } = await axios.put('http://localhost:3000/topics/' + id, {params: params})
    if (data) {
      commit('update', {topic: data, index: index})
    }
  }
}

export const mutations = {
  fetch (state, topics) {
    state.list = topics
  },
  store (state, topic) {
    state.list.push(topic)
  },
  update (state, {topic, index}) {
    Vue.set(state.list, index, topic)
  },
  updateWorker (state, index) {
    const topic = state.list[index]
    topic.worker_id = 2
    topic.article_id = 2
    Vue.set(state.list, index, topic)
  }
}
