import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static targets = ["fields", "template"];
	static values = {
		minimum: Number,
		maximum: Number,
	};

	get setCount() {
		return this.fieldsTarget.children.length;
	}

	connect() {
		// no need for any operations, if there are 3 fields it returns 3, which is the index for 4th field
		this.nextIndex = this.setCount;
	}

	add() {
		if (this.setCount >= this.maximumValue) {
			return;
		}

		const newSet = document.importNode(this.templateTarget.content, true);

		this.updateSetIndexes(newSet, ":index", this.nextIndex++);

		this.fieldsTarget.appendChild(newSet);
	}

	remove(event) {
		if (this.setCount <= this.minimumValue) {
			return;
		}

		event.target.parentElement.remove();
	}

	updateSetIndexes(set, oldIndex, newIndex) {
		const labels = set.querySelectorAll("label");

		labels.forEach((label) => {
			const associated = set.getElementById(label.htmlFor);

			label.htmlFor = label.htmlFor.replace(oldIndex, newIndex);
			associated.id = associated.id.replace(oldIndex, newIndex);
			associated.name = associated.name.replace(oldIndex, newIndex);
		});
	}
}
