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
    circleRadius: PropTypes.number,
    foregroundColor: PropTypes.string,
    backgroundColor: PropTypes.string,
  },

  mixins: [NativeMethodsMixin],

  viewConfig: {
    uiViewClassName: 'UIView',
    validAttributes: ReactNativeViewAttributes.UIView
  },

  render: function() {
    let props = merge({
      progress: 0,
      lineWidth: 3,
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
  }
})

var RCTCircleProgress = requireNativeComponent('RCTCircleProgress', null);

module.exports = CircleProgress;
