import Ember from 'ember';

export default Ember.Controller.extend({

  actions : {
    deleteTicket(id) {
      var self = this;
      this.store.findRecord('request', id).then(function(ticket) {
        ticket.deleteRecord();
        ticket.save();
        self.transitionToRoute('requests');
      });
    }
  }
});
