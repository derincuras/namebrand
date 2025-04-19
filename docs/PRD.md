# NameBrand.app Product Requirements Document

**Version:** 1.2 (Freemium Model Update)  
**Date:** April 19, 2025  
**Status:** Draft  
**Author:** Gemini AI (based on user request)

## 1. Introduction

NameBrand.app is a web application designed to help individuals discover their unique personal brand identity derived from the etymology of their names. Users can freely generate a personal brand phrase based on name meanings. Optionally, users can purchase a comprehensive, downloadable Branding Kit containing their phrase, a custom color palette, and typography recommendations to provide a foundational visual identity, all accessible via NameBrand.app.

## 2. Goals

### User Goals
- Discover the meaning and origin of their names
- Create a unique and meaningful personal brand phrase (Free Tier)
- Optionally purchase a detailed, downloadable one-page Branding Kit containing:
  - Their phrase
  - Generated color palette
  - Typography suggestions (Paid Tier)
- Save their generated free phrases and access purchased kits
- Share their unique brand phrase discovery on social media

### Product Goals (Phase 1 - MVP)
- Acquire users interested in personal branding and self-discovery via the free phrase generation tool
- Provide a core free functional experience:
  - Name input
  - Meaning display
  - Phrase creation
  - Phrase saving
  - Phrase sharing
- Provide a clear path to purchase and deliver the paid Branding Kit
- Validate the perceived value of the paid Branding Kit
- Establish a foundation for future feature expansion

### Business Goals
- Build an initial user base through the free offering
- Generate revenue through the one-time sale of downloadable Branding Kits
- Achieve a target conversion rate from free phrase generation to paid kit purchase
- Explore potential future monetization avenues (premium features, integrations)

## 3. Target Audience
- Individuals seeking to define or refresh their personal brand (entrepreneurs, freelancers, creatives, professionals)
- Job seekers looking to articulate their personal value proposition
- Individuals interested in genealogy, etymology, or self-discovery
- Social media users looking for unique content to share
- Users looking for an affordable starting point for personal branding visuals

## 4. Functional Requirements

### Free Tier Features

#### 4.1 Landing Page & Name Input
- **FR1.1:** Display a clean, welcoming landing page explaining the value proposition
- **FR1.2:** Provide input fields for First Name, Middle Name (optional), and Last Name
- **FR1.3:** Include a clear "Submit" or "Discover Your Brand Phrase" button
- **FR1.4:** Include a "Login" link/button for returning users

#### 4.2 User Authentication & Account
- **FR2.1:** New User Flow: Prompt for email upon first name submission to save results
- **FR2.2:** Login: Provide email-based authentication
- **FR2.3:** Maintain user session across visits

#### 4.3 Name Etymology & Meaning Selection
- **FR3.1:** Query etymology data source/API for each name part
- **FR3.2:** Display meanings and origins for each name part
- **FR3.3:** Handle cases where etymology is not found
- **FR3.4:** Allow user to select preferred meaning for each name part

#### 4.4 Brand Phrase Creation
- **FR4.1:** Suggest 1-2 potential brand phrases based on selected meanings
- **FR4.2:** Provide interface for user to edit/create their own phrase
- **FR4.3:** Allow user to finalize and confirm their chosen brand phrase

#### 4.5 Saving & Sharing
- **FR5.1:** Allow logged-in users to save finalized brand phrases
- **FR5.2:** Provide sharing options for major platforms (Twitter, Facebook, LinkedIn)
- **FR5.3:** Pre-populate share messages with template

#### 4.6 User Dashboard
- **FR6.1:** Provide "My Brands" dashboard
- **FR6.2:** Display saved free brand phrases
- **FR6.3:** Allow viewing and re-sharing of saved phrases

### Paid Tier Features

#### 4.7 Branding Kit Purchase & Generation
- **FR7.1:** Display upsell prompt after phrase finalization
- **FR7.2:** Integrate secure payment processing
- **FR7.3:** Generate color palettes based on phrase/meanings
- **FR7.4:** Generate typography recommendations
- **FR7.5:** Create downloadable PDF guide
- **FR7.6:** Provide persistent access to purchased kits

## 5. Non-Functional Requirements
- **NFR1:** Security (Payment): PCI DSS compliance
- **NFR2:** Reliability: Consistent PDF generation
- **NFR3:** Performance: Fast page load times
- **NFR4:** Scalability: Handle growing user base
- **NFR5:** Accessibility: WCAG 2.1 compliance
- **NFR6:** Mobile Responsiveness: Full functionality on all devices
- **NFR7:** Data Privacy: GDPR compliance

## 6. Design & UX Considerations
- Clean, modern interface
- Intuitive user flow
- Clear value proposition
- Seamless free-to-paid transition
- Professional PDF design
- Mobile-first approach

## 7. Future Considerations
1. Enhanced Kit features
2. Print-on-Demand integration
3. Advanced customization options
4. Multiple etymology data sources
5. Community features
6. Premium subscription model
7. Simple logo/mark generation

## 8. Open Questions
- Final pricing for Branding Kit
- Payment gateway selection
- PDF design specifications
- Typography selection algorithm
- Color palette generation logic
- Error handling procedures
- Usage rights scope

## 9. Success Metrics
- Unique users completing free phrase generation
- User registration rate
- Number of saved phrases
- Social shares
- Paid Kit conversion rate
- Total revenue
- Average Revenue Per Paying User (ARPPU)
- User retention rate
- Qualitative feedback

## 10. Release Criteria
- All Free Tier features implemented and tested
- All Paid Tier features implemented and tested
- Secure payment processing
- Reliable PDF generation
- Core NFRs met
- Smooth user flows
- Analytics tracking in place
- Legal documentation complete

