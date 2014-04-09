module StaticPagesHelper
  def render_cal
    content_tag(:table, class: "box") do
      table = ''.html_safe
      table << content_tag(:thead) do
        head = ''.html_safe
        head << content_tag(:th, style:"width:#{1.0/8.0}%") {"Hours"}
        head << content_tag(:th, style:"width:#{1.0/8.0}%") {"Monday"}
        head << content_tag(:th, style:"width:#{1.0/8.0}%") {"Tuesday"}
        head << content_tag(:th, style:"width:#{1.0/8.0}%") {"Wednesday"}
        head << content_tag(:th, style:"width:#{1.0/8.0}%") {"Thursday"}
        head << content_tag(:th, style:"width:#{1.0/8.0}%") {"Friday"}
        head << content_tag(:th, style:"width:#{1.0/8.0}%") {"Saturday"}
        head << content_tag(:th, style:"width:#{1.0/8.0}%") {"Sunday"}
        head
      end
      table << content_tag(:tbody) do
        body = ''.html_safe
        # (0..1).each do |x|
        #   (1..12).each do |hour|
        #     body << content_tag(:tr) do 
        #       row = ''.html_safe
        #       row << content_tag(:td) {"#{hour}:00"}
        #       (1..7).each do |day|
        #         @show = Show.where("start_day = '#{day}' AND start_time <= ? AND end_time > ?", DateTime.new(2000,01,01,hour + 12*x), DateTime.new(2000,01,01,hour + 12*x))
        #         if @show.any?
        #           row << content_tag(:td, class: "show") {@show[0].title}
        #         else
        #           row << content_tag(:td) {''}
        #         end
        #       end
        #       row
        #     end
        #   end
        # end
        (5..11).each do |hour|
          body << content_tag(:tr) do 
            row = ''.html_safe
            row << content_tag(:td) {"#{hour}:00 am"}
            (1..7).each do |day|
              @show = Show.where("start_day = '#{day}' AND start_time <= ? AND end_time > ?", DateTime.new(2000,01,01,hour), DateTime.new(2000,01,01,hour))
              if @show.any?
                row << content_tag(:td, class: "show") { link_to @show[0].title, @show[0] }
              else
                row << content_tag(:td) {''}
              end
            end
            row
          end
        end
        body << content_tag(:tr) do 
          row = ''.html_safe
          row << content_tag(:td) {"12:00 pm"}
          (1..7).each do |day|
            @show = Show.where("start_day = '#{day}' AND start_time <= ? AND end_time > ?", DateTime.new(2000,01,01,12), DateTime.new(2000,01,01,12))
            if @show.any?
              row << content_tag(:td, class: "show") { link_to @show[0].title, @show[0] }
            else
              row << content_tag(:td) {''}
            end
          end
          row
        end
        (13..23).each do |hour|
          body << content_tag(:tr) do 
            row = ''.html_safe
            row << content_tag(:td) {"#{hour - 12}:00 pm"}
            (1..7).each do |day|
              @show = Show.where("start_day = '#{day}' AND start_time <= ? AND end_time > ?", DateTime.new(2000,01,01,hour), DateTime.new(2000,01,01,hour))
              if @show.any?
                row << content_tag(:td, class: "show") { link_to @show[0].title, @show[0] }
              else
                row << content_tag(:td) {''}
              end
            end
            row
          end
        end
        body << content_tag(:tr) do 
          row = ''.html_safe
          row << content_tag(:td) {"12:00 pm"}
          (1..7).each do |day|
            @show = Show.where("start_day = '#{day}' AND start_time <= ? AND end_time > ?", DateTime.new(2000,01,01,0), DateTime.new(2000,01,01,0))
            if @show.any?
              row << content_tag(:td, class: "show") { link_to @show[0].title, @show[0] }
            else
              row << content_tag(:td) {''}
            end
          end
          row
        end
        (1..4).each do |hour|
          body << content_tag(:tr) do 
            row = ''.html_safe
            row << content_tag(:td) {"#{hour}:00 am"}
            (1..7).each do |day|
              @show = Show.where("start_day = '#{day + 1}' AND start_time <= ? AND end_time > ?", DateTime.new(2000,01,01,hour), DateTime.new(2000,01,01,hour))
              if @show.any?
                row << content_tag(:td, class: "show") { link_to @show[0].title, @show[0] }
              else
                row << content_tag(:td) {''}
              end
            end
            row
          end
        end
        body
      end
      table
    end
  end
end
