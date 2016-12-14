-- Localization for zhCN clients
if (GetLocale() ~= "zhCN") then
	return
end

-- AFKSpin Localization
L_AFKSCREEN_NOGUILD = "无公会"
-- Announce Localization
L_ANNOUNCE_FP_USE = "%s 使用了 %s."
L_ANNOUNCE_INTERRUPTED = INTERRUPTED.." %s的 \124cff71d5ff\124H法术:%d:0\124h[%s]\124h\124r!"--need test
L_ANNOUNCE_PC_ABORTED = "停手!"
L_ANNOUNCE_PC_GO = "上!"
L_ANNOUNCE_PC_MSG = "Pulling %s in %s.."--need test
L_ANNOUNCE_SAPPED = "被闷棍!"
L_ANNOUNCE_SAPPED_BY = "被他闷棍: "
-- Auras Localization
L_AURAS_MOVEBUFFS = "移动增益"
L_AURAS_MOVEDEBUFFS = "移动减益"
-- Merchant Localization
L_MERCHANT_NOTENOUGHMONEY = "你没有足够的钱来修理!"
L_MERCHANT_REPAIRCOST = "你修理物品花了"
L_MERCHANT_SOLDTRASH = "你售出垃圾获得"
-- Bindings Localization
L_BIND_BINDING = "按键绑定"
L_BIND_CLEARED = "所有按键绑定已清除"
L_BIND_DISCARD = "所有最近的绑定设置已解除."
L_BIND_INSTRUCT = "悬停鼠标在任何动作条按钮来绑定它. 按下ESC键或右键点击来清除当前的按键绑定."
L_BIND_KEY = "键"
L_BIND_NO_SET = "无绑定设置"
L_BIND_SAVED = "所有按键绑定已保存."
-- Chat Localization
L_CHAT_AFK = "暂离"
L_CHAT_DND = "勿扰"
L_CHAT_GUILD = "公会"
L_CHAT_GUILDRECRUITMENT = "公会招募"
L_CHAT_INSTANCE = "副本"
L_CHAT_INSTANCE_LEADER = "副本向导"
L_CHAT_LOCALDEFENSE = "本地防务"
L_CHAT_LOOKINGFORGROUP = "查找队伍"
L_CHAT_OFFICER = "官员"
L_CHAT_PARTY = "小队"
L_CHAT_PARTY_LEADER = "队长"
L_CHAT_RAID = "团队"
L_CHAT_RAID_LEADER = "团长"
L_CHAT_RAID_WARNING = "团队警告"
L_CHAT_PET_BATTLE = "宠物对战"
-- Configbutton Localization
L_CONFIGBUTTON_FUNC = "按钮功能:"
L_CONFIGBUTTON_LEFTCLICK = "左键点击:"
L_CONFIGBUTTON_RIGHTCLICK = "右键点击:"
L_CONFIGBUTTON_MIDDLECLICK = "中键点击:"
L_CONFIGBUTTON_SHIFTCLICK = "Shift+点击:"
L_CONFIGBUTTON_MOVEUI = "移动UI元素"
L_CONFIGBUTTON_RECOUNT = "显示/隐藏Recount框体"
L_CONFIGBUTTON_SKADA = "显示/隐藏Skada框体"
L_CONFIGBUTTON_CONFIG = "显示KkthnxUI配置菜单"
L_CONFIGBUTTON_SPEC = "显示KkthnxUI-专精菜单"
L_CONFIGBUTTON_SPECMENU = "专精的选择"
L_CONFIGBUTTON_SPECERROR = "你已经启用了这个专精!"
-- DataBars Localization
L_DATABARS_ARTIFACT_CLICK = "点击:打开神器"
L_DATABARS_ARTIFACT_REMANING = "|cffe6cc80剩余: %s|r"
L_DATABARS_HONOR_LEFTCLICK = "|cffcccccc左键点击:打开荣誉面板|r"
L_DATABARS_HONOR_RIGHTCLICK = "|cffcccccc右键点击:打开荣誉天赋面板|r"
-- DataText Localization
L_DATATEXT_BASESASSAULTED = "突袭了基地:"
L_DATATEXT_BASESDEFENDED = "防守了基地:"
L_DATATEXT_CARTS_CONTROLLED = "控制了车子:"
L_DATATEXT_DEMOLISHERSDESTROYED = "摧毁了投石车:"
L_DATATEXT_FLAGSCAPTURED = "夺取了旗帜:"
L_DATATEXT_FLAGSRETURNED = "归还了旗帜:"
L_DATATEXT_GATESDESTROYED = "摧毁的大门:"
L_DATATEXT_GRAVEYARDSASSAULTED = "突袭了墓地:"
L_DATATEXT_GRAVEYARDSDEFENDED = "防守了墓地:"
L_DATATEXT_ORB_POSSESSIONS = "获得了宝珠:"
L_DATATEXT_TOWERSASSAULTED = "突袭了塔:"
L_DATATEXT_TOWERSDEFENDED = "防守了塔:"
L_DATATEXT_VICTORY_POINTS = "胜利点数:"
L_DATATEXT_TOTALMEMORY = "内存总占用:"
L_DATATEXT_DOWNLOAD = "下载: "
L_DATATEXT_BANDWIDTH = "带宽: "
L_DATATEXT_FPS = "FPS"
L_DATATEXT_MS = "MS"
-- AutoInvite Localization
L_INVITE_ENABLE = "自动邀请已启用: "
L_INVITE_DISABLE = "自动邀请已禁用"
-- Info Localization
L_INFO_DISBAND = "解散队伍..."
L_INFO_DUEL = "拒绝了决斗请求来自 "
L_INFO_PET_DUEL = "拒绝了宠物对战请求来自 "
L_INFO_INVITE = "接受了邀请来自 "
L_INFO_SETTINGS_DBM = "输入 /settings dbm, 应用设置到DBM."
L_INFO_SETTINGS_MSBT = "输入 /settings msbt,应用设置到MSBT."
L_INFO_SETTINGS_SKADA = "输入 /settings skada,应用设置到Skada."
L_INFO_SETTINGS_Abu = "输入 /settings abu,应用设置到oUF_Abu."
L_INFO_SETTINGS_ALL = "输入 /settings all,为所有修改应用设置."
L_INFO_NOT_INSTALLED = " 未安装."
L_INFO_SKIN_DISABLED1 = "应用皮肤到 "
L_INFO_SKIN_DISABLED2 = " 已禁用."
-- Install Message Localization
L_INSTALL_COMPLETE = "安装完成"
-- Loot Localization
L_LOOT_ANNOUNCE = "通知到"
L_LOOT_CANNOT = "不能掷骰"
L_LOOT_CHEST = ">> 从宝箱中拾取"
L_LOOT_FISH = "钓鱼拾取"
L_LOOT_MONSTER = ">> 拾取 "
L_LOOT_RANDOM = "随机玩家"
L_LOOT_SELF = "自身拾取"
L_LOOT_TO_GUILD = " 公会"
L_LOOT_TO_INSTANCE = " 副本"
L_LOOT_TO_PARTY = " 小队"
L_LOOT_TO_RAID = " 团队"
L_LOOT_TO_SAY = " 说"
-- Mail Localization
L_MAIL_COMPLETE = "全部完成."
L_MAIL_MESSAGES = "消息"
L_MAIL_NEED = "需要一个邮箱."
L_MAIL_STOPPED = "已停止,库存已满."
L_MAIL_UNIQUE = "已停止.在背包或银行中发现一个重复的唯一物品."
-- World Map Localization
L_MAP_FOG = "战争迷雾"
-- FarmMode Minimap
L_MINIMAP_FARMMODE_ON = "Farm模式已启用"
L_MINIMAP_FARMMODE_OFF = "Farm模式已禁用"
-- Misc Localization
L_MISC_COPPERSHORT = "|cffeda55f铜|r"
L_MISC_GOLDSHORT = "|cffffd700金|r"
L_MISC_REPAIR = "警告! 你需要尽快修理你的装备!"
L_MISC_SILVERSHORT = "|cffc7c7cf银|r"
L_MISC_UI_OUTDATED = "KkthnxUI 已过期.你可以从Curse.com下载最新版本.可以使用Curse客户端自动更新KkthnxUI!"
L_MISC_UNDRESS = "脱光"
-- Popup Localization
L_POPUP_ARMORY = "英雄榜"
L_POPUP_BOOSTUI = "|cffff0000警告|r |n|n此设置将通过调整并降低图形选项以优化性能.仅在你有|cffff0000帧数|r 问题|r时选择此项!"
L_POPUP_DISBAND_RAID = "你确定你想解散队伍吗?"
L_POPUP_FIX_ACTIONBARS = "你的动作条有些问题.你想重载UI来处理吗?"
L_POPUP_INSTALLUI = "感谢选择 |cff3c9bedKkthnxUI|r! |n|n接受这个安装对话框来应用设置."
L_POPUP_RELOADUI = "安装已完成.请点击 '接受' 按钮来重载UI.体验|cff3c9bedKkthnxUI|r吧! |n|n可访问 |cff3c9bedwww.github.com/kkthnx|r."
L_POPUP_RESETUI = "你确定你想重置|cff3c9bedKkthnxUI|r吗?"
L_POPUP_RESOLUTIONCHANGED = "我们检测到您的魔兽世界客户端上分辨率的改动. 我们强烈建议你重启游戏.你想要继续吗？"
L_POPUP_SETTINGS_ALL = "|cffff0000警告|r |n|n这将适用于所有受支持的插件设置,并将其导入到|cff3c9bedKkthnxUI|r.此功能仅对支持的插件有效."
L_POPUP_SETTINGS_DBM = "我们需要改变|cff3c9bedDBM|r计时条的位置."
-- Raid Utility Localization
L_RAID_UTIL_DISBAND = "解散队伍"
L_POPUP_DISBAND_RAID = "你确定你想解散这个队伍吗?"
-- Tooltip Localization
L_TOOLTIP_ACH_COMPLETE = "你的状态: 已完成 "
L_TOOLTIP_ACH_INCOMPLETE = "你的状态: 未完成"
L_TOOLTIP_ACH_STATUS = "你的状态:"
L_TOOLTIP_ITEM_COUNT = "物品计数:"
L_TOOLTIP_ITEM_ID = "物品ID:"
L_TOOLTIP_SPELL_ID = "法术ID:"
-- Tutorial Localization
L_TUTORIAL_MESSAGE_1 = "技术支持请访问 https://github.com/Kkthnx"
L_TUTORIAL_MESSAGE_2 = "你可以通过右键点击小地图来打开系统菜单条."
L_TUTORIAL_MESSAGE_3 = "你可以输入 /kb 来快速设置按键绑定."
L_TUTORIAL_MESSAGE_4 = "当你选中一个目标时,可以输入 /focus 设置为焦点. 建议做成一个宏."
L_TUTORIAL_MESSAGE_5 = "你可以通过鼠标划过聊天面板右下角显示聊天菜单按钮,左键点击可以复制聊天内容."
L_TUTORIAL_MESSAGE_6 = "如果你在使用KkthnxUI时遇到了问题,可以尝试禁用除了KkthnxUI以外的所有插件,记住,KkthnxUI是一个替换整体UI的插件,你不能使用两个插件做同样的事."
L_TUTORIAL_MESSAGE_7 = "要设置哪个频道出现在哪个聊天框,右键单击聊天选项卡,然后设置."
L_TUTORIAL_MESSAGE_8 = "你可以使用 /resetui 命令来重置你所有的可移动元素. 也可输入 /moveui 然后右键点击一个可移动元素来重置它的位置."
L_TUTORIAL_MESSAGE_9 = "默认按住Shift键+拖拽来移动动作条. 你可以从动作条选项菜单中修改组合键."
L_TUTORIAL_MESSAGE_10 = "你可以通过在工具提示选项中启用物品等级来查看某人的平均物品等级"
-- Wowhead Link Localization
L_WATCH_WOWHEAD_LINK = "Wowhead链接"
-- Welcome Localization
L_WELCOME_LINE_1 = "欢迎使用 |cff3c9bedKkthnxUI|r v"
L_WELCOME_LINE_2_1 = ""
L_WELCOME_LINE_2_2 = "输入/cfg来设置界面,或访问 www.github.com/kkthnx|r"
L_WELCOME_LINE_2_3 = ""
L_WELCOME_LINE_2_4 = "输入/uihelp可以解答你的一些问题"
-- Slash Commands Localization
L_SLASHCMD_HELP = {
    "",
    "|cff3c9bed可用的命令:|r",
    "--------------------------",
    "/rl - 重载界面.",
    "/rc - 执行团队检查.",
    "/gm - 打开GM面板.",
    "/rd - 解散小队或团队.",
    "/toraid - 转化为小队或团队.",
    "/teleport - 从随机地下城传送.",
    "/spec, /ss - 切换天赋专精.",
    "/frame - 框体.",
    "/farmmode - 增加小地图的大小.",
    "/moveui - 允许界面元素的移动.",
    "/resetui - 重置综合设置为默认值.",
    "/resetconfig - 重置 KkthnxUI_Config 的设置.",
    "/settings ADDON_NAME - 应用设置到 msbt, dbm, skada, 或所有插件.",
    "/pulsecd - 自身冷却闪烁测试.",
    "/tt - 密语目标.",
    "/ainv - 启用自动邀请.",
    "/cfg - 打开界面设置.",
    "/patch - 显示魔兽世界版本信息.",
    "",
    "|cff3c9bed可用的隐藏功能:|r",
    "--------------------------",
    "鼠标右键点击小地图显示系统菜单.",
    "鼠标中键点击小地图显示追踪菜单.",
    "鼠标左键点击经验条打开声望面板.",
    "鼠标左键点击神器条打开神器面板.",
    "按住Alt键在工具提示中获取玩家物品等级和专精.",
    "按住Shift键立即滚动到聊天开始或结尾处.",
    "复制聊天信息按钮在聊天框右下边.",
    "鼠标中键点击复制聊天信息按钮则 /roll.",
}
