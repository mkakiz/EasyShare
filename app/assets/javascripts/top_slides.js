const top_slides = function() {
  var app = new Vue({
    el: '#top_slides',
    data: {
    //  slides: 3,
    //  slideData: [
    //    { text: 'Find', image: 'finditem.jpg' },
    //    { text: 'Message', image: 'messaging.jpg' },
    //    { text: 'Borrow', image: 'getitem.jpg' }
    //  ],
    //},
    slideData: [
      {text: 'Find', src: 'finditem.jpg'},
      {text: '', src: 'message.jpg'},
      {text: '', src: 'getitem.jpg'}
      ],
      texts: [
        'Find',
        'Message',
        'Borrow'
      ]
    },
    components: {
      'carousel-3d': Carousel3d.Carousel3d,
      'slide': Carousel3d.Slide,
    },
    //methods: {
    //  onAfterSlideChange(index){
    //    this.slideData.forEach((obj, objIndex) => {
    //      index == objIndex ? this.$set(this.slide, objIndex, slide.text)
    //      : this.$set(this.slide, objIndex, '');
    //    //this.descriptions.forEach((obj, objIndex) => {
    //    //  index == objIndex ? this.$set(this.descriptions, objIndex, 'current')
    //    //  : this.$set(this.descriptions, objIndex, '');
    //    });
    //  }
    //}
    methods: {
      onAfterSlideChange(currentIndex) {
        this.slideData = this.slideData.map(e => ({ src: e.src}))
        this.slideData[currentIndex]['text'] = this.texts[currentIndex]
      }
    }
  });
}
