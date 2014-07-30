require 'client'

class ConnectionDiagnostic

  attr_accessor :client

  def initialize(client)
    @client = client
  end

  def check_status
    @client.online_status ? "AT#UD" : "Disconnected"
  end
  # perform_diagnostic
  # disconnects the client
  # tries to connect the client 3 times
  # if unsuccessful raise Error
  # if successful sends 'AT#UD' to client (diagnostic message)
  #   and receives from the client the diagnostic info
  #   this info should be accesible on the attribute info


end