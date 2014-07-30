require 'spec_helper'

describe ConnectionDiagnostic do

  it "Check that we still know how to do a basic mock" do
    client = double('client')
    allow(client).to receive(:online_status).and_return(false)

    expect(client.online_status).to eql(false)
  end

  it "ConnectionDiagnostic receives a Status" do
    client = Client.new
    connection_diagnostic = ConnectionDiagnostic.new(client)
 
    expect(connection_diagnostic.client).to eq(client)
  end

  it "Is able to see if the Client is Disconnected" do
    client = double('client')
    allow(client).to receive(:online_status).and_return(false)

    connection_diagnostic = ConnectionDiagnostic.new(client)

    expect(connection_diagnostic.check_status).to eq("Disconnected")
  end

    
    it "Is able to see if the Client is connected" do
    client = double('client')
    allow(client).to receive(:online_status).and_return(true)

    connection_diagnostic = ConnectionDiagnostic.new(client)

    expect(connection_diagnostic.check_status).to eq("AT#UD")
  end  


end