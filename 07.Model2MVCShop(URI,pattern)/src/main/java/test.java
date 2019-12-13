import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.RootBeanDefinition;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.StaticApplicationContext;

import com.model2.mvc.service.domain.Product;

public class test {

	public static void main(String[] args) {
		
		ApplicationContext ac = new StaticApplicationContext();
		
		BeanDefinition helloDef = new RootBeanDefinition(Product.class);
		

	}

}
