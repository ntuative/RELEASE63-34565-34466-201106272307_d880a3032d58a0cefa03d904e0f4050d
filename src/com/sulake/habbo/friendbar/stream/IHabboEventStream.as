package com.sulake.habbo.friendbar.stream
{
   import com.sulake.core.runtime.IUnknown;
   
   public interface IHabboEventStream extends IUnknown
   {
       
      
      function set visible(param1:Boolean) : void;
      
      function get visible() : Boolean;
   }
}
