class Pets

    @@uri = ENV['BASE_URI']

    def criar(body)
        url = @@uri
        response = without_authentication('post', url, body, content_type_value = 'application/json')
    end

    def atualizar(body)
        url = @@uri
        response = without_authentication('put', url, body, content_type_value = 'application/json')
    end

    def deletar(id)
        url = @@uri
        response = without_authentication('delete', "#{url}#{id}", body=nil, content_type_value = 'application/json')
    end

    def buscar(status)
        url = @@uri
        response = without_authentication('get', "#{url}findByStatus?status=#{status}", body=nil, content_type_value = 'application/json')
    end

end