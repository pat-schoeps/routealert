class CheckForAlertJob < ApplicationJob
  queue_as :default

  def perform(route_id, schedule_id)
    route = Route.find_by(id: route_id)
    if !route || route.schedule_id != schedule_id
      return
    end

    dur = 45
    if dur > route.travel_time
      puts "send alert"
    end

    
  end

end
