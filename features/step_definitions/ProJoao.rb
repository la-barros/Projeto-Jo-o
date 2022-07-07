

Dado('que o usuario consulte informações de fucncionario') do
    @get_list = Projoao_requests.new 
  end
  
Quando('ele realizar a pesquisa') do
   @list_projoao = @get_list.find_projoao 
  end
  
Então('uma lista de funcionarios deve retornar') do
    expect(@list_projoao.code).to eql 200
    expect(@list_projoao.message).to eql 'OK'
  end

  Dado('que o usuario cadatre um novo funcionario') do                           
    @create = Projoao_requests.new
    #@assert = Assertions.new 
  end                                                                            
                                                                                 
  Quando('ele enviar as informações do funcionario') do                          
    @create_projoao = @create.create_projoao(@userId, @id, @title, @body) #(DATABSE[:name][:name6], DATABASE[:salary][:salary6], DATABASE[:age][:age6])
    puts @create_projoao  
  end                                                                            

  Então('esse funcionario sera cadastrado') do    
    #@assert.request_success(@create_proJoao.code, @create_ProJoao.message) 
    expect(@create_projoao.code).to eql (201)
    expect(@create_projoao.msg).to eql 'Created'
    expect(@create_projoao.parsed_response["userId"]).to eql DATABASE[:userId][:userId1]
    expect(@create_projoao.parsed_response["id"]).to eql DATABASE[:id][:id1]
    expect(@create_projoao.parsed_response["title"]).to eql DATABASE[:title][:title1]
    expect(@create_projoao.parsed_response["body"]).to eql DATABASE[:body][:body1]
  end   
  
  Dado('que o usuario altere uma informação de funcionario') do                   
    @request = Projoao_requests.new    
  end                                                                             
                                                                                  
  Quando('ele enviar as novas informações') do                                    
    @update_projoao = @request.update_projoao(@userId, @id, @title, @body)  #(DATABSE[:name][:name6], DATABASE[:salary][:salary6], DATABASE[:age][:age6])
    puts @update_projoao       
  end

  Então('as informações serão alteradas') do
    expect(@update_projoao.code).to eql (200)
    expect(@update_projoao.msg).to eql 'OK'
    expect(@update_projoao.parsed_response["userId"]).to eql 1
    expect(@update_projoao.parsed_response["id"]).to eql 10
    expect(@update_projoao.parsed_response["title"]).to eql 'Teste Sandro'
    expect(@update_projoao.parsed_response["body"]).to eql 'Body teste Sandro10'
  end

  Dado('que o usuario queira deletar um funcionario') do
    @request = Projoao_requests.new 
  end
  
  Quando('ele enviar a identificação unica') do
    @delete_projoao = @request.delete_projoao(@id)  #(DATABSE[:name][:name6], DATABASE[:salary][:salary6], DATABASE[:age][:age6])
    puts @delete_projoao 
  end
  
  Então('esse funcionario sera deletado do sistema') do
    expect(@delete_projoao.code).to eql (200)
    expect(@delete_projoao.msg).to eql 'OK'
    #expect(@delete_employee["status"]).to eql 'success'
    #expect(@delete_employee["message"]).to eql 'Successfully! Record has been deleted'
    #expect(@delete_projoao["data"]).to eql '1'  
  end
