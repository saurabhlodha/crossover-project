import Ember from 'ember';

export default Ember.Controller.extend({
  actions : {
    deleteUser(id) {
      var self = this;
      this.store.findRecord('user', id).then(function(user) {
        user.deleteRecord();
        user.save();
        self.transitionToRoute('users');
      })
    }
  }
});
