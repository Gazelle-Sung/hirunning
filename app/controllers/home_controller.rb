class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    
  end
  
  def main
    @users = User.all
    @user_ranks = User.order('participation DESC').limit(3)
    @fixed_recents = Fixedrunninginfo.order('created_at DESC').limit(3)
    @attend_lists = Fixedrunning.all
    @marathoninfos = Marathoninfo.order('created_at DESC').limit(3)
  end
  
  def fixed_run_info
    @new_fixed_run_info = Fixedrunninginfo.new
    @new_fixed_run_info.date = params[:date]
    @new_fixed_run_info.startlocation = params[:run_location]
    @new_fixed_run_info.time = params[:time]
    @new_fixed_run_info.meetlocation = params[:gathring_location]
    @new_fixed_run_info.content = params[:content]
    @new_fixed_run_info.save
    
    redirect_to '/main'
  end
  
  def add_member
    @new_user = User.new
    @new_user.name = params[:user_name]
    @new_user.grade = params[:grade]
    @new_user.major = params[:major]
    @new_user.participation = 0
    @new_user.save
    
    redirect_to '/main'
  end
  
  def add_marathoninfo
    @new_marathoneinfo = Marathoninfo.new
    @new_marathoneinfo.name = params[:maraton_name]
    @new_marathoneinfo.price = params[:price]
    @new_marathoneinfo.area = params[:location]
    @new_marathoneinfo.date = params[:date]
    @new_marathoneinfo.site = params[:site_link]
    @new_marathoneinfo.save
    
    redirect_to '/main'
  end
  
  def user_reset
    @all_users = User.all
    user_count = 0
    while(true)
      if( @all_users.length > user_count)
        @all_users[user_count].participation = 0
        @all_users[user_count].save
        user_count = user_count+1
      else
        break;
      end
    end
    
    redirect_to '/main'
  end
  
  
  
  def check_attendance
    @fixed_info = Fixedrunninginfo.find(params[:id])
    @already_done_user = Fixedrunning.where('date = ? AND description = ?', @fixed_info.date, @fixed_info.content)
    @users = User.all
  end
  
  def check
    @tag_ids = params[:tag_ids]
    @fixed_run_date = params[:fixed_run_date]
    @fixed_run_content = params[:fixed_run_content]
    
    i = 0
    while(true)
      if @tag_ids.length > i
        @new_fixedrunning_attend = Fixedrunning.new
        @new_fixedrunning_attend.user_id = @tag_ids[i].to_i
        @new_fixedrunning_attend.date = @fixed_run_date
        @new_fixedrunning_attend.description = @fixed_run_content
        @new_fixedrunning_attend.save
        
        @attend_user = User.find(@tag_ids[i].to_i)
        @attend_user.participation = @attend_user.participation + 1
        @attend_user.save
        i=i+1
      else
        break;
      end
    end
    
    redirect_to '/main'
  end
end
