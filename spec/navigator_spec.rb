require 'navigator'
# require_relative '../lib/a.txt'

describe Navigator do

  describe '#read_file' do

    it 'How to mock File.open for write with rspec 3.4' do
      @buffer = StringIO.new()
      @filename = "a.txt"
      @content = "a"
      allow(File).to receive(:open).with(@filename,'w').and_yield( @buffer )

      # call the function that writes to the file
      File.open(@filename, 'w') {|f| f.write(@content)}

      # reading the buffer and checking its content.
      expect(@buffer.string).to eq(@content)
    end

    # it 'How to mock File.open for read with rspec 3.4' do
    #   @buffer = StringIO.new()
    #   @filename = "a.txt"
    #   @content = "a"
    #   allow(File).to receive(:open).with(@filename,'w').and_yield( @buffer )
    #
    #   # call the function that writes to the file
    #   File.open(@filename, 'w') {|f| f.write(@content)}
    #
    #   # reading the buffer and checking its content.
    #   expect(navigator.read_file(@filename, 'r')).to eq(@content)
    # end

    it 'returns a string from the input file' do
      @buffer = StringIO.new()
      @filename = "a.txt"
      @content = "a"
      allow(File).to receive(:open).with(@filename,'w').and_yield( @buffer )

      navigator = Navigator.new
      expect(navigator.read_file(@filename)).to eq('a')
    end


  end


end
