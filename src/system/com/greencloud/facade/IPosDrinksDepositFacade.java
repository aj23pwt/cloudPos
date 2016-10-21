package com.greencloud.facade;

import com.greencloud.entity.PosDrinksConsume;
import com.greencloud.entity.PosDrinksDepositOrder;

public interface IPosDrinksDepositFacade {
	void savePosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder);
	void updatePosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder);
	void savePosDrinksConsume(PosDrinksConsume posDrinksConsume);
	PosDrinksDepositOrder findPosDrinksDepositOrderById(Long id);
}
