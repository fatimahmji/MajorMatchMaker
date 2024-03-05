start :-
    writeln(" ========== Welcome to the major recommendation system! ==========="),
    writeln(" ========== Let's find the best major for you! ==========="),
    nl,
    main.

main :-
    askQuestion("Would you rather work solo or with a team?", [solo, team], Response1),
    (Response1 = solo -> question1; Response1 = team -> question2; invalid_input(),main),
    nl.

askQuestion(Question, Options, Response) :-
    write(Question),
    nl,
    writeln(Options),
    read(Response),
    (member(Response, Options) -> true; invalid_input).

question1 :-
    askQuestion("Are you a people person?", [yes, no], Response),
    (Response = yes -> question3; Response = no -> question4; invalid_input,question1).

question2 :-
    askQuestion("Do you follow your gut when it comes to life choices?", [yes, no], Response),
    (Response = yes -> question5; Response = no -> question4; invalid_input,question2).

question3 :-
    askQuestion("Do you love working with your hands?", [yes, no], Response),
    (Response = yes -> question6; Response = no -> question7; invalid_input,question3).

question4 :-
    askQuestion("Do you love learning new languages?", [yes, no], Response),
    (Response = yes -> question8; Response = no -> question9; invalid_input,question4).

question5 :-
    askQuestion("Do you consider yourself a leader?", [yes, no], Response),
    (Response = yes -> question9; Response = no -> question10; invalid_input,question5).

question6 :-
    askQuestion("Do you often wonder about life?", [yes, no], Response),
    (Response = yes -> question11; Response = no -> question12; invalid_input,question6).

question7 :-
    askQuestion("Do you like working with children?", [yes, no], Response),
    (Response = yes ->
        suggestMajor(["Education"]),
        more_about_the_major("Education"),exitQ;
     Response = no ->
        question13;
     invalid_input, question7).


question8 :-
    askQuestion("Do you consider math as a second language?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Math", "Engineering", "Computer Sciences"]),
     more_about_the_major("Math"), major("Engineering") , major("Computer Sciences") ,exitQ;
    Response = no -> suggestMajor(["English", "Foreign Language", "International Studies"]), more_about_the_major("English"), major("Foreign Language") , major("International Studies"),exitQ;
    invalid_input,question8).

question9 :-
    askQuestion("Can you convince people easily?", [yes, no], Response),
    (Response = yes -> question14; Response = no -> question15; invalid_input,question9).

question10 :-
    askQuestion("Are you good at reading people?", [yes, no], Response),
    (Response = yes -> question16; Response = no -> question17; invalid_input,question10).

question11 :-
    askQuestion("Do you enjoy doing experiments?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Chemistry", "Physics Sciences"]),
     more_about_the_major("Chemistry"), major("Physics Sciences"),exitQ;
    Response = no -> question22;
    invalid_input,question11).

question12 :-
    askQuestion("Do you like inventing new things?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Architecture"]), more_about_the_major("Architecture");
    Response = no -> writeln("Based on your answers, it is difficult to determine a specific major. Please consult with a career advisor."),exitQ;
    invalid_input,question12).

question13 :-
    askQuestion("Are you a big picture kind of person?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Sales and Marketing", "Business Management"]),
     more_about_the_major("Sales and Marketing"), major("Business Management"),exitQ;
     Response = no -> question24; invalid_input,question13).

question14 :-
    askQuestion("Are you interested in increasing sales?", [yes, no], Response),
    (Response = yes -> question25; Response = no -> question26; invalid_input,question14).

question15 :-
    askQuestion("Do you like working on a desk?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Administration"]),
     more_about_the_major("Administration"),exitQ;
    Response = no -> suggestMajor(["Communications and Journalism"]),
     more_about_the_major("Communications and Journalism"),exitQ;
    invalid_input,question15).

question16 :-
    askQuestion("Do you like to travel?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Communications and Journalism"]),
     more_about_the_major("Communications and Journalism"),exitQ;
    Response = no -> suggestMajor(["Psychology"]),
     more_about_the_major("Psychology"),exitQ;
    invalid_input,question16).

question17 :-
    askQuestion("Are you passionate about helping to improve health standards?", [yes, no], Response),
    (Response = yes -> question19; Response = no -> question18; invalid_input,question17).

question18 :-
    askQuestion("Do you like to try making new things?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Cooking"]),
     more_about_the_major("Cooking"),exitQ;
    Response = no -> question20;
    invalid_input,question18).

question19 :-
    askQuestion("Would you like to work directly with patients?", [yes, no], Response),
    (Response = yes -> question21; 
     Response = no -> suggestMajor(["Clinical Lab Science", "Public Health", "Health & Medical Admin"]),
     more_about_the_major("Clinical Lab Science"), major("Public Health") , major("Health & Medical Admin"),exitQ ;
    invalid_input,question19).

