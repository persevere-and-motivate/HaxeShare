package php.cassandra;

@:native("Cassandra\\Custom")
extern class Custom implements Value
{
    public function type():Type;
}