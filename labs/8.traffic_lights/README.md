
# 8.Traffic_lights

[Link : xalkan02 Digital-electronics-1](https://github.com/TarikVUT/Digital-electronics-1/tree/main/labs/8.traffic_lights)


| **Input P** | `0` | `0` | `1` | `1` | `0` | `1` | `0` | `1` | `1` | `1` | `1` | `0` | `0` | `1` | `1` | `1` |
| :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **Clock** | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) | ![rising](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/8.traffic_lights/image/1.png) |
| **State** | A | A | B | C | A | B | A | B | C | D | B | A | A | B | C | D |
| **Output R** | `0` | `0` | `0` | `0` | `0` | `0` | `0` | `0` | `0` | `1` | `0` | `0` | `0` |  `0` |  `0` | `1` |


| **RGB LED** | **Artix-7 pin names** | **Red** | **Yellow** | **Green** |
| :-: | :-: | :-: | :-: | :-: |
| LD16 | N15, M16, R12 | `1,0,0` | `1,1,0` | `0,1,0` |
| LD17 | N16, R11, G14 | `1,0,0` | `1,1,0` | `0,1,0` |
