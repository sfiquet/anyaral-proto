module Jekyll
  module FormatFilter
    VALUE_SPECIAL = 999999
    VALUE_DASH = 999998
    # the following are currently not used in stats
    VALUE_BLAST = 999997
    VALUE_NO_UPPER_LIMIT = 999996
    VALUE_UNDEFINED = 999995
    
    def formatStat(input, postfix = '')
      special = {
        VALUE_SPECIAL => 'Special',
        VALUE_DASH => '<span class="sr-only">None</span><span aria-hidden="true">&mdash;</span>',
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

    def formatRace(race)
      race['culture'].empty? ? "#{race['theme']}" : "#{race['culture']} &mdash; #{race['theme']}"
    end

    def formatStaminaCost(cost)
      costString = ""
      cost.times do
        costString += "*"
      end
      costString
    end

    def formatAbility(ability, param1, param2)
      name = ability['name']
      staminaCost = formatStaminaCost(ability['staminaCost'])
      
      details = ""
      unless param1.empty?
        params = param2.empty? ? param1 : "#{param1}, #{param2}"
        details = "(#{params})"
      end

      type = "[#{ability['type'][0]}]"
      result = "#{name}#{staminaCost} #{details}#{type}"
    end

  end
end

Liquid::Template.register_filter(Jekyll::FormatFilter)
