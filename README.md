# FPGA leds and buttons
Trabalho desenvolvido para a disciplina de Microcontroladores II do curso de Engenharia de Computação.

Utilizado como hardware uma placa Digilent Arty A7 e como linguagem de programação VHDL.

Descrição do trabalho:
Utilizado os 4 botões push e 2 botões switches, 4 leds normais e 2 leds RGB.
* Com os 2 switches desligados os botões push acendem cada um um led normal (btn0 - led4, btn1 - led5, btn2 - led6, btn3 - led7);
* Switch0 ligado e switch1 desligado os RGBs ligam com a cor vermelha (cor do time campeão do Brasileirão 2020);
* Switch0 desligado e switch1 ligado os RGBs ligam com a cor azul (cor desse time ruim que se acha o maior do RS);
* Ambos switches ligados os leds normais ligam em forma de cascata e os RGBs ligam na cor branca
