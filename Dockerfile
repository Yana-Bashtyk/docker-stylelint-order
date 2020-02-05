FROM node:13-alpine
LABEL maintainer="yankabashtyk16@gmail.com" \
      version="1.0" \
      docker.cmd="docker run --rm -it -v $(pwd):/app yanabashtyk/stylelint"

# Add required stylelint packages
RUN npm install -g stylelint stylelint-config-standard stylelint-order stylelint-config-rational-order \
    && mkdir -p /stylelint

# Setup stylelint entrypoint and default styleint
COPY ./stylelint.sh /stylelint/stylelint.sh
COPY ./.stylelintrc /stylelint/.stylelintrc
RUN chmod +x /stylelint/stylelint.sh

WORKDIR /app

# Entrypoint for creation of .stylelintrc if not in existence
ENTRYPOINT ["/stylelint/stylelint.sh"]