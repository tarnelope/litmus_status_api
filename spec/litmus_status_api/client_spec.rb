module LitmusStatusApi
  RSpec.describe Client do
    let(:password) { "password" }
    let(:root_url) { "url" }
    let(:username) { "username" }

    subject { Client.new(username, password, root_url) }

    context 'POST requests' do
      let(:params) { {} }

      describe '#create_status' do
        it "calls #POST on HTTParty with auth" do
          auth = { username: username, password: password }

          expect(HTTParty).to receive(:post).with("#{root_url}/api/v1/status", basic_auth: auth).and_return(true)

          subject.create_status(params)
        end
      end

      describe '#create_message' do
        it "calls #POST on HTTParty with auth" do
          auth = { username: username, password: password }

          expect(HTTParty).to receive(:post).with("#{root_url}/api/v1/status_message", basic_auth: auth).and_return(true)

          subject.create_message(params)
        end
      end
    end

    describe '#get_status' do
      it "calls #GET on HTTParty" do
        expect(HTTParty).to receive(:get).with("#{root_url}/api/v1/status")

        subject.get_status
      end
    end
  end
end
