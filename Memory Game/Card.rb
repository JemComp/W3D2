class Card
    attr_reader :value, :face_up
    def initialize(value)
        @value = value
        @face_up = false

    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def ==(card2)
        @value == card2.value
    end

    def to_s
        if @face_up
            @value.to_s
        else
            :*.to_s
        end
    end


end