from locust import HttpUser, task

class IndexTest(HttpUser):
    @task
    def reqeust_task(self):
        self.client.get("/delay?delay_ms=1000")