## 1. Twitter data

### 1. 
#### Function

function (req, res) {
	Tweet.find().distinct('user', function (err, users) { 
     if (err) {
          res.send(err);
     } else {
     	const uniqueUsers = users.length;
          res.send(`${uniqueUsers}`);
     }
});
}
#### Result

659775 Users

### 2.

#### Function
function (req, res) {
  Tweet.aggregate([
  {'$match':{'text':{'$regex':/@\w+/}}}, {'$addFields': {"users":1}},{'$group':{"_id":"$user", "users":{'$sum':1}}}, {'$sort':{"users":-1}}, ])
  .limit(10).exec(function(err, users){
    if (err) {
      res.send(err);
    } else {
      res.send(users);
    }
  }))}
#### Result
lost_dog, tweetpet, VioletsCRUK, what_bugs_u,tsarnick, SallytheShizzle, mcraddictal, Karen230683, keza34, TraceyHewins


### 3. 
#### Function
function (req, res) {
Tweet.aggregate([
    {'$addFields': {'mentioned':{'$split':['$text', ' ']}}},
    {'$unwind':"$mentioned"}, 
    {'$match':{'mentioned':{'$regex':/@\w+/,'$options':'m'}}}, 
    {'$group':{'_id':"$mentioned",'total':{'$sum':1}}},
    {'$sort':{'total':-1}} ])
      .limit(5).exec(function(err, users){
      if (err) {
      res.send(err);
    } else {
      res.send(users);
    }
    }))}

#### Result
@mileycyrus, @tommcfly, @ddlovato, @DavidArchie, @Jonasbrothers

### 4. 
#### Function
function (req, res) {
  Tweet.aggregate([{'$group':{
    _id:"$user",count:{$sum:1}}},
    {$sort:{count:-1}}
  ]).limit(10)
  .exec(function(err, users){
  if (err) {
      res.send(err);
    } else {
      res.send(users);
    }
    }))}
#### Result
lost_dog, webwoke,tweetpet, SallytheShizzle, VioletsCRUK, mcraddictal,tsarnick, what_bugs_u, Karen230683, DarkPiano has made 236 tweets


### 5. a)
#### Function
function (req, res) {
Tweet.aggregate([
    {'$group':{'_id':"$user", 'polarity': {'$avg': "$polarity"}, 'pos': {'$sum': 1}}},
    {'$sort':{ 'polarity': 1, 'pos':-1}}
]).limit(5)
.exec(function(err, users){
      if (err) {
      res.send(err);
    } else {
      res.send(users);
    }
    }))}
#### Result
what_bugs_, DarkPiano, VioletsCRUK, 872tsarnick, 848keza34

### 5. b)
#### Function
Tweet.aggregate([
    {'$group':{'_id':"$user", 'polarity': {'$avg': "$polarity"}, 'Grumpy': {'$sum': 1}}},
    {'$sort':{ 'polarity': 1, 'Grumpy':-1}}
]).limit(5).exec(function(err, users){
      if (err) {
      res.send(err);
    } else {
      res.send(users);
    }
    }))}

#### Result
lost_dog, tweetpet, TheAmazingCat, nova937music, Nathan133

## 2. Modeling

Model | Atomicity | Sharding |Indexes |Large Number of Collections | Collection Contains Large Number of Small Documents
----|:----:|:----:|:----:|:----:|:----:
Arrays of Ancestors	|x| |x|x| |
Materialized paths  | |x ||x|x|
Nested sets			|x|x|x|| |
