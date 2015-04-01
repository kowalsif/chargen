function statBonus(val)
{
	return Math.floor(val / 4);
}

function skillBonus(val)
{
	return val;
}

function makeroll(dice, type)
{
	var tot = dice;
	for (var i = 0; i < dice; i++)
		tot += randomnumber=Math.floor(Math.random() * type)
	return tot;
}

function makestatroll(stat)
{
	var statval = parseInt(stat, 10);
	var modify = statBonus(statval);
	return  makeroll(1, 20) + modify;
}

function makeskillroll(stat, skill)
{
	var statval = parseInt(stat, 10);
	var statmodify = statBonus(statval);
	var skillval = parseInt(skill, 10);
	var skillmodify = skillBonus(skillval);
	return makeroll(1, 20) + statmodify + skillmodify + 1;
}

function makedamageroll(diceinfo, stat)
{
	var dinf = diceinfo.split("d");
	var numdice = parseInt(dinf[0]);
	var dietype = parseInt(dinf[1]);
	var statbonus = statBonus(parseInt(stat));
	return makeroll(numdice, dietype) + statbonus;
}
