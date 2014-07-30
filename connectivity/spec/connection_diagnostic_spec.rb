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

  it "Tells the client to disconnect" do

    client = double('client')
    expect(client).to receive(:disconnect)

    connection_diagnostic = ConnectionDiagnostic.new(client)
    connection_diagnostic.disconnect_client
  end

  it "Tries to tell the client to connect" do
    client = double('client')
    allow(client).to receive(:disconnect)
    allow(client).to receive(:online_status)
    expect(client).to receive(:connect).at_least(1).times

    connection_diagnostic = ConnectionDiagnostic.new(client)
    connection_diagnostic.connect_client
  end

  it "Tries to tell the client to connect up to 3 times" do
    client = double('client')
    allow(client).to receive(:disconnect)
    allow(client).to receive(:online_status)
    expect(client).to receive(:connect).at_most(3).times

    connection_diagnostic = ConnectionDiagnostic.new(client)
    connection_diagnostic.connect_client
  end

  it "Tries to tell the client to connect up to 3 times unless it connects" do
    client = double('client')
    allow(client).to receive(:disconnect)
    allow(client).to receive(:online_status)
    expect(client).to receive(:connect).at_most(3).times

    connection_diagnostic = ConnectionDiagnostic.new(client)
    connection_diagnostic.connect_client
  end

  it "Tries to tell the client to connect up to 3 times and connects on the first try" do
    client = double('client')
    allow(client).to receive(:disconnect)
    allow(client).to receive(:online_status).and_return(true, false, false)
    expect(client).to receive(:connect).at_most(1).times

    connection_diagnostic = ConnectionDiagnostic.new(client)
    connection_diagnostic.connect_client
  end

end


