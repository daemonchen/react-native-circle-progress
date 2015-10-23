'use strict';

var React = require('react-native');
var NativeModules = require('NativeModules');
var requireNativeComponent = require('requireNativeComponent');
var StyleSheet = require('StyleSheet');
var NativeMethodsMixin = require('NativeMethodsMixin');
var PropTypes = require('ReactPropTypes');
var ReactNativeViewAttributes = require('ReactNativeViewAttributes');
var merge = require('merge');

var CircleProgress = React.createClass({
  propTypes: {
    progress: PropTypes.number,
    lineWidth: PropTypes.number,
    lineCap: PropTypes.string,
    circleRadius: PropTypes.number,
    foregroundColor: PropTypes.string,
    backgroundColor: PropTypes.string,
  },

  mixins: [NativeMethodsMixin],

  viewConfig: {
    uiViewClassName: 'UIView',
    validAttributes: ReactNativeViewAttributes.UIView,
  },

  render: function() {
    let props = merge({
      progress: 0,
      lineWidth: 3,
      lineCap: NativeModules.CircleProgressManager.LineCapRound,
      circleColor: 'blue',
      circleUnderlayColor: 'transparent',
    }, this.props);

    return (
      <RCTCircleProgress {...props}
        style={[styles.base, this.props.style]}/>
    );
  },
});

var styles = StyleSheet.create({
  base: {
    width: 50,
    height: 50,
  },
});

var RCTCircleProgress = requireNativeComponent('RCTCircleProgress', null);

CircleProgress.LineCapButt = NativeModules.CircleProgressManager.LineCapButt;
CircleProgress.LineCapRound = NativeModules.CircleProgressManager.LineCapRound;
CircleProgress.LineCapSquare = NativeModules.CircleProgressManager.LineCapSquare;
module.exports = CircleProgress;
