<select class="number_page form-control" data-show-content="true">
                                  <option <?php if($_SESSION['number_per_page'] == 20) echo 'selected' ?>  value="20">20</option>
                                  <option <?php if($_SESSION['number_per_page'] == 40) echo 'selected' ?> value="40">40</option>
                                  <option <?php if($_SESSION['number_per_page'] == 60) echo 'selected' ?> value="60">60</option>
                                  <option <?php if($_SESSION['number_per_page'] == 80) echo 'selected' ?> value="80">80</option>
</select>