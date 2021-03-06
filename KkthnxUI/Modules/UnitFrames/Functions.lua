local K, C, L = select(2, ...):unpack()
if C.Unitframe.Enable ~= true then return end

local select = select
local tonumber = tonumber
local gsub = string.gsub
local format = string.format
local match = string.match
local max = math.max

local UnitIsGhost = UnitIsGhost
local GetSpellInfo = GetSpellInfo
local UnitIsConnected = UnitIsConnected
local UnitIsDead = UnitIsDead
local UnitIsDeadOrGhost = UnitIsDeadOrGhost
local UnitIsPlayer = UnitIsPlayer
local UnitSelectionColor = UnitSelectionColor
local UnitPower, UnitPowerMax = UnitPower, UnitPowerMax

local _, ns = ...
local oUF = ns.oUF or oUF
local colors = K.Colors

function K.UnitframeValue(self)
	if self <= 999 then
		return self
	end
	local Value
	if self >= 1000000 then
		Value = format("%.1fm", self/1000000)
		return Value
	elseif self >= 1000 then
		Value = format("%.1fk", self/1000)
		return Value
	end
end

function K.cUnit(unit)
	if (unit:match("vehicle")) then
		return "player"
	elseif (unit:match("party%d")) then
		return "party"
	elseif (unit:match("arena%d")) then
		return "arena"
	elseif (unit:match("boss%d")) then
		return "boss"
	elseif (unit:match("partypet%d")) then
		return "pet"
	else
		return unit
	end
end

function K.MultiCheck(what, ...)
	for i = 1, select("#", ...) do
		if (what == select(i, ...)) then
			return true
		end
	end

	return false
end

local function UpdatePortraitColor(self, unit, cur, max)
	if (not UnitIsConnected(unit)) then
		self.Portrait:SetVertexColor(0.5, 0.5, 0.5, 0.7)
	elseif (UnitIsDead(unit)) then
		self.Portrait:SetVertexColor(0.35, 0.35, 0.35, 0.7)
	elseif (UnitIsGhost(unit)) then
		self.Portrait:SetVertexColor(0.3, 0.3, 0.9, 0.7)
	elseif (cur / max * 100 < 25) then
		if (UnitIsPlayer(unit)) then
			if (unit ~= "player") then
				self.Portrait:SetVertexColor(1, 0, 0, 0.7)
			end
		end
	else
		self.Portrait:SetVertexColor(1, 1, 1, 1)
	end
end

local TEXT_PERCENT, TEXT_SHORT, TEXT_LONG, TEXT_MINMAX, TEXT_MAX, TEXT_DEF, TEXT_NONE = 0, 1, 2, 3, 4, 5, 6
local function SetValueText(element, tag, cur, max, color, notMana)
	if ( not max or max == 0 ) then max = 100 end -- not sure why this happens

	if (tag == TEXT_PERCENT) and (max < 200) then
		tag = TEXT_SHORT -- Shows energy etc. with real number
	end

	local s

	if tag == TEXT_SHORT then
		s = format("%s", cur > 0 and K.UnitframeValue(cur) or "")
	elseif tag == TEXT_LONG then
		s = format("%s - %.1f%%", K.UnitframeValue(cur), cur / max * 100)
	elseif tag == TEXT_MINMAX then
		s = format("%s/%s", K.UnitframeValue(cur), K.UnitframeValue(max))
	elseif tag == TEXT_MAX then
		s = format("%s", K.UnitframeValue(max))
	elseif tag == TEXT_DEF then
		s = format("%s", (cur == max and "" or "-"..K.UnitframeValue(max - cur)))
	elseif tag == TEXT_PERCENT then
		s = format("%d%%", cur / max * 100)
	else
		s = ""
	end

	element:SetFormattedText("|cff%02x%02x%02x%s|r", color[1] * 255, color[2] * 255, color[3] * 255, s)
end

-- Health Update
do
	local tagtable = {
		NUMERIC = {TEXT_MINMAX, TEXT_SHORT, TEXT_MAX},
		BOTH	= {TEXT_MINMAX, TEXT_LONG, TEXT_MAX},
		PERCENT = {TEXT_SHORT, TEXT_PERCENT, TEXT_PERCENT},
		MINIMAL = {TEXT_SHORT, TEXT_PERCENT, TEXT_NONE},
		DEFICIT = {TEXT_DEF, TEXT_DEF, TEXT_NONE},
	}

	function K.PostUpdateHealth(Health, unit, cur, max)
		local absent = not UnitIsConnected(unit) and PLAYER_OFFLINE or UnitIsGhost(unit) and GetSpellInfo(8326) or UnitIsDead(unit) and DEAD
		local self = Health:GetParent()
		local uconfig = ns.config[self.cUnit]

		if (self.Portrait) then
			UpdatePortraitColor(self, unit, cur, max)
		end

		if (self.Name) and (self.Name.Bg) then -- For boss frames
			self.Name.Bg:SetVertexColor(UnitSelectionColor(unit))
		end

		if absent then
			Health:SetStatusBarColor(0.5, 0.5, 0.5)
			if Health.Value then
				Health.Value:SetText(absent)
			end
			return
		end

		if not cur then
			cur = UnitHealth(unit)
			max = UnitHealthMax(unit) or 1
		end

		local color, _
		color = C.Unitframe.TextHealthColor

		if uconfig.HealthTag == "DISABLE" then
			Health.Value:SetText(nil)
		elseif self.isMouseOver then
			SetValueText(Health.Value, tagtable[uconfig.HealthTag][1], cur, max, color)
		elseif cur < max then
			SetValueText(Health.Value, tagtable[uconfig.HealthTag][2], cur, max, color)
		else
			SetValueText(Health.Value, tagtable[uconfig.HealthTag][3], cur, max, color)
		end
	end