question20 :-
    askQuestion("Do you enjoy reading about history?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Anthropology", "History", "Geography"]),
     more_about_the_major("Anthropology"), major("History") , major("Geography"),exitQ;
    Response = no -> writeln("Based on your answers, it is difficult to determine a specific major. Please consult with a career advisor."),exitQ;
    invalid_input,question20).

question21 :-
    askQuestion("Do you like to travel?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Mental and social health services"]),
     more_about_the_major("Mental and social health services"),exitQ;
    Response = no -> suggestMajor(["Nursing", "Rehab and Therapy"]),
     more_about_the_major("Nursing"), major("Rehab and Therapy"),exitQ;
    invalid_input,question21).

question22 :-
    askQuestion("Is art important to you?", [yes, no], Response),
    (Response = yes -> question23; Response = no -> suggestMajor(["Philosophy"]),
     more_about_the_major("Philosophy"),exitQ;
    invalid_input,question22).

question23 :-
    askQuestion("Do you doodle a lot during class or while you're waiting?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Visual art", "Graphic design"]),
     more_about_the_major("Visual art"), major("Graphic design"),exitQ;
    Response = no -> writeln("Based on your answers, it is difficult to determine a specific major. Please consult with a career advisor."),exitQ;
    invalid_input,question23).

question24 :-
    askQuestion("Do you enjoy helping people?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Counseling"]),
     more_about_the_major("Counseling"),exitQ;
    Response = no -> question26;
    invalid_input,question24).

question25 :-
    askQuestion("Do you enjoy working with numbers?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Accounting and Finance"]),
     more_about_the_major("Accounting and Finance"),exitQ;
    Response = no -> suggestMajor(["Sales and Marketing", "Business Management"]),
     more_about_the_major("Sales and Marketing"), major("Business Management"),exitQ;
    invalid_input,question25).

question26 :-
    askQuestion("Is justice more important than mercy?", [yes, no], Response),
    (Response = yes -> suggestMajor(["Law and Legal Services", "Politics", "Public Admin"]),
     more_about_the_major("Law and Legal Services"), major("Politics") , major("Public Admin"),exitQ;
    Response = no -> suggestMajor(["Social Services"]),
     more_about_the_major("Social Services"),exitQ; invalid_input,question26).

suggestMajor(Majors) :-
    writeln("Based on your answers, the following major might be suitable for you:"),
    write(Majors).

invalid_input() :-
    writeln("Invalid Input! Please enter a valid response.").
 


more_about_the_major(Major) :-
    askQuestion("Would you like to know more about the major?", [yes, no], Response),
    (Response = yes -> major(Major) ; Response = no -> exitQ ; invalid_input, more_about_the_major(Major)).


exitQ :-
	 askQuestion("do you want to exit?", [yes, no], Response),
        (Response = yes -> write('Goodbye! we hope our system was helpful!!!!'), halt;
	 Response = no -> writeln(" ========== Welcome back to MajorMatchMaker! ==========="), start; invalid_input, exitQ).



% Major descriptions
%
%  Anthropology
major("Anthropology") :-
    writeln("Anthropology:"),
    writeln("The study of human origins, evolution, and diversity, encompassing cultural anthropology, archaeology, and biological anthropology.").

%  History
major("History") :-
    writeln("History:"),
    writeln("The exploration of past events and people, examining the causes and consequences of historical developments.").

% Geography
major("Geography") :-
    writeln("Geography:"),
    writeln("The study of the Earth's surface, its features, and its inhabitants, analyzing the relationship between humans and their environment.").

% Cooking
major("Cooking") :-
    writeln("Cooking:"),
    writeln("The art and science of food preparation, combining creativity, technical skills, and knowledge of nutrition and flavor.").

% Clinical Lab Science
major("Clinical Lab Science") :-
    writeln("Clinical Lab Science:"),
    writeln("The analysis of bodily fluids and tissues to diagnose and monitor diseases, utilizing scientific techniques and expertise.").

% Public Health
major("Public Health") :-
    writeln("Public Health:"),
    writeln("The promotion of health and well-being for populations, focusing on prevention, disease control, and health policy.").

% Health & Medical Admin
major("Health & Medical Admin") :-
    writeln("Health & Medical Admin:"),
    writeln("The management of healthcare organizations and services, ensuring efficient delivery of quality patient care.").

% Math
major("Math") :-
    writeln("Math:"),
    writeln("The study of numbers, patterns, and relationships, providing a foundation for science, engineering, and other fields.").

