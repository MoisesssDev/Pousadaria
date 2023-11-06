require 'rails_helper'

describe "user is authenticated" do
  it "with sucessfully" do
    # Arrange
    User.create!(email: "moises@teste.com", password: "123456mo", role: User::TYPE_OWNER)
    # Act
    visit root_path
    click_on "Entrar"
    within "form" do
      fill_in "E-mail",	with: "moises@teste.com" 
      fill_in "Senha",	with: "123456mo" 
      click_on "Entrar"
    end

    # Assert
    expect(page).not_to have_content "Entrar"  
    expect(page).to have_button "Sair"
    within "nav" do
      expect(page).to have_content "moises@teste.com"
    end
    expect(page).to have_content "Login efetuado com sucesso"  
  end
  
  it "and log out" do
    # Arrange
    User.create!(email: "moises@teste.com", password: "123456mo", role: User::TYPE_OWNER)
    # Act
    visit root_path
    click_on "Entrar"
    within "form" do
      fill_in "E-mail",	with: "moises@teste.com" 
      fill_in "Senha",	with: "123456mo" 
      click_on "Entrar"
    end
    click_on "Sair"

    # Assert
    expect(page).to have_content "Entrar"  
    expect(page).not_to have_link "Sair"
    within "nav" do
      expect(page).not_to have_content "moises@teste.com"
    end
    expect(page).to have_content "Logout efetuado com sucesso"  
  end

end