RSpec.describe TinyUrlsController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_successful
      expect(response.code).to eq('200')
    end
  end

  describe 'POST #create' do
    context 'with a url' do
      let(:url) { 'www.google.com' }
      subject { post :create, params: { tiny_url: { original_url: url } } }

      it 'creates a new tiny url record' do
        expect { subject }.to change(TinyUrl, :count).by 1
        expect(flash[:notice]).to eq 'Successfully created an tiny url!'
        expect(TinyUrl.first.original_url).to eq url
      end
    end

    context 'with blank url' do
      let(:url) { '' }
      subject { post :create, params: { tiny_url: { original_url: url } } }

      it 'returns an error' do
        subject
        expect { subject }.to_not change(TinyUrl, :count)
        expect(flash[:alert]).to eq 'You must provide a URL.'
        expect(response).to redirect_to root_path(original_url: url)
      end
    end
  end

  describe 'GET #info' do
    context 'with a url' do
      let(:tiny_url) { create(:tiny_url) }

      subject { get :info, params: { use_route: "#{tiny_url.mini_url}/info", mini_url: tiny_url.mini_url } }

      it 'displays info for the tiny url' do
        subject
        expect(assigns(:tiny_url)).to eq tiny_url
        expect(response).to render_template :info
      end
    end

    context 'with an invalid url' do
      subject { get :info, params: { use_route: '/info', mini_url: '' } }

      it 'redirects to index with an error message' do
        subject

        expect(flash[:alert]).to eq 'URL not found.'
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET #show' do
    let(:tiny_url) { create(:tiny_url) }

    subject { get :show, params: { use_route: '/show', mini_url: tiny_url.mini_url } }

    it 'creates a url visitor record and redirects to the original url' do
      expect { subject }.to change(UrlVisitor, :count).by 1

      expect(response).to redirect_to tiny_url.formatted_original_url
    end
  end
end
