class Job < ApplicationRecord
  belongs_to :client
  belongs_to :preparer
  has_one :payment
  enum fed_form: [:Individual_1040, :S_Corp_1120S, :Partnership_1065, :C_Corp_1120, :Non_Profit_990, :Trust_1041, :Estate_706, :other]
  enum status: [:made_contact, :todo, :waiting_on_info, :confirm_with_client, :appointment_scheduled, :sent_for_signatures, :received_signatures, :filed, :ack, :paid, :done, :extended]

end
