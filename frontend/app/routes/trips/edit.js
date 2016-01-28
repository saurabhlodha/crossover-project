import Ember from 'ember';

export default Ember.Route.extend({
  afterModel(model) {
    model.rollbackAttributes();
  }
});
