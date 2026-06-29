# Copyright 2026 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import logging
import json
import base64
from fastapi import FastAPI, Request
from starlette.middleware.base import BaseHTTPMiddleware
from google.adk.cli.fast_api import get_fast_api_app

# 1. Logging setup using standard Python logging for console logs
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s"
)
logger = logging.getLogger("expense-reviewer")

# 2. Middleware to normalize Pub/Sub subscription path to short name
class PubSubNormalizationMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next):
        # We target the specific Pub/Sub trigger endpoint
        if "/trigger/pubsub" in request.url.path and request.method == "POST":
            body = await request.body()
            if body:
                try:
                    payload = json.loads(body.decode("utf-8"))
                    if "subscription" in payload and payload["subscription"]:
                        original_sub = payload["subscription"]
                        # Extract the final component of the path
                        normalized_sub = original_sub.split("/")[-1]
                        payload["subscription"] = normalized_sub
                        
                        logger.info(
                            f"Normalized subscription path: '{original_sub}' -> '{normalized_sub}'"
                        )
                        
                        new_body = json.dumps(payload).encode("utf-8")
                        async def receive():
                            return {
                                "type": "http.request",
                                "body": new_body,
                                "more_body": False
                            }
                        request._receive = receive
                except Exception as e:
                    logger.error(f"Error normalizing Pub/Sub subscription: {e}")
        return await call_next(request)

# Define root directory containing the app folder
AGENT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# 3. Create the FastAPI app wrapped with ADK
app: FastAPI = get_fast_api_app(
    agents_dir=AGENT_DIR,
    web=True,              # Exposes dev UI/playground
    otel_to_cloud=False,   # Telemetry: Disable cloud export
    trigger_sources=["pubsub"], # Enable Pub/Sub trigger route
)

# Mount the normalization middleware
app.add_middleware(PubSubNormalizationMiddleware)
app.title = "expense-reviewer"
app.description = "API for interacting with the Expense Reviewer Agent"

if __name__ == "__main__":
    import uvicorn
    # Serving on port 8080
    uvicorn.run(app, host="0.0.0.0", port=8080)
