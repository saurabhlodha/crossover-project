import DS from 'ember-data';

export default DS.Model.extend({
  description  : DS.attr('string'),
  request_id  : DS.attr('string'),
  status  : DS.attr('string'),
  user_id  : DS.attr('string'),
  
  user: function() {
    return this.store.find('user',this.get('user_id'));
  }.property('user_id')

});
