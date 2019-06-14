package com.eomcs.lms.conf;

import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.task.AsyncTaskExecutor;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

@Configuration
@EnableAsync
public class SpringAsyncConfig {

  private static final Logger logger = LogManager.getLogger(SpringAsyncConfig.class);

  @Bean(name = "threadPoolTaskExecutor")
  public Executor threadPoolTaskExecutor() {
    ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
    taskExecutor.setCorePoolSize(3);
    taskExecutor.setMaxPoolSize(30);
    taskExecutor.setQueueCapacity(10);
    taskExecutor.setThreadNamePrefix("Executor-");
    taskExecutor.initialize();
    return taskExecutor;
  }

  public class HandlingExecutor implements AsyncTaskExecutor {
    private AsyncTaskExecutor executor;

    public HandlingExecutor(AsyncTaskExecutor executor) {
      this.executor = executor;
    }

    @Override
    public void execute(Runnable task) {
      executor.execute(createWrappedRunnable(task));
    }

    @Override
    public void execute(Runnable task, long startTimeout) {
      executor.execute(createWrappedRunnable(task), startTimeout);
    }

    @Override
    public Future<?> submit(Runnable task) {
      return executor.submit(createWrappedRunnable(task));
    }

    @Override
    public <T> Future<T> submit(final Callable<T> task) {
      return executor.submit(createCallable(task));
    }

    private <T> Callable<T> createCallable(final Callable<T> task) {
      return new Callable<T>() {
        @Override
        public T call() throws Exception {
          try {
            return task.call();
          } catch (Exception ex) {
            handle(ex);
            throw ex;
          }
        }
      };
    }

    private Runnable createWrappedRunnable(final Runnable task) {
      return new Runnable() {
        @Override
        public void run() {
          try {
            task.run();
          } catch (Exception ex) {
            handle(ex);
          }
        }
      };
    }

    private void handle(Exception ex) {
      logger.info("Failed to execute task. : {}", ex.getMessage());
      logger.error("Failed to execute task. ",ex);
    }

    public void destroy() {
      if(executor instanceof ThreadPoolTaskExecutor){
        ((ThreadPoolTaskExecutor) executor).shutdown();
      }
    }
  }
}
