require 'rails_helper'

RSpec.describe TripsController, type: :controller do

  let(:user) {
    FactoryGirl.create(:user)
  }

  let(:manager) {
    FactoryGirl.create(:manager)
  }

  let(:admin) {
    FactoryGirl.create(:admin)
  }

  let(:valid_attributes) {
    FactoryGirl.build(:trip).attributes.symbolize_keys
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:invalid_trip).attributes.symbolize_keys
  }

  let(:valid_session) { {} }

  describe "Authorization with role : user" do
    describe "GET #index" do
      it "response unauthorized for normal user" do
        valid_attributes[:user] = user
        trip = Trip.create! valid_attributes
        request.headers['Authorization'] =  trip.user.auth_token
        get :index, {}, valid_session
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "assigns the requested trip as @trip" do
        valid_attributes[:user] = user
        trip = Trip.create! valid_attributes
        request.headers['Authorization'] =  trip.user.auth_token
        get :show, {:id => trip.to_param}, valid_session
        expect(assigns(:trip)).to eq(trip)
        expect(trip.user.id).to eq(user.id)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Trip" do
          valid_attributes[:user] = user
          request.headers['Authorization'] =  user.auth_token
          expect {
            post :create, {trip: valid_attributes}, valid_session
          }.to change(Trip, :count).by(1)
        end

        it "assigns a newly created trip as @trip" do
          valid_attributes[:user] = user
          request.headers['Authorization'] =  user.auth_token
          post :create, {:trip => valid_attributes}, valid_session
          expect(assigns(:trip)).to be_a(Trip)
          expect(assigns(:trip)).to be_persisted
        end

        it "responds created status 201" do
          valid_attributes[:user] = user
          request.headers['Authorization'] =  user.auth_token
          post :create, {:trip => valid_attributes}, valid_session
          expect(response).to have_http_status(:created)
        end
      end

      context "with invalid params" do
        it "does not assigns newly created as authorization header missing" do
          post :create, {trip: invalid_attributes}, valid_session
          expect(assigns(:trip)).to be_nil
        end

        it "responds unauthorized status 401" do
          post :create, {:trip => invalid_attributes}, valid_session
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {destination: 'India'}
        }

        it "updates the requested trip" do
          valid_attributes[:user] = user
          request.headers['Authorization'] =  user.auth_token
          trip = Trip.create! valid_attributes
          put :update, {:id => trip.to_param, :trip => new_attributes}, valid_session
          trip.reload
          expect(trip.destination).to eq('India')
        end

        it "assigns the requested trip as @trip" do
          valid_attributes[:user] = user
          request.headers['Authorization'] =  user.auth_token
          trip = Trip.create! valid_attributes
          put :update, {:id => trip.to_param, :trip => valid_attributes}, valid_session
          expect(assigns(:trip)).to eq(trip)
        end

        it "responds created status 200" do
          valid_attributes[:user] = user
          request.headers['Authorization'] =  user.auth_token
          trip = Trip.create! valid_attributes
          put :update, {:id => trip.to_param, :trip => valid_attributes}, valid_session
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested trip" do
        valid_attributes[:user] = user
        request.headers['Authorization'] =  user.auth_token
        trip = Trip.create! valid_attributes
        expect {
          delete :destroy, {:id => trip.to_param}, valid_session
        }.to change(Trip, :count).by(-1)
      end

      it "responds created status 200" do
        valid_attributes[:user] = user
        request.headers['Authorization'] =  user.auth_token
        trip = Trip.create! valid_attributes
        delete :destroy, {:id => trip.to_param}, valid_session
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "Authorization with role : admin" do
    describe "GET #index" do
      it "assigns all trips as @trips" do
        trip = Trip.create! valid_attributes
        request.headers['Authorization'] = admin.auth_token
        get :index, {}, valid_session
        expect(assigns(:trips)).to eq([trip])
      end
    end

    describe "GET #show" do
      it "assigns the requested trip as @trip" do
        trip = Trip.create! valid_attributes
        request.headers['Authorization'] = admin.auth_token
        get :show, {:id => trip.to_param}, valid_session
        expect(assigns(:trip)).to eq(trip)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Trip" do
          request.headers['Authorization'] = admin.auth_token
          expect {
            post :create, {trip: valid_attributes}, valid_session
          }.to change(Trip, :count).by(1)
        end

        it "assigns a newly created trip as @trip" do
          request.headers['Authorization'] =  admin.auth_token
          post :create, {:trip => valid_attributes}, valid_session
          expect(assigns(:trip)).to be_a(Trip)
          expect(assigns(:trip)).to be_persisted
        end

        it "responds created status 201" do
          request.headers['Authorization'] = admin.auth_token
          post :create, {:trip => valid_attributes}, valid_session
          expect(response).to have_http_status(:created)
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {destination: 'India'}
        }

        it "updates the requested trip" do
          request.headers['Authorization'] =  admin.auth_token
          trip = Trip.create! valid_attributes
          put :update, {:id => trip.to_param, :trip => new_attributes}, valid_session
          trip.reload
          expect(trip.destination).to eq('India')
        end

        it "assigns the requested trip as @trip" do
          request.headers['Authorization'] =  admin.auth_token
          trip = Trip.create! valid_attributes
          put :update, {:id => trip.to_param, :trip => valid_attributes}, valid_session
          expect(assigns(:trip)).to eq(trip)
        end

        it "responds created status 200" do
          request.headers['Authorization'] =  admin.auth_token
          trip = Trip.create! valid_attributes
          put :update, {:id => trip.to_param, :trip => valid_attributes}, valid_session
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested trip" do
        request.headers['Authorization'] =  admin.auth_token
        trip = Trip.create! valid_attributes
        expect {
          delete :destroy, {:id => trip.to_param}, valid_session
        }.to change(Trip, :count).by(-1)
      end

      it "responds created status 200" do
        request.headers['Authorization'] =  admin.auth_token
        trip = Trip.create! valid_attributes
        delete :destroy, {:id => trip.to_param}, valid_session
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "Authorization with role : user manager" do
    describe "GET #index" do
      it "response unauthorized for user manager" do
        trip = Trip.create! valid_attributes
        request.headers['Authorization'] = manager.auth_token
        get :index, {}, valid_session
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "response unauthorized for user manager" do
        trip = Trip.create! valid_attributes
        request.headers['Authorization'] = manager.auth_token
        get :show, {:id => trip.to_param}, valid_session
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe "POST #create" do
      it "trip created with user as manager and not the User specified" do
        request.headers['Authorization'] = manager.auth_token
        post :create, {trip: valid_attributes}, valid_session
        expect(assigns(:trip).user).to eq(manager)
      end
    end

    describe "PUT #update" do
      let(:new_attributes) {
        {destination: 'India'}
      }

      it "response unauthorized for user manager" do
        valid_attributes[:user] = user
        request.headers['Authorization'] =  user.auth_token
        trip = Trip.create! valid_attributes
        request.headers['Authorization'] =  manager.auth_token
        put :update, {:id => trip.to_param, :trip => new_attributes}, valid_session
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe "DELETE #destroy" do
      it "response unauthorized for user manager" do
        valid_attributes[:user] = user
        request.headers['Authorization'] =  user.auth_token
        trip = Trip.create! valid_attributes
        request.headers['Authorization'] =  manager.auth_token
        delete :destroy, {:id => trip.to_param}, valid_session
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

end
