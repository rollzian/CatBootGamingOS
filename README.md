# CatGaming OS

**CatGaming OS** — лёгкая Debian-based операционная система, ориентированная на игры, производительность и минимальное потребление системных ресурсов.

Система включает собственное нативное desktop-окружение **CatShell**, compositor **CatCompositor**, системные инструменты, аппаратную диагностику, управление окнами, рабочими пространствами, приложениям, настройками и игровыми функциями.

Проект разрабатывается с приоритетом на **реальную функциональность, производительность, безопасность и отсутствие лишнего программного слоя**.

---

## Основные возможности

### Системная информация

CatGaming OS умеет получать реальную информацию о системе:

* версия ядра
* архитектура
* hostname
* uptime
* load average
* boot ID
* CPU
* RAM
* накопители
* сетевые интерфейсы
* DNS
* маршрутизация
* GPU
* процессы
* питание
* температурные зоны

Система не подставляет выдуманные значения.

Если источник информации недоступен, используется:

```text
NOT AVAILABLE
```

---

## CPU

Поддерживается получение информации о процессоре:

* модель
* производитель
* количество ядер
* logical CPUs
* online/offline CPUs
* CPU topology
* package topology
* SMT
* siblings
* cache
* frequency
* governor
* NUMA
* affinity

Также присутствуют функции управления:

* CPU affinity
* CPU governor
* process priority
* nice
* ionice

Изменение параметров выполняется только при наличии соответствующих системных возможностей и разрешений.

---

## Memory

Система анализирует:

* total RAM
* available RAM
* used RAM
* free RAM
* buffers
* cached memory
* swap
* detailed `/proc/meminfo`

Поддерживается диагностический вывод в человекочитаемом и структурированном формате.

---

## Storage

CatGaming OS обнаруживает блочные устройства и предоставляет информацию о накопителях.

Поддерживается:

* список устройств
* тип устройства
* размер
* mount information
* filesystem information
* состояние storage

Для получения данных используются реальные системные источники Linux.

---

## Network

Сетевая подсистема предоставляет информацию о:

* интерфейсах
* IPv4
* IPv6
* MAC
* MTU
* link state
* speed
* DNS
* default route

Также присутствуют сетевые диагностические функции:

* latency
* jitter
* packet loss
* DNS diagnostics
* route diagnostics
* gaming network diagnostics

Игровая диагностика позволяет определить состояние соединения:

```text
EXCELLENT
GOOD
FAIR
POOR
UNAVAILABLE
```

---

# GPU

CatGaming OS умеет обнаруживать GPU через системные интерфейсы Linux.

Поддерживается определение:

* Intel GPU
* AMD GPU
* NVIDIA GPU
* PCI address
* driver
* kernel module
* DRM card
* render node
* PCIe information
* IOMMU
* NUMA
* runtime power management

Также определяется наличие:

* OpenGL
* Vulkan
* PRIME
* DRM
* KMS

Если GPU недоступен в текущем окружении:

```text
GPU: NOT AVAILABLE
```

Система не подделывает информацию о видеокарте.

---

# DRM / KMS

Присутствует инфраструктура для работы с Linux graphics stack.

Поддерживается обнаружение:

* DRM devices
* DRM cards
* render nodes
* connectors
* connector status
* DPMS
* display modes
* KMS capabilities

Реализован разбор display modes:

* resolution
* refresh rate
* interlace
* mode validation

---

# Displays / EDID

CatGaming OS умеет анализировать EDID мониторов.

Из EDID можно получить:

* manufacturer
* monitor information
* serial
* production year
* preferred mode
* supported modes
* checksum

Система различает реальную доступность дисплея и ситуацию, когда данные отсутствуют.

---

# Wayland

В системе присутствует Wayland runtime foundation.

Проверяются:

* `XDG_RUNTIME_DIR`
* Wayland socket
* runtime environment
* доступность Wayland backend

Переменная окружения сама по себе не считается доказательством работающего Wayland.

---

# CatCompositor

**CatCompositor** — собственный compositor/window-management слой CatGaming OS.

Поддерживаются:

* compositor lifecycle
* backend selection
* window management
* focus management
* workspaces
* tiling
* floating windows
* damage tracking
* frame scheduling
* animations
* hotkeys

Доступные layout-модели:

```text
floating
master-stack
vertical
horizontal
grid
```

---

# Workspaces

CatShell поддерживает до **10 рабочих пространств**.

