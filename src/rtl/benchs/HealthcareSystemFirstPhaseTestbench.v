
module HealthcareSystemFirstPhaseTestbench ();


	// inputs
	reg [5:0] pressureData;
	reg [3:0] bloodPH;
	reg [2:0] bloodType;
	reg [7:0] fdSensorValue;
	reg [7:0] fdFactoryValue;
	reg [7:0] bloodSensor;
	reg [7:0] factoryBaseTemp;
	reg [3:0] factoryTempCoef;
	reg [3:0] tempSensorValue;

	// outputs
	wire presureAbnormality;
	wire bloodAbnormality;
	wire fallDetected;
	wire [3:0] glycemicIndex;
	wire temperatureAbnormality;

	HealthcareSystemFirstPhase HealthcareSystemFirstPhaseUnderTest (
		.pressureData          (pressureData          ),
		.bloodPH               (bloodPH               ),
		.bloodType             (bloodType             ),
		.fdSensorValue         (fdSensorValue         ),
		.fdFactoryValue        (fdFactoryValue        ),
		.bloodSensor           (bloodSensor           ),
		.factoryBaseTemp       (factoryBaseTemp       ),
		.factoryTempCoef       (factoryTempCoef       ),
		.tempSensorValue       (tempSensorValue       ),
		.presureAbnormality    (presureAbnormality    ),
		.bloodAbnormality      (bloodAbnormality      ),
		.fallDetected          (fallDetected          ),
		.glycemicIndex         (glycemicIndex         ),
		.temperatureAbnormality(temperatureAbnormality)
	);

	initial 
	begin 
		// test #1
		pressureData = 6'b000001; // presureAbnormality = 0
		bloodPH = 4'b0000; 	bloodType = 3'b000; // bloodAbnormality = 1
		fdSensorValue = 10; fdFactoryValue = 10; // fallDetected = 1 
		factoryBaseTemp = 30; factoryTempCoef = 4; tempSensorValue = 2; // temperatureAbnormality = 1
		bloodSensor = 8'b10000100; // glycemicIndex = 5
		#100;
		// test #2
		pressureData = 6'b100001; // presureAbnormality = 1
		bloodPH = 4'b1000; 	bloodType = 3'b001; // bloodAbnormality = 0
		fdSensorValue = 9; fdFactoryValue = 10; // fallDetected = 0 
		factoryBaseTemp = 35; factoryTempCoef = 4; tempSensorValue = 2; // temperatureAbnormality = 0
		bloodSensor = 8'b11110100; // glycemicIndex = 2
		#100;
	end


endmodule