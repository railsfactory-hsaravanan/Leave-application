class MessageController < ApplicationController

  def index
  
  end

  def create

  end

  def login
  @sign=Apple.new(params[:data])
  @sign.save
  end

  def view
  @val=params[:data][:logid]
  @val1=params[:data][:pwd]
  @log=Apple.find_by_logid(@val)
  $a=@log.id
  unless @log.nil?
     if ((@val==@log.logid) && (@val1==@log.pwd)) 
	$loginname=@log.name
     redirect_to :action =>"msg"
     else
     redirect_to :action=>"invalid"
     end
  else
     redirect_to :action=>"invalid"
  end
  end

   def invalid

   end

   def reply
   
   end

   def msg
   @v=$a
   @messages=Orange.find_all_by_name($loginname)	
   @count=@messages.length
   end
   
   def show
   @id=params[:id]
   @a=params[:data][:contact]
   @b=params[:data][:message]
   @mbno=Apple.find_by_contact(@a)
      
   unless @mbno.nil?
        if (@a.to_i==@mbno.contact)
        
         @or=Orange.new(params[:data][:message])
         @or.name=@mbno.name
         @or.message=@b
         @or.apple_id=@id
         @or.save
                 
        else
        redirect_to :action=>"mobileno"
       end
   else
     redirect_to :action=>"mobileno"
           
   end
   end
   def mobileno

   end
   def compose
   @v=$a
   end
   def inbox
   @id=params[:id]
   @id1=Apple.find_by_id(@id)
   @nam=@id1.name
   @name1=Orange.find_all_by_name(@nam)
   @appid=[]
   @name=[] 
   @message=[]
   if @name1.length==0 then
        redirect_to :action=>"norecord"   
   else
        for i in @name1 do
        @appid << i.apple_id
	@message<< i.message
        end
        @count=@appid.length 
      	for i in 0...@appid.size
	@temp=Apple.find_by_id(@appid[i])
	@name<< @temp.name	
	end
      puts @appid.inspect
     
   end
   end

  # <br><td><%= link_to "Inbox",:id=>id, :controller=>"ram",:action=>"view" %></td></tr><br><br>
 def count
 @len=params[:data][:len]
 end
end
