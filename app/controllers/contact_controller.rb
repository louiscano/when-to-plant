class ContactController < ApplicationController
  def create
    @prenom = params[:contact][:prenom]
    @nom = params[:contact][:nom]
    @email = params[:contact][:email]
    @message = params[:contact][:message]

    NotifierMailer.simple_message(@prenomn, @nom, @email, @message).deliver_now
    flash[:success] = "Votre message a bien été envoyé !"
    redirect_to contact_index_path
  end
end
