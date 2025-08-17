class DashboardsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def show
    # Título y subtítulo de la página
    @page_title = "Dashboard"
    @page_subtitle = "Bienvenido de vuelta, #{current_user.email}"
    
    # Métricas de ejemplo (luego se conectarán con APIs reales)
    @stats = {
      facebook: { 
        impresiones: 15420, 
        clics: 1247, 
        ctr: 8.1, 
        cpc: 0.85,
        gasto: 1059.95,
        cambio: "+12.5%"
      },
      instagram: { 
        impresiones: 23450, 
        clics: 1890, 
        ctr: 8.1, 
        cpc: 0.92,
        gasto: 1738.80,
        cambio: "+8.3%"
      },
      tiktok: { 
        impresiones: 8750, 
        clics: 623, 
        ctr: 7.1, 
        cpc: 1.15,
        gasto: 716.45,
        cambio: "+15.2%"
      },
      google_ads: { 
        impresiones: 45600, 
        clics: 3420, 
        ctr: 7.5, 
        cpc: 1.25,
        gasto: 4275.00,
        cambio: "+6.8%"
      }
    }
    
    # Métricas totales
    @totals = {
      impresiones: @stats.values.sum { |s| s[:impresiones] },
      clics: @stats.values.sum { |s| s[:clics] },
      gasto: @stats.values.sum { |s| s[:gasto] },
      ctr_promedio: (@stats.values.sum { |s| s[:ctr] } / @stats.count).round(1)
    }
    
    # Datos para gráficos
    @chart_data = {
      impresiones: @stats.transform_values { |s| s[:impresiones] },
      clics: @stats.transform_values { |s| s[:clics] },
      gasto: @stats.transform_values { |s| s[:gasto] }
    }
  end
end