json.extract! spdm_user, :id, :first_name, :last_name, :email, :phone, :twitter, :created_at, :updated_at
json.url spdm_user_url(spdm_user, format: :json)
