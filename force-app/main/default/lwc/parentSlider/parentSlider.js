import { LightningElement, track } from 'lwc';

export default class ParentSlider extends LightningElement {
    @track slides = [
        {
            "image": "https://www.buffsci.org/img/newImgs/features-11.jpg",
            "heading": "High School Education System",
            "description": "It's new for me also"
        }, {
            "image": "https://www.buffsci.org/img/newImgs/intro-img_v3.png",
            "heading": "Middle School Education System",
            "description": "so what are you thinking"
        }, {
            "image": "https://www.buffsci.org/img/newImgs/about-img_choice.jpg",
            "heading": "Next school",
            "description": "It's ok for 1-10"
        
        }
      ];
}