% Engineering
major("Engineering") :-
    writeln("Engineering:"),
    writeln("The application of scientific principles to design, develop, and build structures, machines, and systems.").

% Computer Sciences
major("Computer Sciences") :-
    writeln("Computer Sciences:"),
    writeln("The study of computers and computation, encompassing programming, algorithms, and hardware design.").

% English
major("English") :-
    writeln("English:"),
    writeln("The study of the English language, literature, and writing, developing critical thinking and communication skills.").

% Foreign Language
major("Foreign Language") :-
    writeln("Foreign Language:"),
    writeln("The study of a language other than native one, enhancing communication, cultural understanding, and global perspectives.").

% International Studies
major("International Studies") :-
    writeln("International Studies:"),
    writeln("The examination of global political, economic, and social issues, fostering international cooperation and diplomacy.").

% Communications and Journalism
major("Communications and Journalism") :-
    writeln("Communications and Journalism:"),
    writeln("The effective transmission of information through various media, including writing, editing, and broadcasting.").

% Psychology
major("Psychology") :-
    writeln("Psychology:"),
    writeln("The study of the human mind, behavior, and mental processes, exploring factors that influence human thinking and actions.").

% Mental and social health services
major("Mental and social health services") :-
    writeln("Mental and social health services:"),
    writeln("The provision of care and support for individuals with mental health challenges, promoting mental well-being and social integration.").

% Nursing
major("Nursing") :-
    writeln("Nursing:"),
    writeln("The care and support of patients, providing direct care, education, and advocacy for individuals experiencing health problems.").

% Rehab and Therapy
major("Rehab and Therapy") :-
    writeln("Rehab and Therapy:"),
    writeln("The restoration of function and mobility for individuals with physical or cognitive impairments, utilizing specialized techniques and interventions.").

% Administration
major("Administration") :-
    writeln("Administration:"),
    writeln("The management of organizations and resources, ensuring efficient operations and achieving goals.").

% Education
major("Education") :-
    writeln("Education:"),
    writeln("The facilitation of learning and development in individuals, promoting knowledge, skills, and personal growth.").

% Architecture
major("Architecture") :-
    writeln("Architecture:"),
    writeln("The design of buildings and structures, combining creativity, technical expertise, and consideration of functionality and aesthetics.").

% Chemistry
major("Chemistry") :-
    writeln("Chemistry:"),
    writeln("The study of matter and its properties, exploring the composition, structure, and transformations of substances.").

% Physics Sciences
major("Physics Sciences") :-
    writeln("Physics Sciences:"),
    writeln("The investigation of the fundamental principles of the universe, examining matter, energy, and interactions.").

% Philosophy
major("Philosophy") :-
    writeln("Philosophy:"),
    writeln("The study of fundamental questions about knowledge, reality, existence, and morality, fostering critical thinking and intellectual exploration.").

% Visual art
major("Visual art") :-
    writeln("Visual art:"),
    writeln("The creation of art forms that are visually perceived, including painting, drawing, sculpture, and photography.").

% Graphic design
major("Graphic design") :-
    writeln("Graphic design:"),
    writeln("The visual communication of ideas and messages through visual elements, such as typography, imagery, and layout.").

% Counseling
major("Counseling") :-
    writeln("Counseling:"),
    writeln("The provision of guidance and support to individuals facing personal or psychological challenges, promoting emotional well-being and personal growth.").

% Accounting and Finance
major("Accounting and Finance") :-
    writeln("Accounting and Finance:"),
    writeln("The management and analysis of financial information, ensuring financial stability and maximizing profitability.").

% Sales and Marketing
major("Sales and Marketing") :-
    writeln("Sales and Marketing:"),
    writeln("The promotion and sale of products or services, developing strategies to reach target audiences and achieve sales goals.").

% Business Management
major("Business Management") :-
    writeln("Business Management:"),
    writeln("The planning, organizing, and directing of business operations, ensuring efficient resource utilization and achieving organizational objectives.").

% Law and Legal Services
major("Law and Legal Services") :-
    writeln("Law and Legal Services:"),
    writeln("The application of legal principles to advise, represent, and defend individuals and organizations in legal matters.").

% Politics
major("Politics") :-
    writeln("Politics:"),
    writeln("The study and practice of power and governance, examining the distribution of power, policy formulation, and political systems.").

% Public Admin
major("Public Admin") :-
    writeln("Public Admin:"),
    writeln("The management of public institutions and services, ensuring effective and efficient delivery of services to citizens.").

% Social Services
major("Social Services") :-
    writeln("Social Services:"),
    writeln("The provision of support and assistance to individuals and families facing social challenges, promoting social justice and well-being.").


