## 0.2.2
* Added `offstage` as `Widget` extension method
* Added `neumorphism` widget as `Widget` extension method
* [Breaking] Changed `scale` method to accept directional scaling
* [Breaking] Renamed `stack` overflow parameter to clipBehavior 

## 0.2.1
* Added `aspectRatio`, `center`, `fittedBox`, `fractionallySizedBox`, `card`
* Added `seperator` to `toRow` and `toColumn` list methods

## 0.2.0
* Major code refactoring
* Added `parent` as `Widget` extension method
* Added animations for `overflow`
* [Breaking] Similar widgets no longer try to merge
* [Breaking] Changes `elevation` formula to match the material spec
* [Breaking] Renamed `constraints` to `constrained` to avoid nameclash
* [Breaking] Renamed `decoration` to `decorated` to avoid nameclash

## 0.1.3
* Added `flexible` as `Widget` extension method
* Fixed bug with `textStyle` not working correctly

## 0.1.2
* Added `expanded` as `Widget` extension method
* Added `positioned` as `Widget` extension method

## 0.1.1
* Added `textStyle` method to `Text` and `TextSpan`
* `TextSpan` methods updated to match `Text` methods
* Added `clipRect`
* Added `clipper` and `clipBehavior` to `clipRRect`

## 0.1.0+2
* Fixed gestures not working with `ripple`

## 0.1.0
* Added `Styled.icon` to be able to animate `Icon`
* Added `Styled.text` to be able to animate `Text`
* Changed `elevation` formula
* Changed `animate` parameters from named to "unnamed" and required

## 0.0.8
* Added `animation` for `backgroundColor`, `backgroundImage`, `backgroundGradient`, `backgroundLinearGradient`, `backgroundRadialGradient`, `backgroundSweepGradient`, `backgroundBlendMode`, `border`, `boxShadow`, `width` and `height`
* [fix] `transform` animation crashes app

## 0.0.7
* Added `animate`
* Added `border`
* Added more parameters to `ripple`
* Added `toColumn`, `toRow` and `toStack` to [List]
* Renamed `isTap` to `onTapChange`
* Changed `elevation` behaviour to match material design standard
* [Breaking] Removed `duration` and `curve` parameters from all methods in favor of `animate` method

## 0.0.6
* Added `animatedText` to implicitly animate text when property value changes
* Animated `borderRadius` and `backgroundBlur`
* Multiple `boxShadow` methods will now merge together instead of replacing
* Added `textWidthBasis` method to [Text]
* Added `textElevation`

## 0.0.5
* Added styling methods for [TextSpan]

## 0.0.4
* Added `linearGradient`, `radialGradient`, `sweepGradient`, `backgroundBlendMode`, `backgroundImage`, `scrollable`
* Merges similar widgets together
* Minor improvements and fixes

## 0.0.3
* Added animations for all [widget] methods supporting animations
* Added more methods

## 0.0.2
* Added more basic widgets
* Added some animated widgets

## 0.0.1
* Initial consept
