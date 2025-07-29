# Subtasks

| ID    | Title | Score | Status | # of Dependencies |
|-------|-------|-------|--------|-------------------|
| ST-01 | Create scoreboard objectives for each aura category | 3 | Completed | 0 |
<!-- - Create scoreboard objectives for all 6 aura categories
- Set up initialization function
- Test scoreboard creation and access -->

| ST-02 | Implement basic commands for aura manipulation | 2 | Completed | 1 |
<!-- - Create command structure
- Implement set/add/remove operations
- Add basic error handling -->

| ST-03 | Create player join initialization | 2 | Completed | 1 |
<!-- - Set up join events
- Initialize player scores
- Test initialization flow -->

| ST-04 | Add aura bounds checking (0-100) | 1 | Completed | 1 |

| ST-05 | Design command book layout | 2 | In Progress | 0 |
<!-- - [x] Create basic book structure with title and author
- [ ] Design main menu page with category buttons
- [ ] Create category pages for each aura type
- [ ] Implement navigation between pages
- [ ] Add visual feedback for current aura levels
- [ ] Test book usability and readability
- [ ] Add help/instructions page
- [ ] Implement proper formatting and colors
- [ ] Add version information
- [ ] Test with different screen sizes and locales -->

| ST-06 | Implement clickable book actions | 2 | Not Started | 5 |
<!-- - Implement click handlers
- Add command execution
- Create visual feedback
- Test all actions -->

| ST-07 | Create book distribution system | 1 | In Progress | 5 |

| ST-08 | Implement passive decay timer (60s) | 3 | In Progress | 1 |
<!-- - Create 60-second timer function
- Implement decay calculation per category
- Add bounds checking (0-100)
- Test decay rates and timing -->

| ST-09 | Add time advance functionality | 2 | Not Started | 2 |
<!-- - Create time commands
- Add cooldown system
- Implement visual feedback
- Test time changes -->

| ST-10 | Create decay rate configuration | 1 | Not Started | 1 |

| ST-11 | Implement status effect system | 3 | Not Started | 1 |
<!-- - Map auras to status effects
- Create effect application logic
- Implement effect removal
- Test effect stacking and interactions -->

| ST-12 | Create boss bar display | 2 | Not Started | 1 |
<!-- - Design layout
- Implement value display
- Add color coding
- Test updates -->

| ST-13 | Add particle effects | 2 | Not Started | 1 |
<!-- - Design particle types
- Implement spawning logic
- Add intensity scaling
- Test performance -->

| ST-14 | Implement weather control | 2 | Not Started | 1 |
<!-- - Create weather commands
- Add aura requirements
- Implement duration control
- Test transitions -->

| ST-15 | Create recipe locking system | 3 | Not Started | 1 |
<!-- - Define locked recipes per category
- Create requirement checking
- Implement unlocking mechanism
- Add visual feedback for locked recipes -->

| ST-16 | Add advancement-based unlocks | 2 | Not Started | 1 |
<!-- - Define unlock conditions
- Create advancements
- Implement rewards
- Test unlocking -->

| ST-17 | Implement Health category effects | 2 | Not Started | 4 |
| ST-18 | Implement Intelligence category effects | 2 | Not Started | 4 |
| ST-19 | Implement Creativity category effects | 2 | Not Started | 4 |
| ST-20 | Implement Organization category effects | 2 | Not Started | 4 |
| ST-21 | Implement Social category effects | 2 | Not Started | 4 |
| ST-22 | Implement Productivity category effects | 2 | Not Started | 4 |
<!-- For each category above:
- Define effects
- Implement logic
- Test interactions
- Balance values -->

| ST-23 | Create Magnet Compass item | 3 | Not Started | 6 |
<!-- - Design compass functionality
- Implement aura requirements
- Create visual effects
- Test behavior and performance -->

| ST-24 | Implement Portable Backpack | 3 | Not Started | 6 |
<!-- - Design storage system
- Implement aura requirements
- Create GUI interface
- Test item persistence -->

| ST-25 | Add Tameable Animal Helper | 2 | Not Started | 6 |
<!-- - Design behavior
- Implement requirements
- Create interactions
- Test AI -->

| ST-26 | Optimize command execution | 2 | Not Started | 0 |
<!-- - Profile performance
- Find bottlenecks
- Implement fixes
- Test improvements -->

| ST-27 | Add error handling and logging | 2 | Not Started | 26 |
<!-- - Create logging
- Add validation
- Implement recovery
- Test errors -->

## Adding a New Subtask
1. Add a new row to the table
2. Fill in the columns:
   - **ID**: Unique identifier (e.g., ST-001)
   - **Title**: Brief subtask title
   - **Score**: Story points or complexity score
   - **Status**: Current status (Not Started, In Progress, Review, Done)
   - **# of Dependencies**: Number of other subtasks this one depends on

## Dependencies
- List any task IDs this subtask depends on in the description column
- Use the format: `Depends on: T-001, T-002`
