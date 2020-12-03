require_relative '../app/pets.rb'
require_relative '../spec/supports/factories/pet_factory.rb'

describe 'Pets Store' do

    subject (:pets) {Pets.new}

    context 'CRUD - Pets' do

        it 'Cadastro de pet'do
            body =  FactoryBot.attributes_for(:Pets).to_json
            resultado = pets.criar(body)
            expect(resultado.code).to eq(200)
            expect(resultado['status']).to eq('available')
        end

        it 'Atualizar cadastro de pet' do
            bodyCadastro = FactoryBot.attributes_for(:Pets).to_json
            resultCadastro = pets.criar(bodyCadastro)
            id = resultCadastro['id']

            bodyAtualizar = FactoryBot.attributes_for(:Pets, id: id, name: 'Leopardo' ).to_json
            resultado = pets.atualizar(bodyAtualizar)
            expect(resultado.code).to eq(200)
            expect(resultado['name']).to eq('Leopardo')
            expect(resultado['status']).to eq('available')
        end

        it 'Deletar cadastro de pet' do
            bodyCadastro = FactoryBot.attributes_for(:Pets).to_json
            resultCadastro = pets.criar(bodyCadastro)
            id = resultCadastro['id']

            resultado = pets.deletar(id)
            expect(resultado.code).to eq(200)
        end

        it 'Buscar todos os pets com status = available' do
            resultado = pets.buscar('available')
            expect(resultado.code).to eq(200)
           
            for pet in resultado
                status = pet['status']
                expect(status).to eq('available')
            end
        end

    end
end