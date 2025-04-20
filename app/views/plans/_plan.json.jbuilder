json.extract! plan, :id, :user_id, :title, :review, :date, :body, :created_at, :updated_at
json.url plan_url(plan, format: :json)
