class Campaign

  @mailchimp = Mailchimp::API.new(MC_API_KEY)

  @options = {list_id: MC_LIST_ID}
  @options.subject = "New Blog Post from Your Favorite DJs"
  @options.from_email = "new@cornellradio.com"
  @options.from_name = "CornellRadio.com"
  @options.to_name = "*|EMAIL|*"
  @options.tracking = {opens: true}
  @options.auto_footer = true
  @options.generate_text = true

  @segment_opts = {conditions: {}}
  @segment_opts.conditions.field = 
  @segment_opts.conditions.op = 
  @segment_opts.conditions.value = 

  def initialize title, content, group
    @options.title = post_title
    @content = {html: content}

    @mailchimp.campaign.create 'regular', @options, @content
  end
end