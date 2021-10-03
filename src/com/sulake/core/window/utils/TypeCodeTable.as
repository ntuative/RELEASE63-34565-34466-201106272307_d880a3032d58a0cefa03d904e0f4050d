package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_832;
         param1["badge"] = const_737;
         param1["bitmap"] = const_397;
         param1["border"] = const_829;
         param1["border_notify"] = const_2013;
         param1["bubble"] = const_930;
         param1["bubble_pointer_up"] = const_1253;
         param1["bubble_pointer_right"] = const_1332;
         param1["bubble_pointer_down"] = const_1209;
         param1["bubble_pointer_left"] = const_1352;
         param1["button"] = const_566;
         param1["button_thick"] = const_817;
         param1["button_icon"] = const_2033;
         param1["button_group_left"] = const_910;
         param1["button_group_center"] = const_785;
         param1["button_group_right"] = const_920;
         param1["canvas"] = const_810;
         param1["checkbox"] = const_748;
         param1["closebutton"] = const_1346;
         param1["container"] = const_438;
         param1["container_button"] = const_773;
         param1["display_object_wrapper"] = const_900;
         param1["dropmenu"] = const_536;
         param1["dropmenu_item"] = const_642;
         param1["frame"] = const_405;
         param1["frame_notify"] = const_1840;
         param1["header"] = const_893;
         param1["html"] = const_1214;
         param1["icon"] = const_1220;
         param1["itemgrid"] = const_1187;
         param1["itemgrid_horizontal"] = const_567;
         param1["itemgrid_vertical"] = const_1004;
         param1["itemlist"] = WINDOW_TYPE_ITEMLIST;
         param1["itemlist_horizontal"] = const_427;
         param1["itemlist_vertical"] = const_446;
         param1["label"] = const_863;
         param1["maximizebox"] = const_1995;
         param1["menu"] = const_1773;
         param1["menu_item"] = const_1736;
         param1["submenu"] = const_1211;
         param1["minimizebox"] = const_1894;
         param1["notify"] = const_2005;
         param1["null"] = const_976;
         param1["password"] = const_887;
         param1["radiobutton"] = const_756;
         param1["region"] = const_337;
         param1["restorebox"] = const_1915;
         param1["scaler"] = const_610;
         param1["scaler_horizontal"] = const_1765;
         param1["scaler_vertical"] = const_1828;
         param1["scrollbar_horizontal"] = const_554;
         param1["scrollbar_vertical"] = const_898;
         param1["scrollbar_slider_button_up"] = const_1204;
         param1["scrollbar_slider_button_down"] = const_1382;
         param1["scrollbar_slider_button_left"] = const_1182;
         param1["scrollbar_slider_button_right"] = const_1317;
         param1["scrollbar_slider_bar_horizontal"] = const_1364;
         param1["scrollbar_slider_bar_vertical"] = const_1184;
         param1["scrollbar_slider_track_horizontal"] = const_1385;
         param1["scrollbar_slider_track_vertical"] = const_1375;
         param1["scrollable_itemlist"] = const_1799;
         param1["scrollable_itemlist_vertical"] = const_658;
         param1["scrollable_itemlist_horizontal"] = const_1230;
         param1["selector"] = const_941;
         param1["selector_list"] = const_939;
         param1["submenu"] = const_1211;
         param1["tab_button"] = const_732;
         param1["tab_container_button"] = const_1311;
         param1["tab_context"] = const_462;
         param1["tab_content"] = const_1394;
         param1["tab_selector"] = const_876;
         param1["text"] = const_946;
         param1["input"] = const_1024;
         param1["toolbar"] = const_1776;
         param1["tooltip"] = const_413;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