Рабочие пространства имеют:

* идентификатор
* состояние
* окна
* focus
* layout
* переключение
* управление окнами

---

# CatShell

**CatShell** — собственная лёгкая desktop shell.

Она отвечает за:

* desktop UI
* launcher
* panel
* notifications
* settings
* themes
* widgets
* desktop actions

CatShell не основан на Electron или Chromium.

---

# CatLauncher

CatLauncher — нативный launcher приложений.

Поддерживает:

* открытие
* закрытие
* toggle
* поиск
* запуск приложений
* категории
* application index
* keyboard navigation
* application selection

Поиск поддерживает:

```text
exact match
prefix match
substring match
fuzzy match
```

Результаты сортируются по детерминированному ranking.

Application Index кэшируется, поэтому launcher не обязан полностью пересканировать приложения при каждом открытии.

---

# Safe Application Launching

Запуск приложений выполняется через аргументы процесса.

Не используется shell для запуска пользовательских команд.

Опасные конструкции вроде:

```text
sh -c
bash -c
eval
```

и shell metacharacters отклоняются там, где они могут привести к command injection.

---

# CatPanel

CatPanel предоставляет системную панель рабочего стола.

Поддерживаются:

* Start button
* workspace indicator
* taskbar foundation
* network status
* audio status
* battery status
* clock
* system status

Панель может использовать различные положения и конфигурацию размеров, отступов и поведения.

---

# Taskbar

Taskbar хранит модель открытых окон.

Информация может включать:

* application
* window
* title
* workspace
* state
* focus

Интеграция с полноценным graphical compositor развивается вместе с оконным backend.

---

# System Tray

CatGaming OS умеет проверять доступность системного tray backend.

Если необходимый backend или протокол отсутствует:

```text
SYSTEM TRAY: NOT AVAILABLE
```

Никаких фиктивных tray entries не создаётся.

---

# Clock

Панель содержит системные часы.

Поддерживается:

* 12-hour format
* 24-hour format
* seconds
* date
* custom format
* timer-driven updates

---

# Notifications

Система уведомлений поддерживает:

* создание уведомлений
* отображение
* history
* notification center
* actions
* limits
* состояние уведомлений

История уведомлений хранится локально.

---

# Settings

CatGaming OS имеет собственную систему настроек.

Разделы включают:

* Appearance
* Display
* Input
* Keyboard
* Mouse
* Audio
* Network
* Gaming
* Performance
* Notifications
* Applications
* Workspaces
* Compositor
* CatShell

Каждая настройка проходит validation перед сохранением.

---

# Theme Engine

Поддерживаются темы:

```text
dark
light
high-contrast
```

Theme engine работает с системными переменными интерфейса.

Настройки могут управлять:

* background
* accent
* font
* panel
* animations
* gaps
* borders
* radius

---

# Widgets

CatShell имеет нативную систему UI-компонентов.

Доступны:

* Label
* Button
* Icon
* Image
* TextInput
* List
* ScrollView
* Panel
* Card
* Slider
* Checkbox
* Toggle
* Dropdown
* Menu
* Dialog
* Tabs
* ProgressBar

---

# Layout Engine

UI поддерживает базовые модели размещения:

```text
row
column
stack
overlay
grid
```

Компоненты могут комбинироваться для создания системных интерфейсов.

---

# Accessibility

Предусмотрены:

* keyboard navigation
* focus management
* focus ring
* high contrast
* reduced motion
* font scaling foundation
* accessible UI navigation

---

# Desktop

Desktop layer поддерживает:

* background
* desktop status
* desktop menu
* context actions
* About information

Background может быть представлен различными типами, предусмотренными конфигурацией.

---

# Performance

CatGaming OS содержит системные механизмы управления производительностью.

Доступны профили:

```text
balanced
performance
powersave
gaming
```

Поддерживаются и определяются:

* CPU governor
* swappiness
* ZRAM
* PSI
* I/O scheduler
* CPU topology
* process affinity

Недоступные kernel interfaces не маскируются под работающие.

---

# Gaming

Gaming stack предназначен для оптимизации системы во время запуска игр.

Планируемые и интегрируемые компоненты игрового слоя:

* Gaming Mode
* Game Process Manager
* CPU optimization
* GPU management
* per-game profiles
* game library
* Steam integration
* Proton detection
* Wine detection
* performance monitoring
* controller integration
* network gaming diagnostics
* power management

Игровые настройки должны автоматически учитывать реальные возможности конкретного компьютера.

