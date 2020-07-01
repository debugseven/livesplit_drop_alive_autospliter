state("Drop Alive") 
{
    // pointer to the level/scene id
    int scene_id : 0x0FD36F0, 0x4, 0x8, 0x0, 0x48, 0x44, 0x50, 0xA0;
}

init
{
    vars.id_main_menu = 81;
    vars.id_level_select = 72;

    // level ids
    vars.id_onwards = 10;
    vars.id_milky_way = 60;
    vars.id_warming_up = 110;
    vars.id_too_hot_for_my_drop = 160;
    vars.id_ice_to_meet_you = 80;
    vars.id_high_voltage = 120;
    vars.id_breaking_the_ice = 180;
    vars.id_sparkway_to_heaven = 710;
    vars.id_double_red_flag = 110;
    vars.id_triple_trouble = 70;
    vars.id_like_a_drop_in_a_storm = 140;
    vars.id_drop_alive = 40;

    vars.level_ids = new List<int> {10, 60, 110, 160, 80, 120, 180, 710, 110, 70, 140, 40};

    vars.current_index = 0;
    vars.last_scene_id = 0;
    vars.won = false;
}

update
{
   
}

startup
{
    
}

start
{
    if (old.scene_id == vars.id_level_select && current.scene_id == vars.id_onwards) 
    {
        vars.current_index = 0;
        vars.last_scene_id = vars.id_onwards;
        vars.won = false;
        return true;
    }
}

split
{
    int next_index = vars.current_index + 1;
    
    if (next_index > vars.level_ids.Count - 1)
    {
        if (vars.level_ids[vars.current_index] == vars.last_scene_id && current.scene_id == vars.id_main_menu)
        {
            print("finished");
            vars.won = true;
            return true;
        }
    }
    else
    {
        if (vars.level_ids[vars.current_index] == vars.last_scene_id && vars.level_ids[next_index] == current.scene_id)
        {
            print("split");
            vars.current_index = next_index;
            vars.last_scene_id = vars.level_ids[next_index];
            return true;
        }
    }

    
}

reset
{
    if (old.scene_id == vars.id_main_menu && current.scene_id == vars.id_level_select)
    {
        print("reset");
        return true;
    }
}

isLoading
{

}