class CollisionDetec{
  Player p;
  ArrayList<EnemyRock> e;
  CollisionDetec(){}
  void update(Player player, ArrayList<EnemyRock> enemies){
    p = player;
    e = enemies;
    
  }
}