import cn.website.common.redis.JedisClientPool;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;

public class JedisTest {

    @Test
    public void test(){

        Jedis jedis = new Jedis("redis://localhost:6379/9");
        jedis.flushDB();

        // get set
        jedis.set("hello", "world");
        System.out.println(jedis.get("hello"));

    }

    @Test
    public void test1(){
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext-redis.xml");
        JedisClientPool pool = (JedisClientPool) context.getBean("jedisClientPool");
        pool.set("hello","world");
        System.out.println(pool.get("hello"));
    }

}
