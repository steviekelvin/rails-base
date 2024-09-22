class TesteController < ApplicationController
    def index
        getDados
        if @dados
          render json: { success: 'ok', dados: @dados  }, status: :ok
        else
          render json: { success: 'Error', dados: { message: 'Dados não encontrados'}}, status: :not_found
        end
    end

    def getDados
      @dados = {
        'nome': 'Stevie Kelvin',
        'email': 'steviekelvinsilvabarbosa4@gmail.com'
      }

    # crie a implementação do nokogiri
    end
end