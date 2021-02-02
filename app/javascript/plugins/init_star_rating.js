import "jquery-bar-rating";

const initStarRating = () => {
  $('#review_rating').barrating({
    theme: 'css-stars'
  });
};

const initStarRatingAgain = () => {
  $('#public_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
export { initStarRatingAgain };
