# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    lines = []
    tsv.each_line { |line| lines.push(line) }
    keys = lines[0].split("\t").map { |x| x.chomp }
    lines[1..lines.length - 1].each do |line|
      yml_hash = {}
      keys.each_index { |i| yml_hash[keys[i]] = line.split("\t")[i].chomp }
      @data << yml_hash
    end
  end
  # to_tsv: converts @data into tsv string
  # returns: String in TSV format

  def to_tsv
    index = @data[0].keys.join("\t")
    file = []
    file << index + "\n"
    @data.each do |key|
      ss = []
      key.each_value { |value| ss << value }
      aa = ss.join"\t"
      file << aa + "\n"
    end
    file.join''
  end
end
