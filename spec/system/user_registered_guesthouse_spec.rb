require 'rails_helper'

describe "user register guesthouse" do
  context "and see the registration form" do
    it "after create user" do
      # Arrange
  
      # Act
      visit root_path
      click_on "Entrar / Cadastrar"
      click_on "Criar conta"
      fill_in "E-mail",	with: "moisesAlmeida@hotmail.com"
      fill_in "Senha",	with: "32415mo"
      fill_in "Confirme sua senha",	with: "32415mo"
      click_on "Salvar"
  
      # Assert
      expect(page).to have_field('Nome')
      expect(page).to have_field('Razão social')
      expect(page).to have_field('Telefone')
      expect(page).to have_field('E-mail')
      expect(page).to have_field('Endereço')
      expect(page).to have_field('Bairro')
      expect(page).to have_field('Estado')
      expect(page).to have_field('Cidade')
      expect(page).to have_field('CEP')
      expect(page).to have_field('Meios de pagamento')
      expect(page).to have_field('Aceita pets')
      expect(page).to have_field('Políticas')
      expect(page).to have_field('Check-in')
      expect(page).to have_field('Check-out')
    end

    it "after login" do
      # Arrange
      Owner.create!(email: "moisesAlmeida@hotmail.com", password: "32415mo")
  
      # Act
      visit root_path
      click_on "Entrar / Cadastrar"
      fill_in "E-mail",	with: "moisesAlmeida@hotmail.com" 
      fill_in "Senha",	with: "32415mo"
      within ".actions" do
        click_on "Entrar"
      end
  
      # Assert
      expect(page).to have_field('Nome')
      expect(page).to have_field('Razão social')
      expect(page).to have_field('Telefone')
      expect(page).to have_field('E-mail')
      expect(page).to have_field('Endereço')
      expect(page).to have_field('Bairro')
      expect(page).to have_field('Estado')
      expect(page).to have_field('Cidade')
      expect(page).to have_field('CEP')
      expect(page).to have_field('Meios de pagamento')
      expect(page).to have_field('Aceita pets')
      expect(page).to have_field('Políticas')
      expect(page).to have_field('Check-in')
      expect(page).to have_field('Check-out')
    end
  end
  
  context "with successfully" do
    it "after create user" do
      # Arrange
  
      # Act
      visit root_path
      click_on "Entrar / Cadastrar"
      click_on "Criar conta"

      fill_in "E-mail",	with: "moisesAlmeida@hotmail.com" 
      fill_in "Senha",	with: "32415mo"
      fill_in "Confirme sua senha",	with: "32415mo"
      click_on "Salvar"

      fill_in 'Nome', with: 'Seu Zé'
      fill_in 'Razão social', with: 'Pousada Seu Zé'
      fill_in 'Telefone', with: '79 9 8876-9032'
      fill_in 'CNPJ', with: '82.831.667/0001-09'
      fill_in 'E-mail', with: 'seuemail@example.com'
      fill_in 'Endereço', with: 'Rua Alemedo, 89'
      fill_in 'Bairro', with: 'João Pessoa'
      fill_in 'Estado', with: 'Rio de Janeiro'
      fill_in 'Cidade', with: 'Del Vale'
      fill_in 'CEP', with: '54198-900'
      fill_in 'Meios de pagamento', with: 'Cartão, Pix e Boleto'
      check 'Aceita pets'
      fill_in 'Políticas', with: 'Suas Políticas'
      fill_in 'Check-in', with: '08:00 AM'
      fill_in 'Check-out', with: '12:00 PM'

      click_on "Salvar"
  
      # Assert
      expect(page).to have_content 'Pousada cadastrada com sucesso'
      expect(current_path).to eq(root_path)
      expect(Owner.last.guesthouse.id).to eq(Guesthouse.last.id)
    end

    it "after login" do
      # Arrange
      Owner.create!(email: "moisesAlmeida@hotmail.com", password: "32415mo")
  
      # Act
      visit root_path
      click_on "Entrar / Cadastrar"
      fill_in "E-mail",	with: "moisesAlmeida@hotmail.com" 
      fill_in "Senha",	with: "32415mo"
      within ".actions" do
        click_on "Entrar"
      end
      fill_in 'Nome', with: 'Seu Zé'
      fill_in 'Razão social', with: 'Pousada Seu Zé'
      fill_in 'Telefone', with: '79 9 8876-9032'
      fill_in 'CNPJ', with: '82.831.667/0001-09'
      fill_in 'E-mail', with: 'seuemail@example.com'
      fill_in 'Endereço', with: 'Rua Alemedo, 89'
      fill_in 'Bairro', with: 'João Pessoa'
      fill_in 'Estado', with: 'Rio de Janeiro'
      fill_in 'Cidade', with: 'Del Vale'
      fill_in 'CEP', with: '54198-900'
      fill_in 'Meios de pagamento', with: 'Cartão, Pix e Boleto'
      check 'Aceita pets'
      fill_in 'Políticas', with: 'Suas Políticas'
      fill_in 'Check-in', with: '08:00 AM'
      fill_in 'Check-out', with: '12:00 PM'
      click_on "Salvar"
  
      # Assert
      expect(page).to have_content 'Pousada cadastrada com sucesso'
      expect(current_path).to eq(root_path)
    end
  end
end
