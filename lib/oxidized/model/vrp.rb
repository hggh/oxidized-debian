class VRP < Oxidized::Model
  # Huawei VRP
  
  prompt /^(<[\w.-]+>)$/
  comment '# '

  cmd :all do |cfg|
    cfg.each_line.to_a[1..-2].join
  end
 
  cfg :telnet do
    username /^Username:$/
    password /^Password:$/
  end

  cfg :telnet, :ssh do 
    post_login 'screen-length 0 temporary'
    pre_logout 'quit'
  end

  cmd 'display version' do |cfg|
    cfg = cfg.each_line.select {|l| not l.match /uptime/ }.join
    comment cfg
  end

  cmd 'display device' do |cfg|
    comment cfg
  end

  cmd 'display current-configuration all' do |cfg|
    cfg
  end
  
end
