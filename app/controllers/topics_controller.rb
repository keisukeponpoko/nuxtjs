class TopicsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    limit = 20
    page = params[:page] || 1
    topics = Topic.includes([:article, :worker_desire_topic]).offset((page - 1) * limit).limit(limit)
    render json: list_format(topics)
  end

  def show
    topic = Topic.find(params[:id])
    render json: topic
  end

  def new
    render json: Topic.new
  end

  def create
    parameter = params.require(:params).permit(
      :article_type, :category, :comment, :description, :idea, :rank, :sub_category, :title
    )

    topic = Topic.create(parameter)
    if topic.save
      render json: format(topic)
    else
      render json: nil
    end
  end

  def edit
    topic = Topic.find(params[:id])
    render json: topic
  end

  def update
    parameter = params.require(:params).permit(
        :article_type, :category, :comment, :description, :idea, :rank, :sub_category, :title
    )

    topic = Topic.find(params[:id])

    if topic.update(parameter)
      render json: format(topic)
    else
      render json: nil
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    render json: true
  end

  private

  def format(topic)
    data = topic.attributes
    data[:worker_id] = topic.article.nil? ? nil : topic.article[:worker_id]
    data[:article_id] = topic.article.nil? ? nil : topic.article[:id]
    data[:workers] = topic.worker_desire_topic.map(&:worker_id)

    data
  end

  def list_format(topics)
    topics.map do |topic|
      format(topic)
    end
  end
end
