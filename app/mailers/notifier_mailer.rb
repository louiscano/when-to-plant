class NotifierMailer < ApplicationMailer
  default to: 'louis.cano@hotmail.fr',
    from: "mailtrap@demomailtrap.com"

  def simple_message(prenom, nom, email, message)
    mail(
      'reply-to': email_address_with_name(email, "#{prenom} #{nom}"),
      subject: "Nouveau message via le formulaire de contact",
      body: message
    )
  end
end
