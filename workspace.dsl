workspace "Wellms World's First Headless LMS"  "The software architecture of the Wellms as Distributed Monolith" {
    name "Wellms World's First Headless LMS"
    description "The software architecture of the Wellms as Distributed Monolith"

    !docs docs
    !adrs adrs
    
    model {
        student = person "Student/Client" "A user that interact with courses."
        tutor = person "Tutor/Content Author" "A content creator and e-learnig tutor."
        admin = person "Admin" "Administrator of the systems."
        
        rest_api = softwareSystem "REST API" {
            database = container "Database" "persistent database information (for example, users, payments, orders, courses, topics,  other metadata)"
            redis = container "Queue and cache" "queue and cache for data"
            noSql = container "logs" "logs for endpoints"
            nodejs = container "Node Microservice" "microservice for endpoints logis" {
                mjml = component "framework that makes responsive email easy"
            }
            ffmpeg = container "Video transcoder" "video transcoder"
            
            mail = container "Mailer" "mailer for sending emails"
            storage = container "Storage" "storage for files"
            image_processing = container "Image processing optimizers" "JpegOptim, Optipng, Pngquant 2, SVGO 1, Gifsicle, cwebp"
            trax = container "LRS" "learning record store"
            payment_gateway = container "Payment gateway" "payment gateway" {
                stripe = component "Stripe" "Stripe payments"
                p24 = component "Przelewy24" "Przelewy24 payments"
            }
            youtube_api = container "Youtube API" "youtube API"

            backend_app = container "API Application" "Provides All LMS functionality headlessly via a JSON/HTTPS REST API." "Laravel MVC" {  
                core = component "Core" "Laravel Package" "Core"
                auth = component "Auth" "Laravel Package" "Auth. User authentication. Roles & Permission Management"
                assign_without_account = component "Assign-without-account" "Laravel Package" "Package enabling accessing courses and products without having account."
                cart = component "Cart" "Laravel Package" "Cart. General shop management."
                categories = component "Categories" "Laravel Package" "Categories"
                consultations = component "Consultations" "Laravel Package" "Consultations. One to one conversation package with `jitsi`"
                courses = component "Courses" "Laravel Package" "Courses. and content package"
                courses_import_export = component "Courses-import-export" "Laravel Package" "Courses Import Export. ZIP package and duplicate feature."
                csv_users = component "Csv-users" "Laravel Package" "CSV-Users. Exporting and importing users in `.csv` format"
                fakturownia = component "Fakturownia" "Laravel Package" "Fakturownia-Integration. Generates Invoice from Fakturowania"
                files = component "Files" "Laravel Package" "Files. Uploading, deleting and reusing files."
                h5p = component "H5p" "Laravel Package" "H5P Headless."
                images = component "Images" "Laravel Package" "Images. Responsive and compressions processing module"
                invoices = component "Invoices" "Laravel Package" "Invoices generation."
                jitsi = component "Jitsi" "Laravel Package" "Jitsi."
                docker = component "Docker" "Laravel Package" "Docker Images."
                lrs = component "Lrs" "Laravel Package" "LRS xAPI Learning Record Stores"
                mailerlite = component "Mailerlite" "Laravel Package" "MailerLite. Customized group for LMS events"
                mattermost = component "Mattermost" "Laravel Package" "Mattermost."
                model_fields = component "Model-fields" "Laravel Package" "Model Fields. Extra attributes to any model"
                notifications = component "Notifications" "Laravel Package" "Notifications."
                pages = component "Pages" "Laravel Package" "Pages. Simple CMS."
                payments = component "Payments" "Laravel Package" "Payments. Facades that allows to connect payment gateways"
                permissions = component "Permissions" "Laravel Package" "Permissions and Roles."
                questionnaire = component "Questionnaire" "Laravel Package" "Questionnaire. Answers & Reports"
                reports = component "Reports" "Laravel Package" "Reports. Courses reports."
                scorm = component "Scorm" "Laravel Package" "Scorm. Attach Scorm packages to courses"
                settings = component "Settings" "Laravel Package" "Settings. Additional global fields of various types and other package setup"
                stationary_events = component "Stationary-events" "Laravel Package" "Stationary Events."
                tags = component "Tags" "Laravel Package" "Tags. Tagging for any Module"
                templates = component "Templates" "Laravel Package" "Templates."
                templates_certificates = component "Templates-certificates" "Laravel Package" "Templates-Certificates. Editing certificate templates"
                templates_email = component "Templates-email" "Laravel Package" "Templates-Email. Notification management with custom mjml templates."
                templates_pdf = component "Templates-pdf" "Laravel Package" "Templates-PDF. Templates in fabric.js frontend rendering format."
                templates_sms = component "Templates-sms" "Laravel Package" "Templates-SMS. Notification management with custom templates"
                topic_types = component "Topic-types" "Laravel Package" "Topic Types. List of possible Topic Types for Course content"
                tracker = component "Tracker" "Laravel Package" "Tracker."
                translations = component "Translations" "Laravel Package" "Translations. (not implemented)"
                video = component "Video" "Laravel Package" "Video Processing. Generation `hls` streaming formats"
                vouchers = component "Vouchers" "Laravel Package" "Vouchers. E-commerce vouchers to manage cart promotion"
                webinar = component "Webinar" "Laravel Package" "Webinar. Live video stream with `Jitsi` and `YouTube`"
                youtube = component "Youtube" "Laravel Package" "Youtube. Package Youtube integration"              
                   
                vouchers -> cart "relates on"
                payments -> cart "relates on"   
                assign_without_account -> cart "relates on"   

                courses_import_export -> courses "relates on"   
                topic_types -> courses "relates on"   
                questionnaire -> courses "relates on"   

                video -> topic_types "relates on"   
                scorm -> topic_types "relates on"

                assign_without_account -> courses "relates on" 

                reports -> courses "relates on"   
                reports -> cart "relates on"  

                permissions -> auth  "relates on"
                csv_users -> auth "relates on"

                jitsi -> webinar "relates on"

                templates_certificates -> templates "relates on"
                templates_email -> templates "relates on"
                templates_pdf -> templates "relates on"
                templates_sms -> templates "relates on"

                mailerlite -> templates_email "relates on"


                auth -> core "Core Dependecy"
                assign_without_account  -> core "Core Dependecy"
                cart -> core "Core Dependecy"
                categories -> core "Core Dependecy"
                consultations -> core "Core Dependecy"
                courses -> core "Core Dependecy"
                courses_import_export -> core "Core Dependecy"
                csv_users -> core "Core Dependecy"
                fakturownia -> core "Core Dependecy"
                files -> core "Core Dependecy"
                h5p -> core "Core Dependecy"
                images -> core "Core Dependecy"
                invoices -> core "Core Dependecy"
                jitsi -> core "Core Dependecy"
                docker -> core "Core Dependecy"
                lrs -> core "Core Dependecy"
                mailerlite -> core "Core Dependecy"
                mattermost -> core "Core Dependecy"
                model_fields -> core "Core Dependecy"
                notifications -> core "Core Dependecy"
                pages -> core "Core Dependecy"
                payments -> core "Core Dependecy"
                permissions -> core "Core Dependecy"
                questionnaire -> core "Core Dependecy"
                reports -> core "Core Dependecy"
                scorm -> core "Core Dependecy"
                settings -> core "Core Dependecy"
                stationary_events -> core "Core Dependecy"
                tags -> core "Core Dependecy"
                templates -> core "Core Dependecy"
                templates_certificates -> core "Core Dependecy"
                templates_email  -> core "Core Dependecy"
                templates_pdf -> core "Core Dependecy"
                templates_sms -> core "Core Dependecy"
                topic_types -> core "Core Dependecy"
                tracker -> core "Core Dependecy"
                translations -> core "Core Dependecy"
                video -> core "Core Dependecy"
                vouchers -> core "Core Dependecy"
                webinar -> core "Core Dependecy"
                youtube -> core "Core Dependecy"

            }

            images -> image_processing "use binary tools"
            video -> ffmpeg "use binary tools"
            webinar -> youtube_api "publish on youtube"
            webinar -> jitsi "generate rooms thought API"
            consultations -> jitsi "generate one-to-one jitsi URLs"
        }

        

        admin_panel = softwareSystem "Admin Panel" "Administration and course authoring panel" {
            admin_web_app = container "Admin Web App" "React Admin Panel" {
                admin_users = component "Users" "User management. Students, Tutors, Content Creators and Admins."

                admin_user_groups = component "User Groups " "User management. Creating of unlimited user groups to assign courses, webinars and other events access"

                admin_orders = component "Orders" "List of orders and their details"

                admin_payments = component "Payments" "List of orders and their details"

                admin_courses = component "Courses" "Courses management. courses attributes management, program creation - content authoring, import / export, products details, certifications, tags & categories, Questionaries, Statistics, Users/User Group access"

                admin_h5p = component "H5Ps" "H5P Management. Upload Export Content authoring"

                admin_scorm = component "SCORMs" "SCORM packages management"

                admin_consultations = component "Consultations" "One to one conversation management. Used to create jitsi meetings"

                admin_stationary_events = component "Stationary Events" "Manage stationary events."

                admin_products = component "Products" "Simple shop management , Product attributes, Pricing with Taxes, Creating single or bulk products, Promotions management, Users/User Group access, Product limitations"

                admin_webinars = component "Webinars" "Live Video Stream Management."

                admin_templates = component "Templates" "Management of various templates in database and assigning them to Events so that content based on these templates is automatically generated and/or sent to users. Supported channels: email,  push, sms, pdf (certificates)"

                admin_files = component "Files" "Files management. Reusable files."

                admin_categories = component "Categories" "General categories management."

                admin_settings = component "Settings." "management of application config keys for each package, unlimited creation of bespoke variables (text, boolean, image, json, file) consumed by frontend"

                admin_roles = component "Roles" "User roles and permissions (in admin panel)"

                admin_notifications = component "Notifications" "List of currently logged admin notification (system events) Management of users notification (system events)"

                admin_questionnaires = component "Questionnaires" "Management of Questionnaire that can be attached to courses. questions management, answer statistics"

                admin_vouchers = component "Vouchers" "Definition of Coupons that can be applied to User Cart before placing an Order, calculating a discount depending on multiple different, configurable rules."

                admin_reports = component "Reports" "List of LMS reports Courses money spent metric, Courses popularity metric, Courses seconds spent metric, Tutors popularity metric"

                admin_logs = component "Logs" "Audit Log. Tracking users API calls."
            }
        }

        sdk = softwareSystem "SDK" "Wellms Software Development Kit" {
            sdk_web = container "SDK Web App" "React SDK" 
            docker_images = container "Docker Images" "Docker Images"
            components = container "Components" "Components"
            fabric_js = container "Fabric JS" "Fabric JS"
            h5p_player = container "H5P Player" "H5P Player"
            cli = container "Command Line Interface" "Command Line Interface"
            front_demo = container "Frontend Demo" "Frontend Demo availabe to be extends into bespoke web app"

        }

        front = softwareSystem "Web App" "Wellms Front Course Access App" {
            front_mobile_app = container "Native/Hybrid Mobile Application"
            front_web_app = container "Front Admin Panel" 
        }

        student -> front "Access courses"
        admin -> admin_panel "Administer"
        tutor -> admin_panel "Manage courses"
        tutor -> front "Communicates with students"
        admin_panel -> rest_api "Communicates"
        front -> rest_api "Communicates"

        front_mobile_app -> rest_api "Communicates"
        front_web_app -> rest_api "Communicates"

        admin_web_app -> sdk_web "package json dependecy"
        front_web_app -> sdk_web "package json dependecy"
        front_web_app -> components "package json dependecy"

        #backend_app -> database "Reads from and writes to" "Postgres Protocol/SSL"

        #redis -> backend_app "Synchronize queue jobs"


        deploymentEnvironment "Live" {
            mobileLive = deploymentNode "Students's mobile device" "" "PWA, Hybrdm iOS or Android" {
                liveMobileAppInstance = containerInstance front_mobile_app
            }
            webLive = deploymentNode "Students's computer" "" "Web Browser" {
                liveSinglePageApplicationInstance = containerInstance front_web_app                
            }

            adminLive = deploymentNode "Tutor/Admin computer" "" "Web Browser" {
                liveAdminSinglePageApplicationInstance = containerInstance admin_web_app                
            }

            deploymentNode "Backend" "" "Wellms autoscale backend" {

                liveApi = deploymentNode "wellms-prod001" "" "" "" {
                    softwareSystemInstance rest_api
                }
                
                backendLive = deploymentNode "wellms-api***" "" "Ubuntu 16.04 LTS" ""  {
                    backendLiveWeb = deploymentNode "Nginx" {
                        liveBackendInstance = containerInstance backend_app
                    }
                    backendLiveQueue = deploymentNode "Supervisor Queue" "" "Laravel Horizon" {
                        liveBackendQueueInstance = containerInstance backend_app
                    }

                    deploymentNode "Supervisor Scheduler" "" "Cron jobs" {
                        liveBackendSchedulerInstance = containerInstance backend_app
                    }
                }
               
                deploymentNode "wellms-db01" "" "Ubuntu 16.04 LTS" {
                    primaryDatabaseServer = deploymentNode "Postgres - Primary" "" "Postgres" {
                        livePrimaryDatabaseInstance = containerInstance database
                    }
                }
                deploymentNode "wellms-db02" "" "Ubuntu 16.04 LTS" "Failover" {
                    secondaryDatabaseServer = deploymentNode "Postgres - Secondary" "" "Postgres" "Failover" {
                        liveSecondaryDatabaseInstance = containerInstance database "Failover"
                    }
                }

                redisLive = deploymentNode "Redis" {
                    liveRedisInstance = containerInstance redis
                }
                

                
            }


            redisLive -> backendLiveQueue

            primaryDatabaseServer -> secondaryDatabaseServer "Replicates data to"

            backendLive -> primaryDatabaseServer "Reads from and writes to" "Postgres Protocol/SSL"

            mobileLive -> backendLiveWeb "Communicates with" "Wellms API"
            webLive -> backendLiveWeb "Communicates with" "Wellms API"
            adminLive -> backendLiveWeb "Communicates with" "Wellms API"

            mobileLive -> liveApi "Communicates with" "Wellms API"
            webLive -> liveApi "Communicates with" "Wellms API"
            adminLive -> liveApi "Communicates with" "Wellms API"
        }
   

    }

    views {
               
        
        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
                background #08427b
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
        }
    }

    
    
}