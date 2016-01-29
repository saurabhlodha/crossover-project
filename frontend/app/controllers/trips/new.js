import Ember from 'ember';
import TripValidations from 'frontend/mixins/validations/trip';
const { service } = Ember.inject;

export default Ember.Controller.extend({
  session: service('session'),
  actions : {

    addTrip() {
      var destination = this.get('destination');
      var start_date = new Date(this.get('start_date'));
      var end_date = new Date(this.get('end_date'));
      var comment = this.get('comment');
      var user_id = this.get('user_id');
      var id = this.get('session.data.authenticated.user.id');
      user_id = ((user_id == undefined) ? id : user_id);
      console.log(user_id);

        // create new trip in app
        var newTrip = this.store.createRecord('trip', {
          destination : destination,
          start_date : start_date,
          end_date : end_date,
          comment : comment,
          user_id  : user_id
        });
        // save on server
        newTrip.save();

        // clear fields
        this.setProperties({destination: '', comment: '', start_date: '', end_date: '', user_id: ''});

        // redirect to index
        this.transitionToRoute('trips');

      // }).catch(() => {
      //   console.log('errror!');
      // });

    }
  }
});
