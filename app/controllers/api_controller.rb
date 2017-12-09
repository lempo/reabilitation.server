class ApiController < ApplicationController
respond_to :html, :xml

  def loginspec
    @spec = Specialist.where(:name => params[:name], :pass => params[:pass], :key => params[:key])
    if @spec.count == 0
       @spec = Specialist.where(:name => params[:name], :pass => params[:pass])
    end
    respond_with(@spec.count.to_s)
  end

  def loginpatient
    @pat = Patient.where(:name => params[:name], :pass => params[:pass], :key => params[:key])
    if @pat.count == 0
       @pat = Patient.where(:name => params[:name], :pass => params[:pass])
    end
    respond_with(@pat.count.to_s)
  end

  def listpatients
    @pats = Patient.where(:key => params[:key])
    respond_with(@pats)
  end

  def newpatient
    @pat = Patient.where(:name => params[:name], :pass => params[:pass], :key => params[:key])
    if @pat.count != 0
       respond_with(1.to_s)
    else
       Patient.create(:name => params[:name], :pass => params[:pass], :key => params[:key])
       respond_with(0.to_s)
    end
  end

  def newspec
   @spec = Specialist.create(:name => params[:name], :pass => params[:pass], :key => params[:key])
   # for resulsts store
   Patient.create(:name => params[:name], :pass => params[:pass], :key => params[:key])
   respond_with(@spec)
  end

  def deletepatient
   @pat = Patient.where(:name => params[:name], :pass => params[:pass], :key => params[:key])
   if @pat.count == 0
      @pat = Patient.where(:name => params[:name], :pass => params[:pass])
   end
   @count = @pat.size
   @pat.destroy_all
   respond_with(@count.to_s)
  end

  def editpatient
    @pat = Patient.where(:name => params[:name], :pass => params[:pass], :key => params[:key]).first
    @count = Patient.where(:name => params[:name_new], :pass => params[:pass_new], :key => params[:key]).count
    if @count != 0
       respond_with(1.to_s)
    else
       Patient.update(@pat.id, :name => params[:name_new], :pass => params[:pass_new]);
       respond_with(0.to_s)
    end
  end

  def addresult
   @pat = Patient.where(:name => params[:name], :pass => params[:pass], :key => params[:key])
   if @pat.count == 0
      @pat = Patient.where(:name => params[:name], :pass => params[:pass])
   end
   if (@pat.count == 0)
      Patient.create(:name => params[:name], :pass => params[:pass], :key => params[:key])
      @pat = Patient.where(:name => params[:name], :pass => params[:pass], :key => params[:key])
   end
   @task = Task.where(:name => params[:task_name]).first
   @res = @pat.first.results.build(:task => @task, :date => Date.today, :result => params[:result])
   @res.save
   respond_with(@res)
  end

  def findresults
   @pat = Patient.where(:name => params[:name], :pass => params[:pass], :key => params[:key]) 
   if @pat.count == 0
      @pat = Patient.where(:name => params[:name], :pass => params[:pass])
   end
   if @pat.count == 0
      respond_with("")
   else
      @res = Result.where(:patient_id => @pat.first.id)
      respond_with(@res)
   end
  end

  def findtaskgroup
   @task = Task.where(:id => params[:id]).first
   @group = Group.where(:id => @task.group_id).first
   respond_with(@group)
  end

  def findtaskname
   @task = Task.where(:id => params[:id]).first
   respond_with(@task)
  end

  def groupexists
    @group = Group.where(:name => params[:name])
    @count = @group.size
    respond_with(@count.to_s)
  end

  def taskexists
    @task = Task.where(:name => params[:name])
    @count = @task.size
    respond_with(@count.to_s)
  end

  def getversion
    @date = Date.strptime(params[:date], '%d.%m.%Y')
    @ver = Version.all.order(:date).last
    if @ver.date > @date
      respond_with(@ver)
    else
      respond_with(0.to_s)
    end
  end

  def addversion
    @date = Date.strptime(params[:date], '%d.%m.%Y')
    @ver = Version.create(:date => @date, :version => params[:version], :location => params[:location])
    respond_with(@ver)
  end

  def addtask
   @group = Group.where(:name => params[:group_name]).first
   @task = Task.create(:name => params[:name])
   @group.tasks << @task
   respond_with(@task)
  end

  def addgroup
   @group = Group.create(:name => params[:name])
   respond_with(@group)
  end

  def addlicence
   @key = Licencekey.create(:key => params[:key])
   respond_with(@key)
  end

  def getdays
   @key = Key.where(:key => params[:key], :username => params[:user_name], :hddserial => params[:hdd_serial])
   if @key.size != 1
     respond_with(0.to_s)
   elsif @key.first.endtime < Date.today
     respond_with(0.to_s)
   else
     @diff = @key.first.endtime - Date.today
     respond_with(@diff.to_s)
   end
  end

  def getfrom
   @key = Key.where(:key => params[:key], :username => params[:user_name], :hddserial => params[:hdd_serial])
   if @key.size != 1
     respond_with(0.to_s)
   else
     respond_with(@key.first.starttime.to_s)
   end
  end

  def checkkey
   @key = Key.where(:key => params[:key], :username => params[:user_name], :hddserial => params[:hdd_serial])
   if @key.size != 1
     respond_with(2.to_s)
   elsif @key.first.endtime > Date.today
     respond_with(1.to_s)
   else
     respond_with(3.to_s)
   end
  end

  def registerkey
   @test = Key.where(:key => params[:key])
   if @test.size != 0
     respond_with(2.to_s)
   elsif Licencekey.where(:key => params[:key]).size == 0 then
     respond_with(3.to_s)
   else
     Key.create(:key => params[:key], :username => params[:user_name], :hddserial => params[:hddserial], :starttime => Date.today, :endtime => Date.today + 1.years)
     Specialist.create(:name => params[:name], :pass => params[:pass], :key => params[:key])
     respond_with(1.to_s)
   end
  end
end
