module David::Interop::MandatoryETSI
  class Grape < ::Grape::API
    content_type :txt, 'text/plain'
    default_format :txt

    get :test do
      # Returning 205 here lets Grape clear headers.
      status 200
      nil
    end

    post :test do
      status 201
      nil
    end

    put :test do
      status 204
      nil
    end

    delete :test do
      status 202
      nil
    end

    get 'seg1/seg2/seg3' do
      status 200
      nil
    end

    get 'query' do
      status 200
      nil
    end
  end
end