end

-- Extra health bars
function K.UpdateIncHeals(self, event, unit)
	if (unit) and (self.unit ~= unit) and (self.realUnit ~= unit) then return; end
	local hp = self.HealPrediction
	local curHP, maxHP = UnitHealth(unit), UnitHealthMax(unit)
	local incHeal = (UnitGetIncomingHeals(unit) or 0) * 2
	local healAbsorb = UnitGetTotalHealAbsorbs(unit) or 0

	if (healAbsorb > 0) then
		hp.necroHeals:SetMinMaxValues(0, curHP)
		hp.necroHeals:SetValue(math.min(healAbsorb, curHP))
		hp.necroHeals:Show()
	else
		hp.necroHeals:Hide()
	end

	if ((incHeal - healAbsorb) <= 0) or (curHP == maxHP) then
		hp.incHeals:Hide()
	else
		hp.incHeals:SetMinMaxValues(0, maxHP - curHP)
		hp.incHeals:SetValue(incHeal - healAbsorb)
		hp.incHeals:Show()
	end

	if (hp.TotalAbsorb) then
		local absorb = UnitGetTotalAbsorbs(unit) or 0
		hp.TotalAbsorb:SetMinMaxValues(0, maxHP)
		hp.TotalAbsorb:SetValue(math.min(absorb, maxHP))
		if (absorb < (maxHP * 0.05)) then
			hp.TotalAbsorb:Hide()
		else
			hp.TotalAbsorb:Show()
			if not hp.TotalAbsorb.spark:IsShown() then
				hp.TotalAbsorb.spark:Show()
			end
		end
	end
end

-- Power Update
do
	local tagtable = {
		NUMERIC	= {TEXT_MINMAX, TEXT_SHORT, TEXT_MAX},
		PERCENT	= {TEXT_SHORT, TEXT_PERCENT, TEXT_PERCENT},
		MINIMAL	= {TEXT_SHORT, TEXT_PERCENT, TEXT_NONE},
	}

	function K.PostUpdatePower(Power, unit, cur, max)
		local self = Power:GetParent()
		local uconfig = ns.config[self.cUnit]

		if (UnitIsDeadOrGhost(unit) or not UnitIsConnected(unit)) or (max == 0) then
			Power:SetValue(0)
			if Power.Value then
				Power.Value:SetText("")
			end
			return
		end

		if not Power.Value then return end

		if (not cur) then
			max = UnitPower(unit) or 1
			cur = UnitPowerMax(unit)
		end

		local color
		color = C.Unitframe.TextPowerColor

		if uconfig.PowerTag == "DISABLE" then
			Power.Value:SetText(nil)
		elseif self.isMouseOver then
			SetValueText(Power.Value, tagtable[uconfig.PowerTag][1], cur, max, color)
		elseif cur < max then
			SetValueText(Power.Value, tagtable[uconfig.PowerTag][2], cur, max, color)
		else
			SetValueText(Power.Value, tagtable[uconfig.PowerTag][3], cur, max, color)
		end
	end
end

-- Mouseover
function K.UnitFrame_OnEnter(self)
	if self.__owner then
		self = self.__owner
	end
	if not self:IsEnabled() then return end --arena prep

	UnitFrame_OnEnter(self)

	self.isMouseOver = true
	if self.mouseovers then
		for _, text in pairs (self.mouseovers) do
			text:ForceUpdate()
		end
	end

	if (self.AdditionalPower and self.AdditionalPower.Value) then
		self.AdditionalPower.Value:Show()
	end
end

function K.UnitFrame_OnLeave(self)
	if self.__owner then
		self = self.__owner
	end
	if not self:IsEnabled() then return end --arena prep
	UnitFrame_OnLeave(self)

	self.isMouseOver = nil
	if self.mouseovers then
		for _, text in pairs (self.mouseovers) do
			text:ForceUpdate()
		end
	end

	if (self.AdditionalPower and self.AdditionalPower.Value) then
		self.AdditionalPower.Value:Hide()
	end
end

