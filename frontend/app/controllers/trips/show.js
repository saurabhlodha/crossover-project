import Ember from 'ember';

export default Ember.Controller.extend({

  live_days: Ember.computed('clock.second', function () {
    var start = this.get('model.start_date');
    var now = new Date();
    if ((start == undefined) || (start < now)){
      return 0;
    }
    var days = Math.round((start-now)/(1000*60*60*24))
    return days;
  }),

});
