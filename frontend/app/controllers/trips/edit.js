import Ember from 'ember';
import TripValidations from 'frontend/mixins/validations/trip';

export default Ember.Controller.extend(TripValidations, {

  actions : {

    updateTrip(id) {
      var self = this;

      var destination = this.get('model.destination');
      var comment = this.get('model.comment');
      var start_date = this.get('model.start_date');
      var end_date = this.get('model.end_date');

      // // run validations
      this.validate().then(() => {
        // find the record
        this.store.findRecord('trip', id).then(function(trip) {

          // update the trip
          trip.set('destination', destination);
          trip.set('comment', comment);
          trip.set('start_date', start_date);
          trip.set('end_date', end_date)

          // save on the server
          trip.save().then(() => {
            // clear fields
            self.setProperties({destination: '', comment: '', start_date: '', end_date: ''});

            // redirect to index
            self.transitionToRoute('trips');
          }, ()=> {

            alert('Validation failed on server. Please try again.');
            self.model.rollbackAttributes();


          });

        });

      }, () => {
        
        alert('Validation failed on client side. Please try again.');
        self.model.rollbackAttributes();


      }).catch(() => {

        console.log('exception in trips : edit : updateTrip ');

      });
    }
    
  }

});
