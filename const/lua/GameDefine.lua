-------------------------------------------------------
-- do not modify the file, gen by const/gen.bat
-------------------------------------------------------
local gamedefine = {
--CampGroupType
	campgrouptypeself             = 1,             -- 己方阵营
	campgrouptypeenemy            = 2,             -- 地方阵营
	campgrouptypeall              = 3,             -- 全部
--UnitType
	unittypetower                 = 1,             -- 塔
	unittypesoldier               = 2,             -- 兵
	unittypebullet                = 3,             -- 子弹
	unittypelive                  = 4,             -- 塔 士兵
	unittypeall                   = 5,             -- 所有
--SkillRangeType
	skillrangetypehitrange        = 1,             -- 碰撞范围
	skillrangetypeattackrange     = 2,             -- 攻击范围
	skillrangetypeall             = 3,             -- 全局
--SkillTargetGroup
	skilltargetgroupnone          = 1,             -- 无
	skilltargetgroupnearestone    = 2,             -- 最近元件
	skilltargetgrouplimitnum      = 3,             -- 限定个数
	skilltargetgroupall           = 4,             -- 全局
--Camp
	campnone                      = 0,             -- 无
	campleft                      = 1,             -- 左方阵营
	campright                     = 2,             -- 右方阵营
--MoveType
	movetypedir                   = 1,             -- 直线
	movetypelock                  = 2,             -- 锁定
	movetypepath                  = 3,             -- 按路线
--BulletHitCheck
	bullethitchecknone            = 1,             -- 不检测
	bullethitchecktarget          = 2,             -- 检测目标
	bullethitcheckall             = 3,             -- 检测全部
--SkillType
	skilltypeshoot                = 1,             -- 射击
	skilltypecreatesoldier        = 2,             -- 造兵
	skilltypeaoe                  = 3,             -- aoe
--BulletType
	bullettypelock                = 1,             -- 锁定
	bullettypedir                 = 2,             -- 方向
	bullettypepath                = 3,             -- 路径
--BuffType
	bufftypecac                   = 1,             -- 
--BuffUpdateType
	buffupdatetypeonce            = 1,             -- 
	buffupdatetypeloop            = 2,             -- 
--BuffAddType
	buffaddtypetime               = 1,             -- 
	buffaddtypelayer              = 2,             -- 
	buffaddtyperesettime          = 3,             -- 
--BuffRemoveType
	buffremovetypeall             = 1,             -- 
	buffremovetypelayer           = 2,             -- 
--AttrType
	attrtypenone                  = 0,             -- 
	attrtypehp                    = 1,             -- 
	attrtypearmor                 = 2,             -- 
	attrtypemovespeed             = 3,             -- 
	attrtypeattackcd              = 4,             -- 
	attrtypeattackrange           = 5,             -- 
	attrtypeattackdamage          = 6,             -- 
	attrtypeattacknum             = 7,             -- 
	attrtypenum                   = 8,             -- 
--UnitState
	unitstatenone                 = 1,             -- 无
	unitstateborn                 = 2,             -- 出生
	unitstateidle                 = 3,             -- 闲着
	unitstatewalk                 = 4,             -- 行进
	unitstateattack               = 5,             -- 攻击
	unitstatebeattack             = 6,             -- 受攻击
	unitstatedeath                = 7,             -- 死亡
}
return gamedefine