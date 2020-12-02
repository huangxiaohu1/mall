import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @author hxh
 * @version 1.0.0
 * @date 2020/11/26 16:34
 */
public class test {
    public static void main(String[] args) {
        System.out.println(new BCryptPasswordEncoder().encode("123456"));
    }
}
