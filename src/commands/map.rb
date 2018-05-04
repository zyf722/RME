# -*- coding: utf-8 -*-

# ==============================================================================
# * RPG Maker (VX / VX.ACE) Extender
# ------------------------------------------------------------------------------
# {{ TODO: authors }}
# ------------------------------------------------------------------------------
# Maps related commands.
#
# [Dependencies]
#   - `../*.rb`
#   - `../documentation/internal_commands.rb`
#   - `../documentation/internal_documentation.rb`
# ==============================================================================

module RME
  module Command
    module Map

      # Common parameters' declaration
      X = {:name        => :x,
           :type        => ParameterType::Coordinate,
           :description => 'Map.x'}
      Y = {:name        => :y,
           :type        => ParameterType::Coordinate,
           :description => 'Map.y'}

      # ------------------------------------------------------------------------
      # * Returns the identifier of the current map.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :map_id,
                        :description => 'Map.map_id'}) {
        $game_map.map_id
      }

      # ------------------------------------------------------------------------
      # * Returns the current map's name.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :map_name,
                        :description => 'Map.map_name'}) {
        $game_map.display_name
      }

      # ------------------------------------------------------------------------
      # * Returns the event's identifier which is located at the given
      #   coordinates (`x`, `y`).
      # ------------------------------------------------------------------------
      Command::declare({:section          => self,
                        :name             => :id_at,
                        :description      => 'Map.event_at',
                        :deprecated_since => "2.0.0",
                        :see              => [:event_at],
                        :parameters       => [X, Y]}) { |x, y| event_at(x, y) }

      # ------------------------------------------------------------------------
      # - Returns the event's identifier which is located at the given
      #   coordinates ( `x`, `y`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_at,
                        :description => 'Map.event_at',
                        :parameters  => [X, Y]}) { |x, y|
        result = $game_map.event_id_xy(x, y)
        return result if result > 0
        return 0 if $game_player.x == x && $game_player.y == y
        return -1
      }

      # TODO
      # - `terrain_tag`
      # - `tile_id`
      # - `set_tile_where`
      # - `delete_tiles`
      # - `set_tile`
      # - `region_id`
      # - `square_passable?`
      # - `get_tileset_id`
      # - `dash_activate?`
      # - `dash_deactivate?`
      # - `dash_activation`
      # - `switch_tileset`
      # - `wall?`
      # - `roof?`
      # - `stair?`
      # - `table?`
      # - `map_width`
      # - `map_height`
      # - `ground?`
      # - `boat_passable?`
      # - `ship_passable?`
      # - `autotile_type`
      # - `damage_floor?`
      # - `get_random_square`
      # - `get_squares_by_region`
      # - `get_squares_by_tile`
      # - `get_squares_by_terrain`

    end
  end
end
