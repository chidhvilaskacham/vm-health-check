#!/bin/bash

# Function to check CPU utilization
check_cpu_utilization() {
  # Get CPU idle percentage and calculate utilization
  cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d'.' -f1)
  cpu_utilization=$((100 - cpu_idle))
  echo $cpu_utilization
}

# Function to check memory utilization
check_memory_utilization() {
  # Get memory usage percentage
  memory_utilization=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d'.' -f1)
  echo $memory_utilization
}

# Function to check disk utilization
check_disk_utilization() {
  # Get disk usage percentage for root partition
  disk_utilization=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
  echo $disk_utilization
}

# Function to determine health status
determine_health() {
  cpu=$1
  memory=$2
  disk=$3

  if [[ $cpu -lt 60 && $memory -lt 60 && $disk -lt 60 ]]; then
    echo "Healthy"
  else
    echo "Not Healthy"
  fi
}

# Main script starts here
explain=false

# Check for 'explain' argument
if [[ $1 == "explain" ]]; then
  explain=true
fi

# Get utilization values
cpu_utilization=$(check_cpu_utilization)
memory_utilization=$(check_memory_utilization)
disk_utilization=$(check_disk_utilization)

# Determine health
health_status=$(determine_health $cpu_utilization $memory_utilization $disk_utilization)

# Print health status
echo "Health Status: $health_status"

# If explain argument is passed, provide reasons
if $explain; then
  echo "Reason for Health Status:"
  echo "CPU Utilization: $cpu_utilization%"
  echo "Memory Utilization: $memory_utilization%"
  echo "Disk Utilization: $disk_utilization%"
fi
