package armory.logicnode;

class GateNode extends LogicNode {

	public var property0:String;

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run() {

		var v1:Dynamic = inputs[1].get();
		var v2:Dynamic = inputs[2].get();
		var cond = false;

		switch (property0) {
		case "Equal":
			cond = v1 == v2;
		case "Not Equal":
			cond = v1 != v2;
		case "Greater":
			cond = v1 > v2;
		case "Greater Equal":
			cond = v1 >= v2;
		case "Less":
			cond = v1 < v2;
		case "Less Equal":
			cond = v1 <= v2;
		case "Or":
			for (i in 1...inputs.length) {
				if (inputs[i].get()) {
					cond = true;
					break;
				}
			}
		case "And":
			cond = true;
			for (i in 1...inputs.length) {
				if (!inputs[i].get()) {
					cond = false;
					break;
				}
			}
		}

		if (cond) super.run();
	}
}