-- Painting frames
do
	local function toRgb(h, s, l)
		if (s <= 0) then
			return l, l, l
		end
		h, s, l = h * 6, s, l
		local c = (1 - math.abs(2 * l - 1)) * s
		local x = (1 - math.abs(h % 2 - 1 )) * c
		local m, r, g, b = (l - .5 * c), 0, 0, 0
		if h < 1 	 then
			r, g, b = c, x, 0
		elseif h < 2 then
			r, g, b = x, c, 0
		elseif h < 3 then
			r, g, b = 0, c, x
		elseif h < 4 then
			r, g, b = 0, x, c
		elseif h < 5 then
			r, g, b = x, 0, c
		else
			r, g, b = c, 0, x
		end return (r + m), (g + m), (b + m)
	end

	local function toHsl(r, g, b)
		local min, max = math.min(r, g, b), math.max(r, g, b)
		local h, s, l = 0, 0, (max + min) / 2
		if max ~= min then
			local d = max - min
			s = l > 0.5 and d / (2 - max - min) or d / (max + min)
			if max == r then
				local mod = 6
				if g > b then mod = 0 end
				h = (g - b) / d + mod
			elseif max == g then
				h = (b - r) / d + 2
			else
				h = (r - g) / d + 4
			end
		end
		h = h / 6
		return h, s, l
	end

	local function LightenItUp(r, g, b, factor)
		local h, s, l = toHsl(r, g, b)
		l = l + (factor or 0.1)
		if l > 1 then
			l = 1
		elseif l < 0 then
			l = 0
		end
		return toRgb(h, s, l)
	end

	function K.GetPaintColor(factor)
		local r, g, b = unpack(C.Media.Border_Color)
		if factor then
			r, g, b = LightenItUp(r, g, b, factor)
		end
		return r, g, b
	end
end

-- Statusbar Functions
function K.CreateStatusBar(parent, layer, name, AddBackdrop)
	if type(layer) ~= "string" then layer = "BORDER" end
	local bar = CreateFrame("StatusBar", name, parent)
	bar:SetStatusBarTexture(C.Media.Texture, layer)
	bar.texture = C.Media.Texture

	if AddBackdrop then
		bar:SetBackdrop({bgFile = C.Media.Blank})
		local r,g,b,a = unpack(C.Media.Backdrop_Color)
		bar:SetBackdropColor(r, g, b, a)
	end

	return bar
end

K.RaidBuffsTrackingPosition = {
	TOPLEFT = {6, 1},
	TOPRIGHT = {-6, 1},
	BOTTOMLEFT = {6, 1},
	BOTTOMRIGHT = {-6, 1},
	LEFT = {6, 1},
	RIGHT = {-6, 1},
	TOP = {0, 0},
	BOTTOM = {0, 0},
}

function K.CreateAuraWatchIcon(self, icon)
	icon:SetBackdrop(K.TwoPixelBorder)
	icon:CreateShadow()
	icon.icon:SetPoint("TOPLEFT", 1, -1)
	icon.icon:SetPoint("BOTTOMRIGHT", -1, 1)
	icon.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	icon.icon:SetDrawLayer("ARTWORK")
	if (icon.cd) then
		icon.cd:SetHideCountdownNumbers(true)
		icon.cd:SetReverse(true)
	end
	icon.overlay:SetTexture()
end

-- create the icon
function K.CreateAuraWatch(self)
	local Class = select(2, UnitClass("player"))
	local Auras = CreateFrame("Frame", nil, self)
	Auras:SetPoint("TOPLEFT", self.Health, 2, -2)
	Auras:SetPoint("BOTTOMRIGHT", self.Health, -2, 2)
	Auras.presentAlpha = 1
	Auras.missingAlpha = 0
	Auras.icons = {}
	Auras.PostCreateIcon = K.CreateAuraWatchIcon
	Auras.strictMatching = true

	if (not C.Raidframe.AuraWatchTimers) then
		Auras.hideCooldown = true
	end

	local buffs = {}
	if (K.RaidBuffsTracking["ALL"]) then
		for key, value in pairs(K.RaidBuffsTracking["ALL"]) do
			tinsert(buffs, value)
		end
	end

	if (K.RaidBuffsTracking[Class]) then
		for key, value in pairs(K.RaidBuffsTracking[Class]) do
			tinsert(buffs, value)
		end
	end

	-- Cornerbuffs
	if buffs then
		for key, spell in pairs(buffs) do
			local Icon = CreateFrame("Frame", nil, Auras)
			Icon.spellID = spell[1]
			Icon.anyUnit = spell[4]
			Icon:SetWidth(6)
			Icon:SetHeight(6)
			Icon:SetPoint(spell[2], 0, 0)
			local Texture = Icon:CreateTexture(nil, "OVERLAY")
			Texture:SetAllPoints(Icon)
			Texture:SetTexture(C.Media.Blank)
			if (spell[3]) then
				Texture:SetVertexColor(unpack(spell[3]))
			else
				Texture:SetVertexColor(0.8, 0.8, 0.8)
			end
			local Count = Icon:CreateFontString(nil, "OVERLAY")
			Count:SetFont(C.Media.Font, 9, "THINOUTLINE")
			Count:SetPoint("CENTER", unpack(K.RaidBuffsTrackingPosition[spell[2]]))
			Icon.count = Count
			Auras.icons[spell[1]] = Icon
		end
	end

	self.AuraWatch = Auras
end