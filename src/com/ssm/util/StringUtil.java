package com.ssm.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

public class StringUtil {
	private static List<String> keys = new ArrayList<String>();
	static {
		keys.add("and");
		keys.add("exec");
		keys.add("insert");
		keys.add("select");
		keys.add("delete");
		keys.add("update");
		keys.add("count");
		keys.add("*");
		keys.add("%");
		keys.add("chr");
		keys.add("mid");
		keys.add("master");
		keys.add("truncate");
		keys.add("char");
		keys.add("declare");
		keys.add(";");
		keys.add("or");
		keys.add("");
		keys.add("+");
		keys.add("-");
		keys.add("<");
		keys.add(">");
		keys.add(",");
	}
	
	public static String getRandomAddress() {
		String[] city = { "安康市", "安庆市", "安顺市", "安阳市", "鞍山市", "巴彦淖尔市", "巴中市", "白城市", "白山市", "白银市", "百色市", "蚌埠市", "包头市", "宝鸡市", "保定市", "保山市",
				"北海市", "本溪市", "滨州市", "沧州市", "昌都地区", "长春市", "长沙市", "长治市", "常德市", "常州市", "巢湖市", "朝阳市", "潮州市", "郴州市", "成都市", "承德市", "池州市",
				"赤峰市", "崇左市", "滁州市", "达州市", "大连市", "大庆市", "大同市", "丹东市", "德阳市", "德州市", "定西市", "东莞市", "东营市", "鄂尔多斯市", "鄂州市", "防城港市", "佛山市",
				"福州市", "抚顺市", "抚州市", "阜新市", "阜阳市", "甘南州", "赣州市", "固原市", "广安市", "广元市", "广州市", "贵港市", "贵阳市", "桂林市", "哈尔滨市", "哈密地区", "海北藏族自治州",
				"海东地区", "海口市", "邯郸市", "汉中市", "杭州市", "毫州市", "合肥市", "河池市", "河源市", "菏泽市", "贺州市", "鹤壁市", "鹤岗市", "黑河市", "衡水市", "衡阳市", "呼和浩特市",
				"呼伦贝尔市", "湖州市", "葫芦岛市", "怀化市", "淮安市", "淮北市", "淮南市", "黄冈市", "黄山市", "黄石市", "惠州市", "鸡西市", "吉安市", "吉林市", "济南市", "济宁市", "佳木斯市",
				"嘉兴市", "嘉峪关市", "江门市", "焦作市", "揭阳市", "金昌市", "金华市", "锦州市", "晋城市", "晋中市", "荆门市", "荆州市", "景德镇市", "九江市", "酒泉市", "开封市", "克拉玛依市",
				"昆明市", "拉萨市", "来宾市", "莱芜市", "兰州市", "廊坊市", "乐山市", "丽江市", "丽水市", "连云港市", "辽阳市", "辽源市", "聊城市", "临沧市", "临汾市", "临沂市", "柳州市",
				"六安市", "六盘水市", "龙岩市", "陇南市", "娄底市", "泸州市", "吕梁市", "洛阳市", "漯河市", "马鞍山市", "茂名市", "眉山市", "梅州市", "绵阳市", "牡丹江市", "内江市", "南昌市",
				"南充市", "南京市", "南宁市", "南平市", "南通市", "南阳市", "宁波市", "宁德市", "攀枝花市", "盘锦市", "平顶山市", "平凉市", "萍乡市", "莆田市", "濮阳市", "普洱市", "七台河市",
				"齐齐哈尔市", "钦州市", "秦皇岛市", "青岛市", "清远市", "庆阳市", "曲靖市", "衢州市", "泉州市", "日照市", "三门峡市", "三明市", "三亚市", "汕头市", "汕尾市", "商洛市", "商丘市",
				"上饶市", "韶关市", "邵阳市", "绍兴市", "深圳市", "沈阳市", "十堰市", "石家庄市", "石嘴山市", "双鸭山市", "朔州市", "四平市", "松原市", "苏州市", "宿迁市", "宿州市", "绥化市",
				"随州市", "遂宁市", "台州市", "太原市", "泰安市", "泰州市", "唐山市", "天水市", "铁岭市", "通化市", "通辽市", "铜川市", "铜陵市", "铜仁市", "吐鲁番地区", "威海市", "潍坊市",
				"渭南市", "温州市", "乌海市", "乌兰察布市", "乌鲁木齐市", "无锡市", "吴忠市", "芜湖市", "梧州市", "武汉市", "武威市", "西安市", "西宁市", "锡林郭勒盟", "厦门市", "咸宁市", "咸阳市",
				"湘潭市", "襄樊市", "孝感市", "忻州市", "新乡市", "新余市", "信阳市", "兴安盟", "邢台市", "徐州市", "许昌市", "宣城市", "雅安市", "烟台市", "延安市", "盐城市", "扬州市",
				"阳江市", "阳泉市", "伊春市", "伊犁哈萨克自治州", "宜宾市", "宜昌市", "宜春市", "益阳市", "银川市", "鹰潭市", "营口市", "永州市", "榆林市", "玉林市", "玉溪市", "岳阳市", "云浮市",
				"运城市", "枣庄市", "湛江市", "张家界市", "张家口市", "张掖市", "漳州市", "昭通市", "肇庆市", "镇江市", "郑州市", "中山市", "中卫市", "舟山市", "周口市", "株洲市", "珠海市",
				"驻马店市", "资阳市", "淄博市", "自贡市", "遵义市", };
		String[] area = { "伊春区", "带岭区", "南岔区", "金山屯区", "西林区", "美溪区", "乌马河区", "翠峦区", "友好区", "新青区", "上甘岭区", "五营区", "红星区", "汤旺河区", "乌伊岭区",
				"榆次区" };
		String[] road = { "爱国路", "安边路", "安波路", "安德路", "安汾路", "安福路", "安国路", "安化路", "安澜路", "安龙路", "安仁路", "安顺路", "安亭路", "安图路", "安业路", "安义路",
				"安远路", "鞍山路", "鞍山支路", "澳门路", "八一路", "巴林路", "白城路", "白城南路", "白渡路", "白渡桥", "白兰路", "白水路", "白玉路", "百安路（方泰镇）", "百官街", "百花街",
				"百色路", "板泉路", "半淞园路", "包头路", "包头南路", "宝安公路", "宝安路", "宝昌路", "宝联路", "宝林路", "宝祁路", "宝山路", "宝通路", "宝杨路", "宝源路", "保德路", "保定路",
				"保屯路", "保屯路", "北艾路", };
		String[] home = { "金色家园", "耀江花园", "阳光翠竹苑", "东新大厦", "溢盈河畔别墅", "真新六街坊", "和亭佳苑", "协通公寓", "博泰新苑", "菊园五街坊", "住友嘉馨名园", "复华城市花园",
				"爱里舍花园" };

		Random random = new Random();
		int randomCityNum = random.nextInt(city.length);
		int randomAreaNum = random.nextInt(area.length);
		int randomRoadNum = random.nextInt(road.length);
		int randomHomeNum = random.nextInt(home.length);
		int num = random.nextInt(200);
		return city[randomCityNum] + area[randomAreaNum] + road[randomRoadNum] + num + "号" + home[randomHomeNum];

	}

