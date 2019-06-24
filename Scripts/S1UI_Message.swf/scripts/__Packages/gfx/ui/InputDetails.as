class gfx.ui.InputDetails
{
   function InputDetails(type, code, value, navEquivalent)
   {
      this.type = type;
      this.code = code;
      this.value = value;
      this.navEquivalent = navEquivalent;
   }
   function toString()
   {
      return ["[InputDelegate","code=" + this.code,"type=" + this.type,"value=" + this.value,"navEquivalent=" + this.navEquivalent + "]"].toString();
   }
}
