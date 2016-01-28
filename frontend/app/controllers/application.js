import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Controller.extend({
  
  session: Ember.inject.service('session'),

  actions: {
    invalidateSession() {
      this.get('session').invalidate();
    }
  }
  
});