---

# Input & Controllers

Система работает с Linux input subsystem.

Обнаруживаются:

* keyboard
* mouse
* joystick
* gamepad
* input event devices
* force feedback capability

Для игровых устройств используется информация из реальных `/dev/input` и системных источников.

---

# Audio

CatGaming OS поддерживает обнаружение Linux audio stack.

Проверяются:

* ALSA
* PipeWire
* PulseAudio

Могут обнаруживаться:

* audio cards
* devices
* sinks
* sources

Если audio backend отсутствует:

```text
AUDIO: NOT AVAILABLE
```

---

# Power

Power subsystem определяет:

* AC status
* battery
* power profile
* thermal zones
* CPU power information
* RAPL availability

Если устройство не предоставляет battery information:

```text
BATTERY: NOT AVAILABLE
```

---

# Process Management

CatGaming OS предоставляет расширенную информацию о процессах.

Поддерживаются:

* PID
* PPID
* executable
* cwd
* command line
* RSS
* process state
* CPU time
* threads
* file descriptors
* I/O
* context switches
* cgroup
* affinity

Особые системные процессы защищаются от опасных операций.

PID 1 не должен завершаться через обычные process-management операции.

---

# Diagnostics

Система имеет единый diagnostic layer.

Например:

```bash
catgaming diagnose
```

Диагностика может проверять:

* CPU
* memory
* storage
* network
* GPU
* DRM
* KMS
* Wayland
* input
* power
* performance
* compositor
* shell

Результаты должны отражать фактическое состояние системы.

---

# Structured Errors

Внутренние операции используют структурированные ошибки.

Ошибки могут содержать:

* code
* category
* message
* exit status

Это позволяет CLI и другим компонентам корректно обрабатывать ошибки без анализа произвольного текста.

---

# Rootfs

CatGaming OS имеет foundation для создания собственного root filesystem.

Поддерживаются режимы:

```text
minimal
gaming
developer
offline
```

Присутствуют:

* rootfs layout
* manifests
* package cache
* offline build
* verification
* size calculation
* clean operations

Offline режим не должен выполнять слепую загрузку пакетов из интернета.

---

# Configuration

Пользовательские настройки хранятся в:

```text
~/.config/catgaming/
```

Конфигурация сохраняется атомарно.

Основной принцип:

```text
write temporary file
        ↓
fsync
        ↓
atomic rename
```

Это снижает риск повреждения конфигурации при сбое записи.

---

# CLI

Основной CLI:

```bash
catgaming
```

Примеры:

```bash
catgaming version

catgaming system status

catgaming cpu status

catgaming memory status
catgaming memory detailed

catgaming storage list
catgaming storage status

catgaming network list
catgaming network status

catgaming gpu list
catgaming gpu status

catgaming process list
catgaming process status

catgaming power status

catgaming display status
catgaming drm status
catgaming kms status
catgaming seat status
catgaming libinput status
catgaming input status

catgaming compositor start
catgaming compositor stop
catgaming compositor reload
catgaming compositor windows
catgaming compositor workspaces

catgaming shell status

catgaming launcher open
catgaming launcher close
catgaming launcher toggle
catgaming launcher status
catgaming launcher search
catgaming launcher launch

catgaming panel status
catgaming panel reload

catgaming settings list
catgaming settings get
catgaming settings set

catgaming theme list
catgaming theme set

catgaming desktop status
catgaming desktop about

catgaming notifications center

catgaming ui diagnose

catgaming diagnose
```

Developer utility:

```bash
catgaming-dev function-count
```

---

# Security

Безопасность является частью архитектуры CatGaming OS.

Система учитывает:

* path traversal
* command injection
* shell injection
* unsafe executable paths
* permissions
* PID validation
* PID 1 protection
* symlink safety
* configuration safety
* input validation

Пользовательские команды не должны передаваться через shell, если для операции можно использовать прямой `argv` запуск.

---

# Resource Usage

CatGaming OS проектируется как lightweight operating system.

Приоритет:

```text
low RAM usage
low CPU usage
low background activity
fast startup
minimal dependencies
event-driven architecture
```

Система не должна использовать постоянные busy loops для задач, которые можно выполнять через события, cache или разумные интервалы.

---

# Native Architecture

CatGaming OS не использует web stack в качестве основы desktop environment.

Не используются как основа CatShell:

```text
Electron
Chromium
Node.js
HTML
CSS
JavaScript
KDE
GNOME
```

