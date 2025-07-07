package com.example.Real_Estate.ServiceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Real_Estate.Services.PropService;
import com.example.Real_Estate.dto.PropertyDto;
import com.example.Real_Estate.entity.Properties;
import com.example.Real_Estate.repository.PropRepo;

@Service
public class PropServiceImpl implements PropService {
	@Autowired
	private PropRepo p1;

	@Override
	public Properties add(Properties p) {
		return p1.save(p);
	}

	@Override
	public List<Properties> findAllProperties() {
		return p1.findAll();
	}

	@Override
	public List<Properties> findByFilter(PropertyDto propertyDto) {
		List<Properties> prop = p1.findAllByFilter(
			propertyDto.getCity(),
			propertyDto.getAddress(),
			propertyDto.getStatus(),
			propertyDto.getPrice(),
			propertyDto.getPropertyType(),
			propertyDto.getArea(),
			propertyDto.getAreaUnit()
		);
		return prop;
	}

	@Override
	public Properties findById(Long id) {
		Optional<Properties> property = p1.findById(id);
		return property.orElse(null);
	}

	public Properties getPropertyById(Long id) {
		return p1.findById(id).orElse(null);
	}
}
