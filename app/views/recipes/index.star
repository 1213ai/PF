        <div>
           <div class="star-group">
             <div class="detail-review">甘</div>
             <div class="detail-value", id="star1-<%= recipe.id %>"></div>
             </div>
             <script>
               $('#star1-<%=recipe.id %>').raty({
                size: 10,
                starOff: "<%= asset_path('star-off.png') %>",
                starOn: "<%= asset_path('star-on.png') %>",
                starHalf: "<%= asset_path('star-half.png') %>",
                half: true,
                readOnly: true,
                score: <%= recipe.sweetness %>,
               });
             </script>
             <%= recipe.sweetness %>
            </div>

            <div>
             <div class="star-group">
                <div class="detail-review">辛</div>
                <div class="detail-value", id="star2-<%= recipe.id %>"></div>
             </div>
             <script>
                $('#star2-<%= recipe.id %>').raty({
                 size: 10,
                 starOff: "<%= asset_path('star-off.png') %>",
                 starOn: "<%= asset_path('star-on.png') %>",
                 starHalf: "<%= asset_path('star-half.png') %>",
                 half: true,
                 readOnly: true,
                 score: <%= recipe.spicy %>,
                });
             </script>
              <%= recipe.spicy %>
           </div>

           <div>
             <div class="star-group">
               <div class="detail-review">塩</div>
               <div class="detail-value", id="star3-<%= recipe.id %>"></div>
              </div>
              <script>
                $('#star3-<%= recipe.id %>').raty({
                  size: 10,
                  starOff: "<%= asset_path('star-off.png') %>",
                  starOn: "<%= asset_path('star-on.png') %>",
                  starHalf: "<%= asset_path('star-half.png') %>",
                  half: true,
                  readOnly: true,
                  score: <%= recipe.salty %>,
                });
             </script>
              <%= recipe.salty %>
           </div>

           <div>
              <div class="star-group">
                <div class="detail-review">渋</div>
                <div class="detail-value", id="star4-<%= recipe.id %>"></div>
              </div>
              <script>
               $('#star4-<%= recipe.id %>').raty({
                 size: 10,
                 starOff: "<%= asset_path('star-off.png') %>",
                 starOn: "<%= asset_path('star-on.png') %>",
                 starHalf: "<%= asset_path('star-half.png') %>",
                 half: true,
                 readOnly: true,
                 score: <%= recipe.bitter_taste %>,
                });
              </script>
              <%= recipe.bitter_taste %>
           </div>

           <div>
             <div class="star-group">
                <div class="detail-review">酸</div>
                <div class="detail-value", id="star5-<%= recipe.id %>"></div>
             </div>
             <script>
               $('#star5-<%= recipe.id %>').raty({
                 size: 10,
                 starOff: "<%= asset_path('star-off.png') %>",
                 starOn: "<%= asset_path('star-on.png') %>",
                 starHalf: "<%= asset_path('star-half.png') %>",
                 half: true,
                 readOnly: true,
                 score: <%= recipe.acidity %>,
                });
             </script>
              <%= recipe.acidity %>
           </div>
          </div>