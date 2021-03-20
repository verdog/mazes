class Cell {
    public var row(default, null):Int;
    public var column(default, null):Int;

    public var north:Null<Cell> = null;
    public var south:Null<Cell> = null;
    public var east:Null<Cell> = null;
    public var west:Null<Cell> = null;

    private var _links:Map<Cell, Bool>;

    public function new(row:Int, column:Int) {
        this.row = row;
        this.column = column;

        _links = new Map<Cell, Bool>();
    }

    public function link(cell:Cell, bidirectional:Bool = false) {
        _links[cell] = true;
        if (bidirectional == true) cell.link(this, false);
    }

    public function unlink(cell:Cell, bidirectional:Bool = false) {
        _links.remove(cell);
        if (bidirectional == true) cell.unlink(this, false);
    }

    public function links() {
        return _links.keys();
    }

    public function neighbors() {
        var r = [];
        if (north != null) r.push(north);
        if (south != null) r.push(south);
        if (east != null) r.push(east);
        if (west != null) r.push(west);
        return r;
    }

    public function isLinked(cell:Cell) {
        return _links.exists(cell);
    }
}