	public static String getCNName() {
		Random random = new Random();
		String[] Surname = { "赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈", "褚", "卫", "蒋", "沈", "韩", "杨", "朱", "秦", "尤", "许", "何", "吕",
				"施", "张", "孔", "曹", "严", "华", "金", "魏", "陶", "姜", "戚", "谢", "邹", "喻", "柏", "水", "窦", "章", "云", "苏", "潘", "葛", "奚", "范", "彭",
				"郎", "鲁", "韦", "昌", "马", "苗", "凤", "花", "方", "俞", "任", "袁", "柳", "酆", "鲍", "史", "唐", "费", "廉", "岑", "薛", "雷", "贺", "倪", "汤",
				"滕", "殷", "罗", "毕", "郝", "邬", "安", "常", "乐", "于", "时", "傅", "皮", "卞", "齐", "康", "伍", "余", "元", "卜", "顾", "孟", "平", "黄", "和",
				"穆", "萧", "尹", "姚", "邵", "湛", "汪", "祁", "毛", "禹", "狄", "米", "贝", "明", "臧", "计", "伏", "成", "戴", "谈", "宋", "茅", "庞", "熊", "纪",
				"舒", "屈", "项", "祝", "董", "梁", "杜", "阮", "蓝", "闵", "席", "季" };
		String girl = "秀娟英华慧巧美娜静淑惠珠翠雅芝玉萍红娥玲芬芳燕彩春菊兰凤洁梅琳素云莲真环雪荣爱妹霞香月莺媛艳瑞凡佳嘉琼勤珍贞莉桂娣叶璧璐娅琦晶妍茜秋珊莎锦黛青倩婷姣婉娴瑾颖露瑶怡婵雁蓓纨仪荷丹蓉眉君琴蕊薇菁梦岚苑婕馨瑗琰韵融园艺咏卿聪澜纯毓悦昭冰爽琬茗羽希宁欣飘育滢馥筠柔竹霭凝晓欢霄枫芸菲寒伊亚宜可姬舒影荔枝思丽 ";
		String boy = "伟刚勇毅俊峰强军平保东文辉力明永健世广志义兴良海山仁波宁贵福生龙元全国胜学祥才发武新利清飞彬富顺信子杰涛昌成康星光天达安岩中茂进林有坚和彪博诚先敬震振壮会思群豪心邦承乐绍功松善厚庆磊民友裕河哲江超浩亮政谦亨奇固之轮翰朗伯宏言若鸣朋斌梁栋维启克伦翔旭鹏泽晨辰士以建家致树炎德行时泰盛雄琛钧冠策腾楠榕风航弘";
		int index = random.nextInt(Surname.length - 1);
		String name = Surname[index]; //获得一个随机的姓氏
		int i = random.nextInt(3);//可以根据这个数设置产生的男女比例
		if (i == 2) {
			int j = random.nextInt(girl.length() - 2);
			if (j % 2 == 0) {
				name = "女-" + name + girl.substring(j, j + 2);
			} else {
				name = "女-" + name + girl.substring(j, j + 1);
			}

		} else {
			int j = random.nextInt(girl.length() - 2);
			if (j % 2 == 0) {
				name = "男-" + name + boy.substring(j, j + 2);
			} else {
				name = "男-" + name + boy.substring(j, j + 1);
			}

		}

		return name;
	}

