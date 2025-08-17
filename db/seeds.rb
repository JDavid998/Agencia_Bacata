User.create!(email: "demo@agencia.local", password: "password123", password_confirmation: "password123") unless User.exists?(email: "demo@agencia.local")

user = User.find_by(email: "demo@agencia.local")

if user.ad_accounts.count == 0
  a = user.ad_accounts.create!(provider: "facebook", account_id: "act_123456", access_token: "FAKE_TOKEN")
  # crea métricas de los últimos 30 días
  require 'date'
  (0..29).each do |i|
    d = Date.today - i
    a.ad_metrics.create!(user: user, date: d, impressions: rand(500..5000), clicks: rand(10..200), spend: rand.round(2))
  end
end

puts "Seed complete. Usuario demo: demo@agencia.local / password123"