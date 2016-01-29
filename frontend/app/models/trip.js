import DS from 'ember-data';

export default DS.Model.extend({
  destination  : DS.attr('string'),
  comment  : DS.attr('string'),
  start_date  : DS.attr('date'),
  end_date  : DS.attr('date'),
  user_id  : DS.attr('string'),

  live_days: function() {
    var start = this.get('start_date');
    var now = new Date();
    if ((start == undefined) || (start < now)){
      return 0;
    }
    var days = Math.round((start-now)/(1000*60*60*24));
    return days;
  }.property('start_date'),
  
  user: function() {
    return this.store.find('user',this.get('user_id'));
  }.property('user_id')

});
