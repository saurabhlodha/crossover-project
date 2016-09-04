import Ember from 'ember';
import RequestValidations from 'frontend/mixins/validations/request';

export default Ember.Controller.extend(RequestValidations, {

  start_date: Ember.computed(function () {
    var start_date = this.get('model.start_date');
    start_date = new Date(start_date);
    return moment(start_date).format("YYYY-MM-DD");
  }),

  end_date: Ember.computed(function () {
    var end_date = this.get('model.end_date');
    end_date = new Date(end_date);
    return moment(end_date).format("YYYY-MM-DD");
  }),

  actions : {

    updateTicket(id) {
      var self = this;

      var description = this.get('model.description');
      var status = this.get('model.status');

      // // run validations
      this.validate().then(() => {
        // find the record
        this.store.findRecord('request', id).then(function(request) {

          // update the ticket
          request.set('description', description);
          request.set('status', status);

          // save on the server
          request.save().then(() => {
            // clear fields
            self.setProperties({description: '', request_id: '', status: ''});

            // redirect to index
            self.transitionToRoute('requests');
          }, ()=> {

            alert('Validation failed on server. Please try again.');
            self.model.rollbackAttributes();


          });

        });

      }, () => {
        
        alert('Validation failed on client side. Please try again.');
        self.model.rollbackAttributes();


      }).catch(() => {

        console.log('exception in requests : edit : updateTicket ');

      });
    }
    
  }

});
