# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


worker_editor1 = Worker.create({ name: 'editor1', is_editor: true })
worker_editor2 = Worker.create({ name: 'editor2', is_editor: true })
worker_editor3 = Worker.create({ name: 'editor3', is_editor: true })

worker_checker1 = Worker.create({ name: 'checker1', is_checker: true })
worker_checker2 = Worker.create({ name: 'checker2', is_checker: true })

worker_admin1 = Worker.create({ name: 'admin1', is_admin: true })
worker_admin2 = Worker.create({ name: 'admin2', is_admin: true })

topic1 = Topic.create({title: 'DIY', idea: '編集部', category: '2.DIY・手作り', sub_category: 'L2枠ネタ', article_type: 'アイデア', rank: ''})
topic2 = Topic.create({title: 'インテリア', idea: '課題C', category: '2.DIY・手作り', sub_category: '', article_type: 'コツ', rank: 'S'})
topic3 = Topic.create({title: '収納', idea: '編集部', category: '1.インテリア', sub_category: '', article_type: '方法/やり方', rank: ''})

WorkerDesireTopic.create({topic_id: topic1[:id], worker_id: worker_editor1[:id]})
WorkerDesireTopic.create({topic_id: topic1[:id], worker_id: worker_editor2[:id]})
WorkerDesireTopic.create({topic_id: topic1[:id], worker_id: worker_editor3[:id]})

articles1 = Article.create({topic_id: topic1[:id], worker_id: worker_editor1[:id], body: 'hoge'})
articles2 = Article.create({topic_id: topic2[:id], worker_id: worker_editor2[:id], body: 'test'})

ArticleDraft.create(article_id: articles1[:id], worker_id: worker_editor1[:id], version: 1, status_id: 1, body: 'uuu')
ArticleDraft.create(article_id: articles1[:id], worker_id: worker_checker1[:id], version: 1, status_id: 2, body: 'eee')
ArticleDraft.create(article_id: articles1[:id], worker_id: worker_admin1[:id], version: 1, status_id: 3, body: 'eee')

ArticleStatus.create(article_id: articles1[:id], status: 1)
ArticleStatus.create(article_id: articles1[:id], status: 2)
ArticleStatus.create(article_id: articles1[:id], status: 3)
