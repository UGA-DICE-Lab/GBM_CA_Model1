function PLifeCounter=pLifeUpdate(cellMatrix,PLifeCounter)


PLifeCounter=(PLifeCounter+1).*(cellMatrix==3)


end