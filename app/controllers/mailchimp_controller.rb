class MailchimpController < ApplicationController

  def subscribe
    email = {email: params[:email]}
    group_name = params[:group_name]
    groupings = {groupings: [name: :groups, groups: [group_name]]}
    begin
      @mailchimp.lists.subscribe(MC_LIST_ID, email, groupings)
    rescue Mailchimp::ListAlreadySubscribedError
      # Now we have to update the subscriber's group
      flash[:error] = "ListAlreadySubscribedError"
    rescue Mailchimp::Error => err
      if err.message
        flash[:error] = err.message
      else
        flash[:error] = "An unknown error occured communicating with Mailchimp"
      end
    else
      flash[:success] = "You've been subscribed to #{group_name}'s blog posts!"
    end
    redirect_to "/" # this needs to be changed to go where you came from
  end

end