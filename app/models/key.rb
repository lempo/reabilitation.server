class Key < ActiveRecord::Base
after_validation :limit_date, on: :create

private
  def limit_date
    @date = Licencekey.where(:key => self.key)
    if @date.size > 0
       if (@date.first.deadline)
          @limitdate = @date.first.deadline
       else
          @limitdate = @date.first.created_at + 1.years + 1.months
       end
       if (self.endtime > @limitdate)
          self.endtime = @limitdate
       end
       @date.first.update(deadline: self.endtime)
    end
  end
end
