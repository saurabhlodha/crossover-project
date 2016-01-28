import DS from 'ember-data';

export default DS.Model.extend({
  email     : DS.attr('string'),
  access_level      : DS.attr('string'),
  password  : DS.attr('string'),
  // trips : DS.hasMany('trip')
});
