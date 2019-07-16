def log descriptionOfBlock, &block
  puts  "#{"  "*$nestingDepth} Beginning #{descriptionOfBlock}"
  $nestingDepth +=1
  returnVal = block.call
  $nestingDepth-=1
  puts "#{"  "*$nestingDepth} #{descriptionOfBlock} finished, returning: #{returnVal}"
end

$nestingDepth = 0
log "outer block" do
  log "some little block" do
    5
  end
  false
end
