class Navigator

  attr_reader :room_width, :room_length, :hoover_x, :hoover_y, :waypoints

  def initialize(input_file)
    @input_file = input_file
  end

  private

  def read_file
    file = File.open(@input_file)
    @lines = file.read.split("\n")
    @lines
  end

  def get_first_line
    @first_line = @lines[0]
    @first_line
  end

  def get_room_dimensions
    @dimensions = @first_line.split(" ")
    @dimensions
  end

  def get_room_width
    @room_width = @dimensions[0].to_i
    @room_width
  end

  def get_room_length
    @room_length = @dimensions[1].to_i
    @room_length
  end

  def get_second_line
    @second_line = @lines[1]
    @second_line
  end

  def get_initial_hoover_coordinates
    @hoover_coordinates = @second_line.split(" ")
    @hoover_coordinates
  end

  def get_initial_hoover_x_coordinate
    @hoover_x = @hoover_coordinates[0].to_i
    @hoover_x
  end

  def get_initial_hoover_y_coordinate
    @hoover_y = @hoover_coordinates[1].to_i
    @hoover_y
  end

  def add_initial_hoover_coordinates_to_waypoints
    @waypoints = [@second_line]
  end

  def get_last_line
    @last_line = @lines[-1]
    @last_line
  end

  def get_driving_directions
    @driving_directions = @last_line.split("")
    @driving_directions
  end

  def get_room_dimensions_from_input_file
    get_first_line
    get_room_dimensions
    get_room_width
    get_room_length
  end

  def get_initial_hoover_coordinates_from_input_file
    get_second_line
    get_initial_hoover_coordinates
    get_initial_hoover_x_coordinate
    get_initial_hoover_y_coordinate
  end

  def get_driving_directions_from_input_file
    get_last_line
    get_driving_directions
  end

  def initial_dirt_locations
    @initial_dirt_locations = @lines[2..-2]
    @initial_dirt_locations
  end

  def get_final_hoover_coordinates
    add_initial_hoover_coordinates_to_waypoints
    @driving_directions.each do |direction|
      if direction == "N"
        @hoover_y += 1 unless @hoover_y == @room_length
      elsif direction == "S"
        @hoover_y -= 1 unless @hoover_y == 0
      elsif direction == "E"
        @hoover_x += 1 unless @hoover_x == @room_width
      elsif direction == "W"
        @hoover_x -= 1 unless @hoover_x == 0
      end
      @waypoints << "#{@hoover_x} #{@hoover_y}"
    end
    @final_hoover_coordinates = [@hoover_x, @hoover_y]
    return @final_hoover_coordinates
  end

  def dirt_patches_cleaned
    @dirt_patches_cleaned = (@waypoints & @initial_dirt_locations).length
    @dirt_patches_cleaned
  end

  def final_status
    "#{@final_hoover_coordinates}\n#{@dirt_patches_cleaned}"
  end

  def write_output_file
    File.open('output.txt', 'w') { |file| file.write("#{final_status}") }
  end


  def set_hoover_inputs
    read_file
    get_room_dimensions_from_input_file
    get_initial_hoover_coordinates_from_input_file
    initial_dirt_locations
    get_driving_directions_from_input_file
  end

  public

  def run_hoover_route
    set_hoover_inputs
    get_final_hoover_coordinates
    dirt_patches_cleaned
    write_output_file
    final_status
  end


end

navigator = Navigator.new('input.txt')

p navigator.run_hoover_route
