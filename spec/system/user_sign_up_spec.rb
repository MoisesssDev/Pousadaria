require 'rails_helper'

describe "User creates account " do

  it "successfully" do
    # Arrange

    # Act
    visit root_path
    click_on "Entrar / Cadastrar"
    click_on "Criar conta"
    fill_in "E-mail",	with: "moisesAlmeida@hotmail.com" 
    fill_in "Senha",	with: "32415mo"
    fill_in "Confirme sua senha",	with: "32415mo"
    select "Dono de Pousada", from: "Tipo"
    click_on "Salvar"

    # Assert
    expect(page).to have_content "Boas vindas! Você criou sua conta com sucesso" 
    expect(page).to have_content "moisesalmeida@hotmail.com"
    expect(User.last.role).to eq(User::TYPE_OWNER)
    expect(page).to have_button "Sair"
  end
  
  it "with incomplete data" do
    # Arrange

    # Act
    visit root_path
    click_on "Entrar / Cadastrar"
    click_on "Criar conta"
    fill_in "E-mail",	with: "" 
    fill_in "Senha",	with: ""
    click_on "Salvar"

    # Assert
    expect(page).to have_content("Não foi possível salvar usuário")
    expect(page).to have_content("E-mail não pode ficar em branco")
    expect(page).to have_content("Senha não pode ficar em branco")

  end
end