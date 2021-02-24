#include "stm32f10x_conf.h"

/*
 * "Blue Pill" LED blinker
 */

int main() {
    SystemInit();

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);

    {
        GPIO_InitTypeDef s;
        GPIO_StructInit(&s);
        s.GPIO_Pin = GPIO_Pin_13;
        s.GPIO_Mode = GPIO_Mode_Out_PP;
        s.GPIO_Speed = GPIO_Speed_2MHz;
        GPIO_Init(GPIOC, &s);
    }


    for (;;) {
        GPIO_SetBits(GPIOC, GPIO_Pin_13);
        { volatile int i = 10000000; while (i--); }
        GPIO_ResetBits(GPIOC, GPIO_Pin_13);
        { volatile int i = 10000000; while (i--); }
    }
    return 0;
}
