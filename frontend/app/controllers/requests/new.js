import Ember from 'ember';
const { service } = Ember.inject;

export default Ember.Controller.extend({
  session: service('session'),
  actions : {

    addTicket() {
      var description = this.get('description');
      var status = 'open';
      var request_id = Math.random().toString(36).substr(2, 5);
      var user_id = this.get('session.data.authenticated.user.id');
      var id = this.get('session.data.authenticated.user.id');

        // create new ticket in app
        var newTicket = this.store.createRecord('request', {
          description : description,
          status : status,
          request_id : request_id,
          user_id  : user_id
        });
        // save on server
        newTicket.save();

        // clear fields
        this.setProperties({description: '', status: '', request_id: '', user_id: ''});

        // redirect to index
        this.transitionToRoute('requests');

      // }).catch(() => {
      //   console.log('errror!');
      // });

    }
  }
});
