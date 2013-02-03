class Admin::BaseController < ApplicationController
  before_filter :authenticate_administrator!
  layout "administration"
end
