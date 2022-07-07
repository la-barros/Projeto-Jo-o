class Projoao_requests
   
    def find_projoao
       ProJoao.get('/?userId=1')
    end


    def create_projoao(userId , id , title , body)
      ProJoao.post('/posts', body: {
        "userId": DATABASE[:userId][:userId1],
        "id": DATABASE[:id][:id1],
        "title": DATABASE[:title][:title1],
        "body": DATABASE[:body][:body1]
      }.to_json)
    end

    def update_projoao(userId, id, title, body) #(metodos)
      id = DATABASE[:id][:id5]
      ProJoao.put('/posts/' + id.to_s, body: {
      "userId": 1, #DATABASE[:userId][:userId2],
      "id": id,
      "title": "Teste Sandro", #DATABASE[:title][:title2],
      "body": "Body teste Sandro10" #DATABASE[:body][:body2]
       }.to_json)
       end

    def delete_projoao (id)
       ProJoao.delete ('/posts/1')
  end
end 

