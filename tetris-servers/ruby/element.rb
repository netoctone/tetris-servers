class Element
    YOU('☺'),
    NEAR_1_BOMB('1'),
    NEAR_2_BOMB('2'),
    NEAR_3_BOMB('3'),
    NEAR_4_BOMB('4'),
    NEAR_5_BOMB('5'),
    NEAR_6_BOMB('6'),
    NEAR_7_BOMB('7'),
    NEAR_8_BOMB('8'),
    WALL('☼'),
    FOG('*'),
    SPACE(' ');

    private char ch;

    Element(char ch) {
        this.ch = ch;
    }

    public char getChar() {
        return ch;
    }

    public static Element valueOf(char ch) {
        for (Element el : Element.values()) {
            if (el.ch == ch) {
                return el;
            }
        }
        throw new IllegalArgumentException("No such Elment for " + ch);
    }
}
end
