import cn.website.common.redis.JedisClientPool;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {

    @Test
    public void test(){
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext-redis.xml");
        JedisClientPool jedis = (JedisClientPool) context.getBean("jedisClientPool");
        jedis.del("hello");
        jedis.sadd("hello","world");
        jedis.sadd("hello","2");
        jedis.sadd("he","de");
        System.out.println(jedis.scard("hello"));
        System.out.println(jedis.sismember("hello","2"));
    }

}
