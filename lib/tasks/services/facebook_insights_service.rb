# Ejemplo simple (mock) de servicio para obtener métricas de la API de Meta (Facebook/Instagram).
# En producción usarás HTTParty/RestClient y manejarás tokens y paginación.
#
# Usa variables de entorno para APP_ID, APP_SECRET y guarda tokens por AdAccount.
#
# Este archivo muestra la forma de encapsular llamadas a APIs.
class FacebookInsightsService
  require 'net/http'
  require 'json'

  BASE = 'https://graph.facebook.com'

  def initialize(ad_account)
    @ad_account = ad_account
    @access_token = ad_account.access_token
  end

  # Ejemplo que en vez de llamar a la API devuelve datos aleatorios (para desarrollo)
  def fetch_insights_mock(days: 30)
    (0...days).map do |i|
      date = Date.today - i
      {
        date: date,
        impressions: rand(100..5000),
        clicks: rand(1..300),
        spend: (rand * 50).round(2)
      }
    end
  end

  # Ejemplo real (sin manejo de errores ni paginación)
  def fetch_insights_real(ad_account_id, since:, until_date:)
    path = "/v18.0/act_#{ad_account_id}/insights"
    uri = URI("#{BASE}#{path}?fields=impressions,clicks,spend&since=#{since}&until=#{until_date}&access_token=#{@access_token}")
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)
  end
end