const students = []; // Array para armazenar dados dos alunos

function toggleVisibility(hideId, showId) {
    document.getElementById(hideId).classList.add('hidden');
    document.getElementById(showId).classList.remove('hidden');
}

function login(event) {
    event.preventDefault();
    const role = document.querySelector('select[name="role"]').value;
    if (role === "professor") {
        toggleVisibility('login-container', 'teacher-main-container');
    } else {
        toggleVisibility('login-container', 'student-main-container');
    }
}

function showRegister() {
    toggleVisibility('login-container', 'register-container');
}

function register(event) {
    event.preventDefault();
    toggleVisibility('teacher-register-container', 'view-students-container'); // Redireciona para ver alunos
}

function registerStudent(event) {
    event.preventDefault();
    const studentName = document.getElementById('student-name').value;
    const studentEmail = document.getElementById('student-email').value;
    const studentMatricula = document.getElementById('student-matricula').value;
    const studentPassword = document.getElementById('student-password').value;

    const student = {
        name: studentName,
        email: studentEmail,
        matricula: studentMatricula,
        password: studentPassword
    };
    students.push(student);

    alert(`Cadastro de aluno ${studentName} realizado com sucesso!`);
    updateStudentList(); 
    toggleVisibility('student-register-container', 'student-main-container'); // Redireciona para o painel do aluno
}

function updateStudentList() {
    const studentListContainer = document.getElementById('students-list');
    studentListContainer.innerHTML = ''; 

    students.forEach(student => {
        const studentProfile = document.createElement('div');
        studentProfile.className = 'profile';
        studentProfile.innerHTML = 
            `<div class="name">${student.name}</div>
            <div class="details">
                <p><strong>Email:</strong> ${student.email}</p>
                <p><strong>Matrícula:</strong> ${student.matricula}</p>
            </div>`;
        studentListContainer.appendChild(studentProfile);
    });
}

function showStudents() {
    toggleVisibility('teacher-main-container', 'view-students-container');
    updateStudentList(); 
}

function logout() {
    toggleVisibility('student-main-container', 'home-container');
}

function logoutTeacher() {
    toggleVisibility('teacher-main-container', 'home-container');
}

function showProfessors() {
    toggleVisibility('student-main-container', 'professors-container');
}

function cancelRegistration() {
    toggleVisibility('student-registration-container', 'teacher-main-container');
}
