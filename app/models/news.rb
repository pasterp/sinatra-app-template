class News
    include DataMapper::Resource

  property :id,               Serial
  property :title,            String, :required => true
  property :body,             Text 
  property :created_at,       DateTime
  property :updated_at,       DateTime
end