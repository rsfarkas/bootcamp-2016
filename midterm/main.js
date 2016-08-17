function jobDes(){

	var job = document.getElementById('title');

	if(job.classList.contains('beenClicked') == false){
		job.insertAdjacentHTML('beforeend',"<h1 style='color:white'>Developer || Designer</h1>");
	}

	job.className += ' beenClicked';
}
