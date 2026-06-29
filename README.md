# demo-rails-app

Minimal Rails 7.1 API app used to exercise the CI + (eventually) deployment
pipelines defined in [`demo-iac`](../demo-iac).

## Endpoints

| Method | Path     | Returns                                   |
| ------ | -------- | ----------------------------------------- |
| GET    | /health  | `{"status":"ok","time":"<iso8601>"}`      |
| GET    | /echo    | `{"message":"<message query param>"}`     |

## Run locally

```sh
bin/setup
bin/rails server   # http://localhost:3000/health
bin/rails test
```

## CI

PRs to `main` are picked up by the CodeBuild project provisioned in
`demo-iac/stacks/code-review`. That project clones this repo, runs
`buildspec.yml`, and reports pass/fail back as a GitHub status check.

## TODO — deployment & scaling (handled in demo-iac, not here)

This repo is also the guinea pig for the upcoming ECS work in `demo-iac`. The
infra repo will own:

- [ ] **Container image build** — separate CodeBuild project on push-to-main
      that builds a Docker image and pushes it to ECR.
- [ ] **ECS Fargate service** — task definition, service, ALB target group.
- [ ] **Auto scaling**:
  - Application Auto Scaling target tracking on average CPU (e.g. 60%).
  - Optional second policy on ALB `RequestCountPerTarget` for load-driven scaling.
  - Min/max task counts surfaced as Terraform vars so we can demo scale-out
    under synthetic load.
- [ ] **Load test harness** — a small `k6` or `hey` script in this repo so we
      can trigger scaling events on demand.

Nothing in this list is implemented yet. This README block is the source of
truth for what's coming next.
