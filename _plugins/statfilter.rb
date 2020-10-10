module Jekyll
  module StatFilter
    VALUE_SPECIAL = 999999
    VALUE_DASH = 999998
    # the following are currently not used in stats
    VALUE_BLAST = 999997
    VALUE_NO_UPPER_LIMIT = 999996
    VALUE_UNDEFINED = 999995
    
    def formatStat(input, postfix = '')
      special = {
        VALUE_SPECIAL => 'Special',
        VALUE_DASH => '&mdash;',
        VALUE_BLAST => 'Blast',
        VALUE_NO_UPPER_LIMIT => 'No upper limit',
        VALUE_UNDEFINED => 'Does not apply'
      }

      if special[input]
        special[input]
      else
        "#{input}#{postfix}"
      end
    end

    def formatSize(input)
      sizes = {
        15 => 'Tiny',
        30 => 'Small',
        40 => 'Medium',
        50 => 'Large',
        60 => 'Huge'
      }

      if sizes.key?(input)
        sizes[input]
      else
        formatStat(input)
      end
    end

  end
end

Liquid::Template.register_filter(Jekyll::StatFilter)
