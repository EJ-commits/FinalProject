window.onload = function() {

	const alter = document.getElementById('alter-button');
	const drop = document.getElementById('drop-button');
	
	const upload = document.getElementById('upload-file');
	
	const pbox = document.getElementById('upload-photo-box');
	const nbox = document.getElementById('upload-name');
	
	alter.onclick = function() {
	
		const input = document.getElementsByClassName('form-control');
		const check = document.getElementById('check-table');
		const tbox = document.getElementsByClassName('tip-box');
		const hbox = document.getElementsByClassName('hidden-box');
		const remove = document.getElementById('remove-button');
	
		alter.parentNode.removeChild(alter);
		drop.parentNode.removeChild(drop);
		
		for(let i = 0; i < tbox.length; ++i) {
			tbox[i].innerHTML = '';
		}
		
		input[2].parentNode.removeChild(input[2]);
		
		check.hidden = true;
		
		for(let i = 0; i < input.length; ++i) {
			input[i].disabled = false;
		}
		
		for(let i = 0; i < hbox.length; ++i) {
			hbox[i].hidden = false;
		}
		
		if(remove != null) {
		
			remove.hidden = false;
			
			remove.onclick = function() {
				
				pbox.innerHTML = '';
				nbox.textContent = '';
				
				const origin = document.getElementById('origin');
				const stored = document.getElementById('stored');
				
				origin.value = null;
				stored.value = null;
			
			};
		
		}
		
	}
	
	upload.onchange = function() {
		
		pbox.innerHTML = '';
		
		const file = upload.files[0];
		
		const img = document.createElement('img');
		const url = URL.createObjectURL(file);
		
		img.src = url;
		img.style.width = '130px';
		img.style.height = '130px';
		
		pbox.appendChild(img);
		
		const name = file.name;
		
		nbox.innerHTML = name + '&nbsp;<span class="glyphicon glyphicon-remove-circle" id="remove-button"></span>';
		
		const remove = document.getElementById('remove-button');
		
		remove.onclick = function() {
				
			upload.value = '';
			pbox.innerHTML = '';
			nbox.textContent = '';
			
			const origin = document.getElementById('origin');
			const stored = document.getElementById('stored');
				
			origin.value = null;
			stored.value = null;
		
		};
		
	};
	
	drop.onclick = function() {
		
		location.href= '/diary/delete';
		
	};

};