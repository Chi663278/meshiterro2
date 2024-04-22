class Admin::DashboardsController < ApplicationController
  layout 'admin' #layoutを適用（admin.html/erb）
  before_action :authenticate_admin!
  def index
    @users = User.all
  end
end
