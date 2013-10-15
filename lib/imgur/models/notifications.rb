class Imgur::Client::Notifications < Cistern::Collection
  include Imgur::PagedCollection
  include Imgur::Collection

  model_root 'data'
  model_request :get_notifications

  collection_root 'data'

  def length
    data = connection.get_notifications.body['data']
    data['replies'].length + data['messages'].length
  end

  def replies
    data = connection.get_notifications.body['data']['replies']
    connection.replies.load(data)
  end

  def messages
    data = connection.get_notifications.body['data']['messages']
    connection.messages.load(data)
  end

end
