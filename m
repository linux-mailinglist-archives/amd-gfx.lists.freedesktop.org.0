Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC5547087D
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Dec 2021 19:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40ECF10E91E;
	Fri, 10 Dec 2021 18:20:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E9E10E83E
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Dec 2021 18:20:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [88.120.44.86])
 by smtp5-g21.free.fr (Postfix) with ESMTP id D70095FFC7;
 Fri, 10 Dec 2021 19:20:39 +0100 (CET)
From: Yann Dirson <ydirson@free.fr>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/3] Documentation/gpu: include description of some of the
 GC microcontrollers
Date: Fri, 10 Dec 2021 19:20:30 +0100
Message-Id: <20211210182030.3834-4-ydirson@free.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210182030.3834-1-ydirson@free.fr>
References: <20211210182030.3834-1-ydirson@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Yann Dirson <ydirson@free.fr>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, linux-doc@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is Alex' description from the "Looking for clarifications around gfx/kcq/kiq"
thread, edited to fit as ReST.

Originally-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yann Dirson <ydirson@free.fr>
Acked-by: Harry Wentland <harry.wentland@amd.com>
---
 Documentation/gpu/amdgpu/driver-core.rst | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/gpu/amdgpu/driver-core.rst b/Documentation/gpu/amdgpu/driver-core.rst
index b870a63c64dd..942bc7c3eac9 100644
--- a/Documentation/gpu/amdgpu/driver-core.rst
+++ b/Documentation/gpu/amdgpu/driver-core.rst
@@ -75,6 +75,28 @@ VCN (Video Core Next)
     decode.  It's exposed to userspace for user mode drivers (VA-API,
     OpenMAX, etc.)
 
+Graphics and Compute microcontrollers
+-------------------------------------
+
+CP (Command Processor)
+    The name for the hardware block that encompasses the front end of the
+    GFX/Compute pipeline.  Consists mainly of a bunch of microcontrollers
+    (PFP, ME, CE, MEC).  The firmware that runs on these microcontrollers
+    provides the driver interface to interact with the GFX/Compute engine.
+
+    MEC (MicroEngine Compute)
+        This is the microcontroller that controls the compute queues on the
+        GFX/compute engine.
+
+    MES (MicroEngine Scheduler)
+        This is a new engine for managing queues.  This is currently unused.
+
+RLC (RunList Controller)
+    This is another microcontroller in the GFX/Compute engine.  It handles
+    power management related functionality within the GFX/Compute engine.
+    The name is a vestige of old hardware where it was originally added
+    and doesn't really have much relation to what the engine does now.
+
 Driver structure
 ================
 
@@ -82,6 +104,19 @@ In general, the driver has a list of all of the IPs on a particular
 SoC and for things like init/fini/suspend/resume, more or less just
 walks the list and handles each IP.
 
+Some useful constructs:
+
+KIQ (Kernel Interface Queue)
+    This is a control queue used by the kernel driver to manage other gfx
+    and compute queues on the GFX/compute engine.  You can use it to
+    map/unmap additional queues, etc.
+
+IB (Indirect Buffer)
+    A command buffer for a particular engine.  Rather than writing
+    commands directly to the queue, you can write the commands into a
+    piece of memory and then put a pointer to the memory into the queue.
+    The hardware will then follow the pointer and execute the commands in
+    the memory, then returning to the rest of the commands in the ring.
 
 .. _amdgpu_memory_domains:
 
-- 
2.31.1

