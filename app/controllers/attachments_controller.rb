class AttachmentsController < ApplicationController
  include CurrentProject

  def index
    render json: current_transaction.attachments, each_serializer: AttachmentSerializer
  end

  def create
    attachment = current_transaction.attachments.create!(file: decoded_file)
    render json: attachment, serializer: AttachmentSerializer
  end

  def destroy
    attachment = current_transaction.attachments.find(params[:id])
    attachment.delete
    render json: attachment, serializer: AttachmentSerializer
  end

  private
  def current_editing_account
    current_editing_project.accounts.find(params[:account_id])
  end

  def current_transaction
    current_editing_account.transactions.find(params[:transaction_id])
  end

  def decoded_file
    # decode base64 string
    decoded_data = Base64.decode64(params[:file][:base64])
    # create 'file' understandable by Paperclip
    data = StringIO.new(decoded_data)
    data.class_eval do
      attr_accessor :content_type, :original_filename
    end

    # set file properties
    data.content_type = params[:file][:filetype]
    data.original_filename = params[:file][:filename]

    # return data to be used as the attachment file (paperclip)
    data
  end
end
