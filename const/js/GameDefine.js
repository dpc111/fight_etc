/////////////////////////////////////////////////////
// do not modify the file, gen by const/gen.bat
/////////////////////////////////////////////////////
var GAMEDEFINE = {
	//CampGroupType
	CampGroupTypeSelf             : 1,             // 己方阵营
	CampGroupTypeEnemy            : 2,             // 地方阵营
	CampGroupTypeAll              : 3,             // 全部
	//UnitType
	UnitTypeTower                 : 1,             // 塔
	UnitTypeSoldier               : 2,             // 兵
	UnitTypeBullet                : 3,             // 子弹
	UnitTypeLive                  : 4,             // 塔 士兵
	UnitTypeAll                   : 5,             // 所有
	//SkillRangeType
	SkillRangeTypeHitRange        : 1,             // 碰撞范围
	SkillRangeTypeAttackRange     : 2,             // 攻击范围
	SkillRangeTypeAll             : 3,             // 全局
	//SkillTargetGroup
	SkillTargetGroupNone          : 1,             // 无
	SkillTargetGroupNearestOne    : 2,             // 最近元件
	SkillTargetGroupLimitNum      : 3,             // 限定个数
	SkillTargetGroupAll           : 4,             // 全局
	//Camp
	CampNone                      : 0,             // 无
	CampLeft                      : 1,             // 左方阵营
	CampRight                     : 2,             // 右方阵营
	//MoveType
	MoveTypeDir                   : 1,             // 直线
	MoveTypeLock                  : 2,             // 锁定
	MoveTypePath                  : 3,             // 按路线
	//BulletHitCheck
	BulletHitCheckNone            : 1,             // 不检测
	BulletHitCheckTarget          : 2,             // 检测目标
	BulletHitCheckAll             : 3,             // 检测全部
	//SkillType
	SkillTypeShoot                : 1,             // 射击
	SkillTypeCreateSoldier        : 2,             // 造兵
	SkillTypeAoe                  : 3,             // aoe
	//BulletType
	BulletTypeLock                : 1,             // 锁定
	BulletTypeDir                 : 2,             // 方向
	BulletTypePath                : 3,             // 路径
	//BuffType
	BuffTypeCac                   : 1,             // 
	//BuffUpdateType
	BuffUpdateTypeOnce            : 1,             // 
	BuffUpdateTypeLoop            : 2,             // 
	//BuffAddType
	BuffAddTypeTime               : 1,             // 
	BuffAddTypeLayer              : 2,             // 
	BuffAddTypeResetTime          : 3,             // 
	//BuffRemoveType
	BuffRemoveTypeAll             : 1,             // 
	BuffRemoveTypeLayer           : 2,             // 
	//AttrType
	AttrTypeNone                  : 0,             // 
	AttrTypeHp                    : 1,             // 
	AttrTypeArmor                 : 2,             // 
	AttrTypeMoveSpeed             : 3,             // 
	AttrTypeAttackCd              : 4,             // 
	AttrTypeAttackRange           : 5,             // 
	AttrTypeAttackDamage          : 6,             // 
	AttrTypeAttackNum             : 7,             // 
	AttrTypeNum                   : 8,             // 
	//UnitState
	UnitStateNone                 : 1,             // 无
	UnitStateBorn                 : 2,             // 出生
	UnitStateIdle                 : 3,             // 闲着
	UnitStateWalk                 : 4,             // 行进
	UnitStateAttack               : 5,             // 攻击
	UnitStateBeAttack             : 6,             // 受攻击
	UnitStateDeath                : 7              // 死亡
} 
module.exports = GAMEDEFINE;