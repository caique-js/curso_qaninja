Dado("que acesso a pagina principal") do
    visit "http://pixel-web:3000/login"
    page.current_window.resize_to(1366, 768)
end
  
Quando("eu submeto minhas credenciais {string} e {string}") do |email, password|
    # O hastag é para buscar um elemento pelo ID (Inspecione o elemento para ver)
    find("#emailId").set email
    find("input[name=password]").set password
    click_button "Entrar"
end
  
Então("devo ser autenticado") do
    logged_user = find(".user .info span").text
    expect(logged_user).to eql "Papito"
end

Quando("eu submeto minhas credenciais com senha inválida") do
    find("#emailId").set "papito@ninjapixel.com"
    find("input[name=password]").set "´pwd123456789"
    click_button "Entrar"
end
  
Então("devo ver uma mensagem de alerta {string}") do |error|
    expect(error).to eql "Usuário e/ou senha inválidos"
end