	public static List<String> list(String s, String spe) {
		ArrayList<String> list = new ArrayList<String>();
		if (s == null || s.trim().equals(""))
			return list;
		String[] e = s.split(spe);
		for (String i : e) {
			list.add(i);
		}
		return list;

	}

	public static <T> List<T> toList(T... a) {
		if (a == null)
			return null;
		List<T> l = new ArrayList<T>();
		for (T e : a) {
			l.add(e);
		}

		return l;
	}

	public static boolean notEmpty(String str) {
		return str != null && !"".equals(str.trim());
	}

	public static boolean isEmpty(String str) {
		return !notEmpty(str);
	}

	public static String stringVerification(String vs) {
		if (vs != null) {
			// return vs.replaceAll("[^a-zA-Z0-9]", "");
			return vs;
		}
		return null;
	}

	public static boolean sqlFilter(String str) {
		return keys.contains(str);
	}

	/**
	 * 将字符串根据分隔符拆分为数组，并把每个元素转换为int
	 * 
	 * @param str
	 * @param split
	 * @return
	 */
	public static int[] StringToIntArray(String str, String split) {
		if (notEmpty(str) && notEmpty(split)) {
			String[] sa = str.split(split);
			int len = sa.length;
			int[] retVal = new int[len];
			for (int i = 0; i < len; i++) {
				retVal[i] = Integer.valueOf(sa[i]);
			}
			return retVal;
		}
		return new int[0];
	}

	/**
	 * 数组转换为字符串
	 * 
	 * @param objs
	 * @param split
	 * @return
	 */
	public static String arrayToString(Object[] objs, String split) {
		if (objs != null && objs.length > 0) {
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < objs.length; i++) {
				sb.append(objs[i].toString());
				if (i < objs.length - 1) {
					sb.append(split);
				}
			}
			return sb.toString();
		}
		return null;
	}

	/**
	 * 
	 * @param objs
	 * @param split
	 *            分隔符
	 * @param before
	 *            每个元素开头增加的字符
	 * @param end
	 *            每个元素结尾增加的字符
	 * @return
	 */
	public static String arrayToString(Object[] objs, String split, String before, String end) {
		if (objs != null && objs.length > 0) {
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < objs.length; i++) {
				sb.append(before);
				sb.append(objs[i].toString());
				sb.append(end);
				if (i < objs.length - 1) {
					sb.append(split);
				}
			}
			return sb.toString();
		}
		return null;
	}

	public static String dateStringFormat(String date) {
		String[] ds = date.split("-");
		date = ds[0];
		date += "-";
		if (ds[1].startsWith("0")) {
			ds[1] = ds[1].substring(1, ds[1].length());
		}
		if (ds[2].startsWith("0")) {
			ds[2] = ds[2].substring(1, ds[2].length());
		}
		date += ds[1];
		date += "-";
		date += ds[2];

		return date;
	}

	/**
	 * 格式化数字不足补齐
	 * 
	 * @param num
	 * @param value
	 * @return
	 */
	public static String format0String(int num, long value) {
		String result = (new Long(value)).toString();
		while (num > result.length()) {
			result = "0" + result;
		}
		return result;
	}

	public static void main(String[] args) {
		StringUtil.dateStringFormat("2011-12-19");
	}

	public static boolean isInteger(String str) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		return pattern.matcher(str).matches();
	}

	public static boolean isDouble(String str) {
		Pattern pattern = Pattern.compile("^[-\\+]?[.\\d]*$");
		return pattern.matcher(str).matches();
	}
}
