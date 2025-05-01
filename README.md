# vm-health-check
# VM Health Check Script

This is a shell script designed to analyze the health of virtual machines (VMs) running Ubuntu. The script checks resource utilization for CPU, memory, and disk space and determines whether the VM is "Healthy" or "Not Healthy" based on specified thresholds.

## Features
- **Health Check**: Evaluates CPU, memory, and disk utilization.
- **Threshold**: Declares the VM as "Healthy" if all utilization values are below 60%. Otherwise, it is "Not Healthy."
- **Explain Mode**: Provides reasons for the health status when the `explain` argument is passed.
- **Ubuntu Compatibility**: Designed for Ubuntu-based systems.

## Usage

### Prerequisites
- Ensure the script is executable:
  ```bash
  chmod +x vm_health_check.sh
  ```

### Run the Script
1. Basic health check:
   ```bash
   ./vm_health_check.sh
   ```

2. Health check with explanation:
   ```bash
   ./vm_health_check.sh explain
   ```

### Output
- **Basic Mode**: Displays only the health status.
  ```
  Health Status: Healthy
  ```

- **Explain Mode**: Displays the health status along with resource utilization details.
  ```
  Health Status: Not Healthy
  Reason for Health Status:
  CPU Utilization: 70%
  Memory Utilization: 40%
  Disk Utilization: 45%
  ```

## Implementation Details

### CPU Utilization
The script uses the `top` command to fetch the CPU idle percentage and calculates the utilization as:
```
CPU Utilization = 100 - CPU Idle
```

### Memory Utilization
The script uses the `free` command to calculate memory usage as a percentage:
```
Memory Utilization = (Used Memory / Total Memory) * 100
```

### Disk Utilization
The script uses the `df` command to fetch the disk usage percentage for the root partition (`/`).

### Health Status Logic
The VM is declared:
- **Healthy**: If CPU, memory, and disk utilization are all less than 60%.
- **Not Healthy**: If any of the three parameters exceed 60%.

## Notes
- The script is designed for Ubuntu and may require modifications for other Linux distributions.
- Ensure you have sufficient permissions to run the script and access system resource metrics.

## License
This script is open source and free to use. Contributions are welcome!
