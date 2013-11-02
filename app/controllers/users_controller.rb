def index
    @users = User.all
end

def show
    @user = User.find(params[:id])
end

def edit
    @user = User.find(params[:id])
end

def create
    @user = Users.new(user_params)

    if @user.save
        redirect_to user_path(@user)
    else
        render :new
    end
end

private

def user_params
    params.require(:user).permit(
        :name, :password)
end