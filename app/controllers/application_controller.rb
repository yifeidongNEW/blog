class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end


def not_found
  raise ActionController::RoutingError.new('Not Found')
end

def render_response_status_page(status_id)
  if status_id.to_s == "404" then
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  else
    # todo 针对422、500等其他状态进行异常处理
    respond_to do |format|
      format.html { render :file =>  "#{Rails.root}/public/{status_id}", layout => false, status: status_id }
      format.all { render nothing: true, status: status_id }
    end
  end
end