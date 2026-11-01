import Foundation

#if DEBUG

    extension Expense {
        static let samples: [Expense] = [
            sample("Groceries Migros",            "67.35",   daysAgo: 0,  .food),
            sample("Coffee",                      "4.80",    daysAgo: 0,  .food),
            sample("SBB ticket Zurich–Uster",     "8.80",    daysAgo: 1,  .transport),
            sample("Rent",                        "1850.00", daysAgo: 1,  .housing),
            sample("Netflix",                     "18.90",   daysAgo: 2,  .subscription),
            sample("Cinema",                      "21.00",   daysAgo: 3,  .entertainment),
            sample("Lunch with colleagues",       "28.50",   daysAgo: 4,  .food),
            sample("Bakery",                      "3.20",    daysAgo: 5,  .food),
            sample("Pharmacy",                    "15.40",   daysAgo: 6,  .health),
            sample("Groceries Coop",              "52.70",   daysAgo: 7,  .food),
            sample("Winter jacket",               "189.00",  daysAgo: 8,  .shopping),
            sample("Electricity bill",            "84.15",   daysAgo: 10, .housing),
            sample("Bar with friends",            "42.00",   daysAgo: 11, .entertainment),
            sample("Spotify",                     "12.95",   daysAgo: 13, .subscription),
            sample("Haircut",                     "45.00",   daysAgo: 15, .other),
            sample("Groceries Migros",            "73.10",   daysAgo: 16, .food),
            sample("Health insurance",            "389.50",  daysAgo: 18, .health),
            sample("Train to Lucerne",            "46.00",   daysAgo: 20, .transport),
            sample("Concert tickets for Saturday night at Hallenstadion", "129.00", daysAgo: 21, .entertainment),
            sample("Kebab",                       "14.50",   daysAgo: 22, .food),
            sample("Phone plan",                  "29.90",   daysAgo: 24, .subscription),
            sample("Bike repair",                 "60.00",   daysAgo: 25, .transport),
            sample("Books",                       "38.60",   daysAgo: 27, .shopping),
            sample("Groceries Coop",              "48.25",   daysAgo: 28, .food),
            sample("Rent",                        "1850.00", daysAgo: 31, .housing),
            sample("Netflix",                     "18.90",   daysAgo: 32, .subscription),
            sample("Birthday present",            "35.90",   daysAgo: 34, .shopping),
            sample("Dentist",                     "220.00",  daysAgo: 36, .health),
            sample("Bakery",                      "3.20",    daysAgo: 38, .food),
            sample("Sushi dinner",                "64.00",   daysAgo: 39, .food),
            sample("Spotify",                     "12.95",   daysAgo: 43, .subscription),
            sample("Gym membership",              "79.00",   daysAgo: 45, .subscription),
            sample("Groceries Migros",            "81.40",   daysAgo: 46, .food),
            sample("Health insurance",            "389.50",  daysAgo: 48, .health),
            sample("Museum entry",                "18.00",   daysAgo: 50, .entertainment),
            sample("Train to Bern",               "51.00",   daysAgo: 52, .transport),
            sample("Laundry detergent",           "12.90",   daysAgo: 54, .housing),
            sample("Running shoes",               "149.00",  daysAgo: 56, .shopping),
            sample("Coffee",                      "5.20",    daysAgo: 57, .food),
            sample("Internet",                    "49.00",   daysAgo: 59, .housing),
            sample("Rent",                        "1850.00", daysAgo: 61, .housing),
            sample("Netflix",                     "18.90",   daysAgo: 62, .subscription),
            sample("Groceries Coop",              "59.80",   daysAgo: 64, .food),
            sample("Taxi",                        "32.40",   daysAgo: 66, .transport),
            sample("Post office parcel",          "9.00",    daysAgo: 69, .other),
            sample("Spotify",                     "12.95",   daysAgo: 73, .subscription),
            sample("Wine for dinner party",       "27.50",   daysAgo: 75, .food),
            sample("Health insurance",            "389.50",  daysAgo: 78, .health),
            sample("ZVV monthly pass",            "128.00",  daysAgo: 80, .transport),
            sample("Escape room",                 "140.00",  daysAgo: 85, .entertainment),
        ]

        private static func sample(
            _ title: String,
            _ amount: String,
            daysAgo: Int,
            _ category: ExpenseCategory
        ) -> Expense {
            Expense(
                title: title,
                amount: Decimal(string: amount)!,
                date: Calendar.current.date(
                    byAdding: .day,
                    value: -daysAgo,
                    to: Date()
                )!,
                category: category
            )
        }
    }

#endif
