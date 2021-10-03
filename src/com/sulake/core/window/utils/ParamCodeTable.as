package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_192;
         param1["bound_to_parent_rect"] = const_101;
         param1["child_window"] = const_1298;
         param1["embedded_controller"] = const_1245;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_905;
         param1["mouse_dragging_target"] = const_286;
         param1["mouse_dragging_trigger"] = const_418;
         param1["mouse_scaling_target"] = const_336;
         param1["mouse_scaling_trigger"] = const_571;
         param1["horizontal_mouse_scaling_trigger"] = const_285;
         param1["vertical_mouse_scaling_trigger"] = const_305;
         param1["observe_parent_input_events"] = const_1389;
         param1["optimize_region_to_layout_size"] = const_515;
         param1["parent_window"] = const_1169;
         param1["relative_horizontal_scale_center"] = const_205;
         param1["relative_horizontal_scale_fixed"] = const_155;
         param1["relative_horizontal_scale_move"] = const_448;
         param1["relative_horizontal_scale_strech"] = const_435;
         param1["relative_scale_center"] = const_1276;
         param1["relative_scale_fixed"] = const_924;
         param1["relative_scale_move"] = const_1325;
         param1["relative_scale_strech"] = const_1301;
         param1["relative_vertical_scale_center"] = const_223;
         param1["relative_vertical_scale_fixed"] = const_168;
         param1["relative_vertical_scale_move"] = const_276;
         param1["relative_vertical_scale_strech"] = const_325;
         param1["on_resize_align_left"] = const_848;
         param1["on_resize_align_right"] = const_534;
         param1["on_resize_align_center"] = const_531;
         param1["on_resize_align_top"] = const_751;
         param1["on_resize_align_bottom"] = const_558;
         param1["on_resize_align_middle"] = const_626;
         param1["on_accommodate_align_left"] = const_1200;
         param1["on_accommodate_align_right"] = const_504;
         param1["on_accommodate_align_center"] = const_740;
         param1["on_accommodate_align_top"] = const_1272;
         param1["on_accommodate_align_bottom"] = const_589;
         param1["on_accommodate_align_middle"] = const_1015;
         param1["route_input_events_to_parent"] = const_618;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1302;
         param1["scalable_with_mouse"] = const_1299;
         param1["reflect_horizontal_resize_to_parent"] = const_624;
         param1["reflect_vertical_resize_to_parent"] = const_519;
         param1["reflect_resize_to_parent"] = const_324;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1189;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
