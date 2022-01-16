import flixel.FlxG;

using StringTools;

class BoosterState {
    static var boost:Array<Array<String>> = [
        ["ON", "Booster On"],
        ["OFF", "Booster Off"]
    ];

    public static function currentLangCode():String {
        if (!Reflect.hasField(FlxG.save.data, 'lang')) {
            FlxG.save.data.lang = boost[0][0];
        }
        return FlxG.save.data.lang;
    }

    public static function currentLangName() {
        var lang = currentLangCode();
        return getLangName(lang);
    }

    public static function currentLangExt():String {
        var lang = currentLangCode();
        if (lang == boost[0][0]) { //No ext used for default booster
            return "";
        } else {
            return "." + lang;
        }
    }

    public static function getLangName(lang:String) {
        var langName = null;
        for (entry in boost) {
            if (entry[0] == lang) {
                langName = entry[1];
                break;
            }
        }
        return langName;
    }

    public static function boosterSwitch() {
        var lang = currentLangCode();
        var i = 0, next = 0;
        for (entry in boost) {
            if (entry[0] == lang) {
                if (i == boost.length - 1) next = 0;
                else next = i + 1;
                break;
            }
            i++;
        }
        FlxG.save.data.lang = boost[next][0];
    }
}