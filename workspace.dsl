workspace {

    model {
        student = person "Student/Client" "A user of my software system."
        tutor = person "Tutor/Content Author" "A user of my software system."
        admin = person "Admin" "A user of my software system."
        
        api = softwareSystem "REST API" {
            database = container "Database" "persistent database information (for example, users, payments, orders, courses, topics,  other metadata)"

            backend_app = container "API Application" "Provides All LMS functionality headlessly via a JSON/HTTPS REST API." "Laravel MVC" {
                    core = component "Core" "Allows ...." "Laravel Package"
                   
                }
        }
        admin_panel = softwareSystem "Admin Panel" 
        front = softwareSystem "Web App" 

        student -> front "Access courses"
        admin -> admin_panel "Administer"
        tutor -> admin_panel "Manage courses"
        tutor -> front "Communicates with students"
        admin_panel -> api "Communicates"
        front -> api "Communicates"

    }

    views {
        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
        }
    }

    
    
}