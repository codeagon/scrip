LinkageID = "img://HomunManager3DView__258__258";
var myBitmapData = flash.display.BitmapData.loadBitmap(LinkageID);
var mc_bitmap = this.createEmptyMovieClip(LinkageID,this.getNextHighestDepth());
mc_bitmap.attachBitmap(myBitmapData,this.getNextHighestDepth());
mc_bitmap.setMask(mask_mc);
mc_bitmap._width = 258;
mc_bitmap._height = 258;
resourcID = LinkageID;
lib.Debuger.trace("drawBitmap:" + resourcID);
