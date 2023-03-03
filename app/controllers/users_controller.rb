class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    result = Users::SearchUsers.call(params: params)
    @users = result.users
    respond_to do |format|
      format.json { render json: UserSerializer.new(@users).serializable_hash }
      format.html
    end
  end

  def search
    render :action => :index
  end
  def new
    @user = User.new
    @user.build_address
    @user.build_bank
    @user.build_company
    @user.company.build_address
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    result = Users::GetUsers.call(id: params[:id])
    if result.success?
      respond_to do |format|
        format.json { render json: UserSerializer.new(result.user) }
        format.html
      end
    else
      render json: { error: result.message }, status: :unprocessable_entity
    end
  end

  def create
    result = Users::CreateUser.call(attributes: user_params)
    @user = result.user
    respond_to do |format|
      if result.success?
        format.json { render json: UserSerializer.new(@user) }
        format.turbo_stream
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("user_form", partial: "components/form", locals: { user: @user, message: result.message }), status: :unprocessable_entity }
        format.json { render json: { error: result.message, status: :unprocessable_entity }, status: :unprocessable_entity }
      end
    end
  end

  def update
    result = Users::UpdateUser.call(id: params[:id], attributes: user_params)
    @user = result.user
    respond_to do |format|
      if result.success?
        format.json { render json: ::UserSerializer.new(@user) }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@user, partial: "users/user", locals: { user: @user, message: result.message }) }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("user_form", partial: "components/form", locals: { user: @user, message: result.message }), status: :unprocessable_entity }
        format.json { render json: { error: result.message, status: :unprocessable_entity }, status: :unprocessable_entity }
      end
    end
  end

  def destroy_multiple
    result = Users::DeleteUsers.call(ids: params[:ids])
    @ids = result.ids
    respond_to do |format|
      if result.success?
        format.json { render json: { message: result.message, status: :ok }, status: :ok }
        format.turbo_stream
      else
        format.turbo_stream
        format.json { render json: { error: result.message, status: :unprocessable_entity }, status: :unprocessable_entity }
      end
    end
  end

  def upload_data
    UploadDummyDataJob.perform_async(params[:skip], params[:limit])
    head :ok
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :maiden_name, :age, :gender, :email,
      :phone, :username, :password, :birth_date, :image, :height,:hair_type,
      :hair_color, :weight, :eye_color, :mac_address, :university, :ein, :ssn, :user_agent,
      address_attributes: [
        :address, :city, :lat, :lng, :postal_code, :state
      ],
      bank_attributes: [
        :card_expire, :card_number, :card_type, :currency, :iban
      ],
      company_attributes: [
        :department, :name, :title,
        address_attributes: [
          :address, :city, :lat, :lng, :postal_code, :state
        ]
      ]
    )
  end
end
