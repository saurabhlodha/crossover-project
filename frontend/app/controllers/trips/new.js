import Ember from 'ember';
import TripValidations from 'frontend/mixins/validations/trip';

export default Ember.Controller.extend({
  
  actions : {

    addTrip() {
      var destination = this.get('destination');
      var start_date = this.get('start_date');
      var end_date = this.get('end_date');
      var comment = this.get('comment');
      console.log(destination);
      console.log(start_date);
      // run validations
      // this.validate().then(() => {

        // create new trip in app
        var newTrip = this.store.createRecord('trip', {
          destination : destination,
          start_date : start_date,
          end_date : end_date,
          comment : comment
        });

        // save on server
        newTrip.save();

        // clear fields
        this.setProperties({destination: '', comment: '', start_date: '', end_date: ''});

        // redirect to index
        this.transitionToRoute('trips');

      // }).catch(() => {
      //   console.log('errror!');
      // });

    }
  }
});
