class Pets

    def criar(body)
        url = 'https://petstore.swagger.io/v2/pet'
        response = without_authentication('post', url, body, content_type_value = 'application/json')
    end

    def atualizar(body)
        url = 'https://petstore.swagger.io/v2/pet'
        response = without_authentication('put', url, body, content_type_value = 'application/json')
    end

    def deletar(id)
        url = 'https://petstore.swagger.io/v2/pet/'
        response = without_authentication('delete', "#{url}#{id}", body=nil, content_type_value = 'application/json')
    end

end