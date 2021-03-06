appendSorted = function (newNode,frontier){
  # We add the new node to the frontier, sorted with respect to the total cost of the path
  length = length(frontier);
  totcost = newNode$heur + newNode$cost;
  
  
  if(length == 0)
  {
    frontier[1] = list(newNode);
  }
  else{
    
    for(i in 1:length){
      if(frontier[[i]]$x == newNode$x && frontier[[i]]$y == newNode$y){
        if(frontier[[i]]$cost + frontier[[i]]$heur >= totcost ){
          frontier = frontier[-i];
          length = length -1;
          break
        }else{
          return(frontier)
        }
      }
      
    }
    
    
    for (i in 1:length) {
      if(frontier[[i]]$cost + frontier[[i]]$heur >= totcost)
      {
        frontier = append(frontier,list(newNode), i-1);
        return(frontier)
      }
    }
    frontier[length+1] = list(newNode);
  }
  return (frontier)
}