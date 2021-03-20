/**
* Author: form
* draws sectormarkers on the map
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* Yes
*
* Public:
* No 
* 
* Global:
* No
* 
* API:
* No
*
* Example:
* [] call FUNC(drawsectormarkers);
*
*/

#include "macros.hpp"

GVAR(SectorMarkers) =
[
    [[3.11, 11014.47], [3.11, 12790.74], "ColorBlack", 8, "SectorMarker_1"],
    [[3.11, 12790.74], [1030.96, 12790.74], "ColorBlack", 8, "SectorMarker_2"],
    [[1030.96, 12790.74], [2234.53, 12790.74], "ColorBlack", 8, "SectorMarker_3"],
    [[3.11, 11014.47], [2234.53, 11014.47], "ColorBlack", 8, "SectorMarker_4"],
    [[3.11, 11014.47], [12.23299, 9258.54], "ColorBlack", 8, "SectorMarker_5"],
    [[2234.53, 11014.47], [2234.53, 12790.74], "ColorBlack", 8, "SectorMarker_6"],
    [[2234.53, 11014.47], [3892.41, 9676.39], "ColorBlack", 8, "SectorMarker_7"],
    [[2234.53, 12790.74], [7033.26, 12790.74], "ColorBlack", 8, "SectorMarker_8"],
    [[2234.53, 12790.74], [4691.43, 12790.74], "ColorBlack", 8, "SectorMarker_9"],
    [[12800.76, 11014.47], [12800.76, 12790.74], "ColorBlack", 8, "SectorMarker_10"],
    [[12800.76, 12790.74], [10651.75, 12806.39], "ColorBlack", 8, "SectorMarker_11"],
    [[12800.76, 11014.47], [10670.41, 11014.47], "ColorBlack", 8, "SectorMarker_12"],
    [[12800.76, 11014.47], [12800.76, 8095.74], "ColorBlack", 8, "SectorMarker_13"],
    [[10670.41, 11014.47], [10084.17, 9865.76], "ColorBlack", 8, "SectorMarker_14"],
    [[10084.17, 9865.76], [8920.35, 9612.23], "ColorBlack", 8, "SectorMarker_15"],
    [[10670.41, 11014.47], [10651.75, 12806.39], "ColorBlack", 8, "SectorMarker_16"],
    [[1240.89, 3.13], [3.11, 3.13], "ColorBlack", 8, "SectorMarker_17"],
    [[3.11, 3.13], [3.11, 1643.25], "ColorBlack", 8, "SectorMarker_18"],
    [[1240.89, 3.13], [1240.89, 1643.25], "ColorBlack", 8, "SectorMarker_19"],
    [[1240.89, 3.13], [4904.47, 3.13], "ColorBlack", 8, "SectorMarker_20"],
    [[1240.89, 1643.25], [3.11, 1643.25], "ColorBlack", 8, "SectorMarker_21"],
    [[1240.89, 1643.25], [2657.49, 1881.13], "ColorBlack", 8, "SectorMarker_22"],
    [[3.11, 1643.25], [28.59259, 4214.54], "ColorBlack", 8, "SectorMarker_23"],
    [[10987.63, 3.13], [12800.76, 3.13], "ColorBlack", 8, "SectorMarker_24"],
    [[12800.76, 3.13], [12800.76, 1170.62], "ColorBlack", 8, "SectorMarker_25"],
    [[10987.63, 3.13], [10939.42, 1170.62], "ColorBlack", 8, "SectorMarker_26"],
    [[10987.63, 3.13], [8138.87, 3.13], "ColorBlack", 8, "SectorMarker_27"],
    [[12800.76, 1170.62], [10939.42, 1170.62], "ColorBlack", 8, "SectorMarker_28"],
    [[12800.76, 1170.62], [12800.76, 5956.39], "ColorBlack", 8, "SectorMarker_29"],
    [[12800.76, 1170.62], [12800.76, 4067.43], "ColorBlack", 8, "SectorMarker_30"],
    [[10939.42, 1170.62], [10825.91, 2580.68], "ColorBlack", 8, "SectorMarker_31"],
    [[10825.91, 2580.68], [8886.82, 2700.40], "ColorBlack", 8, "SectorMarker_32"],
    [[7033.26, 12790.74], [7426.68, 12790.74], "ColorBlack", 8, "SectorMarker_33"],
    [[7426.68, 12790.74], [8541.61, 12790.74], "ColorBlack", 8, "SectorMarker_34"],
    [[7033.26, 12790.74], [4691.43, 12790.74], "ColorBlack", 8, "SectorMarker_35"],
    [[7033.26, 12790.74], [6977.28, 10081.73], "ColorBlack", 8, "SectorMarker_36"],
    [[28.59259, 6109.76], [793.05, 6109.76], "ColorBlack", 8, "SectorMarker_37"],
    [[793.05, 6109.76], [1553.44, 6109.76], "ColorBlack", 8, "SectorMarker_38"],
    [[1553.44, 6109.76], [3616.93, 6109.76], "ColorBlack", 8, "SectorMarker_39"],
    [[3616.93, 6109.76], [4186.06, 6109.76], "ColorBlack", 8, "SectorMarker_40"],
    [[28.59259, 6109.76], [28.59259, 4214.54], "ColorBlack", 8, "SectorMarker_41"],
    [[28.59259, 6109.76], [20.72177, 7624.68], "ColorBlack", 8, "SectorMarker_42"],
    [[5926.10, 5921.96], [5187.48, 6109.76], "ColorBlack", 8, "SectorMarker_43"],
    [[5187.48, 6109.76], [4186.06, 6109.76], "ColorBlack", 8, "SectorMarker_44"],
    [[5926.10, 5921.96], [8367.45, 5834.32], "ColorBlack", 8, "SectorMarker_45"],
    [[8367.45, 5834.32], [9056.32, 5834.32], "ColorBlack", 8, "SectorMarker_46"],
    [[5926.10, 5921.96], [5742.61, 4214.54], "ColorBlack", 8, "SectorMarker_47"],
    [[5742.61, 4214.54], [6130.02, 2964.11], "ColorBlack", 8, "SectorMarker_48"],
    [[5926.10, 5921.96], [5723.95, 7092.58], "ColorBlack", 8, "SectorMarker_49"],
    [[12800.76, 5956.39], [10179.03, 5834.32], "ColorBlack", 8, "SectorMarker_50"],
    [[10179.03, 5834.32], [9617.67, 5834.32], "ColorBlack", 8, "SectorMarker_51"],
    [[12800.76, 5956.39], [12800.76, 4067.43], "ColorBlack", 8, "SectorMarker_52"],
    [[12800.76, 5956.39], [12800.76, 8095.74], "ColorBlack", 8, "SectorMarker_53"],
    [[6674.06, 2081.45], [6767.36, 1292.69], "ColorBlack", 8, "SectorMarker_54"],
    [[6767.36, 1292.69], [6913.53, 3.13], "ColorBlack", 8, "SectorMarker_55"],
    [[6674.06, 2081.45], [6130.02, 2964.11], "ColorBlack", 8, "SectorMarker_56"],
    [[6674.06, 2081.45], [7711.24, 4453.99], "ColorBlack", 8, "SectorMarker_57"],
    [[9056.32, 5834.32], [7711.24, 4453.99], "ColorBlack", 8, "SectorMarker_58"],
    [[9056.32, 5834.32], [9617.67, 5834.32], "ColorBlack", 8, "SectorMarker_59"],
    [[8355.01, 3471.17], [7711.24, 4453.99], "ColorBlack", 8, "SectorMarker_60"],
    [[8355.01, 3471.17], [10287.88, 4766.99], "ColorBlack", 8, "SectorMarker_61"],
    [[10287.88, 4766.99], [12800.76, 4067.43], "ColorBlack", 8, "SectorMarker_62"],
    [[8355.01, 3471.17], [8886.82, 2700.40], "ColorBlack", 8, "SectorMarker_63"],
    [[8138.87, 3.13], [9418.63, 1929.64], "ColorBlack", 8, "SectorMarker_64"],
    [[9418.63, 1929.64], [8886.82, 2700.40], "ColorBlack", 8, "SectorMarker_65"],
    [[8138.87, 3.13], [6913.53, 3.13], "ColorBlack", 8, "SectorMarker_66"],
    [[28.59259, 4214.54], [1463.25, 4898.45], "ColorBlack", 8, "SectorMarker_67"],
    [[1463.25, 4898.45], [3616.93, 4453.99], "ColorBlack", 8, "SectorMarker_68"],
    [[3616.93, 4453.99], [4186.06, 6109.76], "ColorBlack", 8, "SectorMarker_69"],
    [[3616.93, 4453.99], [2657.49, 1881.13], "ColorBlack", 8, "SectorMarker_70"],
    [[3616.93, 4453.99], [4374.21, 3688.70], "ColorBlack", 8, "SectorMarker_71"],
    [[4374.21, 3688.70], [6130.02, 2964.11], "ColorBlack", 8, "SectorMarker_72"],
    [[4186.06, 6109.76], [3716.45, 7624.68], "ColorBlack", 8, "SectorMarker_73"],
    [[4904.47, 3.13], [2657.49, 1881.13], "ColorBlack", 8, "SectorMarker_74"],
    [[4904.47, 3.13], [6913.53, 3.13], "ColorBlack", 8, "SectorMarker_75"],
    [[20.72177, 7624.68], [1834.90, 7310.11], "ColorBlack", 8, "SectorMarker_76"],
    [[1834.90, 7310.11], [3716.45, 7624.68], "ColorBlack", 8, "SectorMarker_77"],
    [[20.72177, 7624.68], [12.23299, 9258.54], "ColorBlack", 8, "SectorMarker_78"],
    [[3716.45, 7624.68], [5772.16, 9302.36], "ColorBlack", 8, "SectorMarker_79"],
    [[3716.45, 7624.68], [3716.45, 8064.44], "ColorBlack", 8, "SectorMarker_80"],
    [[3716.45, 8064.44], [3803.53, 9591.88], "ColorBlack", 8, "SectorMarker_81"],
    [[5772.16, 9302.36], [6338.18, 9760.90], "ColorBlack", 8, "SectorMarker_82"],
    [[6338.18, 9760.90], [6977.28, 10081.73], "ColorBlack", 8, "SectorMarker_83"],
    [[5772.16, 9302.36], [5723.95, 7646.59], "ColorBlack", 8, "SectorMarker_84"],
    [[5723.95, 7646.59], [5723.95, 7092.58], "ColorBlack", 8, "SectorMarker_85"],
    [[5772.16, 9302.36], [5772.16, 10421.33], "ColorBlack", 8, "SectorMarker_86"],
    [[5772.16, 10421.33], [5212.36, 10931.52], "ColorBlack", 8, "SectorMarker_87"],
    [[3803.53, 9591.88], [1393.28, 8253.81], "ColorBlack", 8, "SectorMarker_88"],
    [[1393.28, 8253.81], [12.23299, 9258.54], "ColorBlack", 8, "SectorMarker_89"],
    [[3803.53, 9591.88], [3892.41, 9676.39], "ColorBlack", 8, "SectorMarker_90"],
    [[4691.43, 12790.74], [5212.36, 10931.52], "ColorBlack", 8, "SectorMarker_91"],
    [[6977.28, 10081.73], [8058.01, 8095.74], "ColorBlack", 8, "SectorMarker_92"],
    [[6977.28, 10081.73], [7722.13, 10677.99], "ColorBlack", 8, "SectorMarker_93"],
    [[7722.13, 10677.99], [8678.45, 10618.52], "ColorBlack", 8, "SectorMarker_94"],
    [[9617.67, 5834.32], [9284.90, 8095.74], "ColorBlack", 8, "SectorMarker_95"],
    [[9284.90, 8095.74], [12800.76, 8095.74], "ColorBlack", 8, "SectorMarker_96"],
    [[9284.90, 8095.74], [8058.01, 8095.74], "ColorBlack", 8, "SectorMarker_97"],
    [[9284.90, 8095.74], [8920.35, 9612.23], "ColorBlack", 8, "SectorMarker_98"],
    [[8058.01, 8095.74], [5723.95, 7092.58], "ColorBlack", 8, "SectorMarker_99"],
    [[8678.45, 10618.52], [8541.61, 12790.74], "ColorBlack", 8, "SectorMarker_100"],
    [[8678.45, 10618.52], [8920.35, 9612.23], "ColorBlack", 8, "SectorMarker_101"],
    [[8541.61, 12790.74], [10651.75, 12806.39], "ColorBlack", 8, "SectorMarker_102"],
    [[5212.36, 10931.52], [3892.41, 9676.39], "ColorBlack", 8, "SectorMarker_103"]
];

{
    _x call FUNC(drawline);
} forEach GVAR(SectorMarkers);
