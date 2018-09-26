class TopicsController < ApplicationController
  def index
    limit = 20
    page = params[:page] || 1
    topics = Topic.includes([:article, :worker_desire_topic]).offset((page - 1) * limit).limit(limit)
    render json: format(topics)
  end

  def show
    topic = Topic.find(params[:id])
    render json: topic
  end

  def new
    render json: Topic.new
  end

  def create
    topic = Topic.create(params)
    if topic.save
      render json: true
    else
      render json: false
    end
  end

  def edit
    topic = Topic.find(params[:id])
    render json: topic
  end

  def update
    topic = Topic.find(params[:id])

    if topic.update(params)
      render json: true
    else
      render json: false
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    render json: true
  end

  private

  def format(topics)
    topics.map do |topic|
      data = topic.attributes
      data[:worker_id] = topic.article.nil? ? nil : topic.article[:worker_id]
      data[:article_id] = topic.article.nil? ? nil : topic.article[:id]
      data[:workers] = topic.worker_desire_topic.map(&:worker_id)

      data
    end
  end
end
