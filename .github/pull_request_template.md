##### [Changelog](https://github.com/judgeme/internal/wiki/Update-Changelog):
1. PUB - Brief explanation for PUBlic users to know (if any) - https://app.asana.com/xxxxxxxxxx
2. INT - Brief explanation for INTernal team members to know (if any) - https://app.asana.com/xxxxxxxxxx
3. DEV - Brief explanation for internal DEVelopers to know (if any) - https://app.asana.com/xxxxxxxxxx


##### Deploy notes (if any):
- Run this code: `Abc::Xyz.perform`
- Add these ENVs: `abc` = `123`


##### Proofs of designer approval (for design-heavy changes):
- *Design-heavy changes need approval from the designers first. Therefore, show here any proofs of designer approval.*
- *Proofs can be in any form, e.g. a link to Slack message, or a screenshot of designer approval.*


##### Screenshots (if any):
- Screenshots to show the new UI that is done in this PR, or
- Screenshots to show proof that this PR has been tested.


##### Checklist before submitting PR:
- [ ] **I've code reviewed this PR of mine**
  - I've looked through all if my changed code in this PR.
  - Because I know if I don't review my own code, I don't deserve others reviewing my code.
- [ ] **I've asked designers for approval**, if my changes are design heavy. Otherwise, I may upset the designers.
- [ ] **I've tested ALL the changes**, even if my changes are tiny, just a single space.
- [ ] **I've restarted Sidekiq before testing**, when the changed code is in Sidekiq.
  - Because without restarting Sidekiq, the changed code doesn't take effect in Sidekiq, which means I have only tested the old code.
- [ ] **I'm sure my bug fix doesn't cause any other bugs**
  - When fixing a bug, I've tested not only the case when the bug happens, but also I've tested the normal and happy cases.
- [ ] **I've added/updated automatic tests** in `rspec` folder
