# http://drnicwilliams.com/2006/10/12/my-irbrc-for-consoleirb/
require 'irb/completion'
#require 'map_by_method'
#require 'what_methods'
require 'pp'
IRB.conf[:AUTO_INDENT]=true

# http://tagaholic.me/2009/05/29/exploring-how-to-configure-irb.html
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 200
