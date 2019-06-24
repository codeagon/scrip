function spray(particleName, startX, startY, endX, endY, sprayInterval, randomScaleMin, randomScaleMax, randomAlphaMin, randomAlphaMax, randomRotaionMin, randomRotationMax)
{
   var _loc3_ = endX - startX;
   var _loc4_ = endY - startY;
   var _loc2_ = this.createEmptyMovieClip("blank",this.getNextHighestDepth());
   _loc2_._x = startX;
   _loc2_._y = startY;
   _loc2_.intervalId = 1;
   _loc2_.intervalId = setInterval(attachObject,sprayInterval,_loc2_,particleName,_loc3_,_loc4_,randomScaleMin,randomScaleMax,randomAlphaMin,randomAlphaMax,randomRotaionMin,randomRotationMax);
}
function attachObject(target, linkage, x, y, randomScaleMin, randomScaleMax, randomAlphaMin, randomAlphaMax, randomRotaionMin, randomRotationMax)
{
   var _loc1_ = target.attachMovie(linkage,linkage + target.getNextHighestDepth(),target.getNextHighestDepth());
   _loc1_._x = random(x);
   _loc1_._y = random(y);
   var _loc5_ = randomScaleMin + random(randomScaleMax - randomScaleMin);
   var _loc2_ = randomAlphaMin + random(randomAlphaMax - randomAlphaMin);
   var _loc4_ = randomRotaionMin + random(randomRotationMax - randomRotaionMin);
   _loc1_._xscale = _loc1_._yscale = _loc5_;
   _loc1_._alpha = _loc2_;
   _loc1_._rotation = _loc4_;
}
function removeObject(target)
{
   removeMovieClip(target);
}
spray("particle_1",420,390,560,460,300,80,100,20,30,10,360);
