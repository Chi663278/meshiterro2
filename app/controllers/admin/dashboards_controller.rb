class Admin::DashboardsController < ApplicationController
  layout 'admin' #layoutを適用（admin.html/erb）
  def index
    @users = User.all
  end
end