Интерфейс строится вокруг нативной архитектуры CatShell и CatCompositor.

---

# Software Rendering

Если GPU acceleration недоступна, CatGaming OS имеет software rendering path.

Это позволяет тестировать UI и системную логику в:

* containers
* VMs
* CI
* headless environments
* системах без доступного GPU backend

При этом software renderer не выдаётся за hardware acceleration.

---

# Project Structure

```text
CatGaming/
├── cli/
│   └── catgaming
│
├── core/
│   ├── system/
│   ├── cpu/
│   ├── memory/
│   ├── storage/
│   ├── network/
│   ├── gpu/
│   ├── process/
│   └── power/
│
├── drm/
├── kms/
├── wayland/
├── seat/
├── libinput/
├── input/
├── renderer/
│
├── compositor/
│   ├── state/
│   ├── window/
│   ├── workspace/
│   ├── tiling/
│   ├── focus/
│   ├── hotkey/
│   ├── damage/
│   └── animation/
│
├── catshell/
│   ├── shell/
│   ├── theme/
│   ├── launcher/
│   ├── notification/
│   ├── ui/
│   ├── panel/
│   ├── settings/
│   └── desktop/
│
├── configs/
├── fixtures/
├── tests/
├── scripts/
├── tools/
├── docs/
│
├── LICENSE
└── README.md
```

---

# Development

Run the complete test suite:

```bash
./scripts/run-tests.sh
```

Count real functions:

```bash
./tools/function-count.sh
```

Run system diagnostics:

```bash
./cli/catgaming diagnose
```

---

# Testing Philosophy

CatGaming OS использует автоматические тесты для проверки:

* system APIs
* hardware detection
* parsers
* validation
* error handling
* security
* persistence
* CLI
* compositor models
* shell models
* UI components

Особое внимание уделяется окружениям, где hardware отсутствует.

Например:

```text
GPU → NOT AVAILABLE
DRM → NOT AVAILABLE
KMS → NOT AVAILABLE
Wayland → NOT AVAILABLE
Audio → NOT AVAILABLE
Controller → NOT AVAILABLE
Battery → NOT AVAILABLE
```

Это является корректным результатом, если соответствующий ресурс действительно недоступен.

---

# Current System Statistics

```text
REAL FUNCTIONS: 599

STUB: 6
TODO: 0
FIXME: 0
DUPLICATES: 0
DEAD: 0

BUILD: PASS

CatLauncher: AVAILABLE
CatPanel: AVAILABLE
CatShell: AVAILABLE
CatCompositor: FOUNDATION
Settings: AVAILABLE
Notifications: AVAILABLE
Themes: AVAILABLE
Widgets: AVAILABLE
Software Renderer: AVAILABLE
```

---

# Current Limitations

Некоторые низкоуровневые возможности зависят от конкретного hardware и окружения.

Например:

```text
GPU acceleration
DRM
KMS
Wayland
VRR
HDR
Audio backend
System Tray
Battery
Controller
```

могут быть недоступны в контейнере или тестовой среде.

В таких случаях CatGaming OS должна корректно продолжать работу и сообщать реальное состояние вместо генерации фиктивных данных.

Graphical compositor и hardware-accelerated rendering являются отдельным низкоуровневым слоем относительно уже реализованных моделей CatCompositor и CatShell.

---

# Design Goals

CatGaming OS стремится объединить:

```text
Lightweight Linux
        +
Native Desktop
        +
Gaming Optimization
        +
Hardware Detection
        +
Game Management
        +
Security
        +
Low Resource Usage
```

Главная идея проекта — создать самостоятельную gaming-oriented Linux OS, а не просто установить набор сторонних программ поверх обычного desktop environment.

---

# License

CatGaming OS распространяется под лицензией **MIT**.

См. файл:

```text
LICENSE
```

---

# Project Status

```text
CatGaming OS

Real Functions: 599
Build: PASS
Tests: PASS
TODO: 0
FIXME: 0
Duplicates: 0
Dead Code: 0

Native CatShell: YES
CatLauncher: YES
CatPanel: YES
CatCompositor: FOUNDATION
Settings: YES
Notifications: YES
Themes: YES
Widgets: YES
Hardware Detection: YES
Performance Management: YES
Software Rendering: YES

Target:
10,000+ REAL WORKING FUNCTIONS
```

**CatGaming OS — lightweight Linux built for gaming.**
