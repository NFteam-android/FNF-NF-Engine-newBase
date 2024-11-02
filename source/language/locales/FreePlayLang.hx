package language.locales;

import haxe.Json;

typedef FreePlayData =
{
	tapToSearch:String,
	mapsFound:String,
	searchSorted:String,
	speed:String,
	noteCount:String,
	rating:String,
	audioDisplay:String,
	historyScore:String,
	option:String,
	mods:String,
	changers:String,
    editor:String,
	reset:String,
	random:String,
	skip:String,
	playedTime:String,
    accurate:String,
    score:String
}

class FreePlayLang
{
    static var data:FreePlayData;
    static var defaultData:FreePlayData;

    static public function get(value:String):String {
        var getValue:String = Reflect.getProperty(data, value);
        if (getValue == null) getValue = Reflect.getProperty(defaultData, value);
        if (getValue == null) getValue = value + ' (missed interpret)';
        return getValue;
    }

    static public function updateLang() {
        defaultData = Json.parse(Paths.getTextFromFile('language/' + 'English' + '/freeplay.json'));
		try{
            data = Json.parse(Paths.getTextFromFile('language/' + ClientPrefs.data.language + '/freeplay.json'));
        } catch(e:Any) {
            try{
                data = Json.parse(Paths.getTextFromFile('language/' + 'English' + '/freeplay.json'));
            }
        }
    }
}