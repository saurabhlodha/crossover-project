import DS from 'ember-data';

export default DS.Model.extend({
  email     : DS.attr('string'),
  access_level      : DS.attr('string'),
  password  : DS.attr('string'),
  // trips : DS.hasMany('trip')
  // upcoming_trips: function() {
  //   return this.store.query('trip', { q: { next: true } })
  // }.property('id')
});
