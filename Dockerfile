FROM ruby:3.2-alpine

RUN addgroup --system fibscale \
 && adduser --system --ingroup fibscale fibscale

WORKDIR /fibscale

RUN apk add --no-cache g++ make patch

COPY --chown=fibscale:fibscale ./ ./

RUN chown -R fibscale:fibscale /fibscale

USER fibscale

RUN bundle install

EXPOSE 3000

CMD ["ruby", "fibscale.rb"]
