import Ember from 'ember';

export default Ember.Controller.extend({

  actions : {
    deleteTrip(id) {
      var self = this;
      this.store.findRecord('trip', id).then(function(trip) {
        trip.deleteRecord();
        trip.save();
        self.transitionToRoute('trips');
      });
    }
  }
});
