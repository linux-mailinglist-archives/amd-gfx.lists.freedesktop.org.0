Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C018D9A1971
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2024 05:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D2B10E794;
	Thu, 17 Oct 2024 03:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0GFzGnWK";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F07510E2DF
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2024 03:43:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9cuylVsLy1uFuIHC9gfOCFwv2tVTM+KhZFiDTmF3fOE8NJ7l5WMbnmVC4E597Vr5YWD/mzy60U+Bt8RVtEoI64omjMFF9zjxB8DorzVcpQWDsGgkPKMAwFE6ky9a5syvMlDaCj4YlN/SlGaQv0TNdVbfTjHMJmkg7E619XY2ras/m8kAltPVRX0oF2M2Mq3vKlLdNBUJIV6VZzuyZn6uI9HybavFIY4JbnszHFM20hezYs75fMCaTZrdyUwgPDJ8qmBf2mBGQB02EdqJK6kVNZOdGoEE9kVxbunTMumAC0i1epUDx++kh5LmhE2/GEXLZUe0rOxZmZXk4AyKNEjhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSiU36H4B6JcKC2nsi0ktZAETzBM7D/YDCzFPp7BSso=;
 b=EtKBIuGzZ7kVMxCdrP131L1WCs5XcsRCtqbvwHrIsDt7PBwV82Wcuao+/MkS9Y4FgfouKnxq5qKSpTxw7/nDqXq74inkNSWpV42ydq9mweQmA6aIGFiIp0/Ef1H4bSoc+u3a6xBqLz9+M+uStEMX58bXT0wDjBxiJ52Rm6Hk13LUm6STpza1/NxoTclgTQmtO2LiKq/NFASGAF5oWmQxWIqLJt4DTF4c73dMh/vvDBc06oR5SrKjSRCTkz37bVpRqLm5Vn0tYmQHBiRiGI2AD83XWqqDExisrTLMEBi1+V8no1kbP59lZAtPFzO7kZoz4uqeWM7IfsG3Y8a076yt5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSiU36H4B6JcKC2nsi0ktZAETzBM7D/YDCzFPp7BSso=;
 b=0GFzGnWKW37mL/6izUHHUVOP/to/ze6svdimXWjc1VSOxMWApHCUPUBUVQkMCnvw0Wqf6JXs1onjQXDo4UrBXUiesSz+N6kPKY78xWXkJhuHj/VVdZsIYlUe2X5BoPscdxL1ITY6FZX3swoTSK3g/XOitsIUu6ymOVdSLMpMLaQ=
Received: from BN9PR03CA0451.namprd03.prod.outlook.com (2603:10b6:408:139::6)
 by DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17; Thu, 17 Oct 2024 03:43:48 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:139:cafe::c7) by BN9PR03CA0451.outlook.office365.com
 (2603:10b6:408:139::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Thu, 17 Oct 2024 03:43:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.1 via Frontend Transport; Thu, 17 Oct 2024 03:43:48 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Oct
 2024 22:43:45 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Harry Wentland <harry.wentland@amd.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>, Christian Konig
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 2/2] Documentation/gpu/amdgpu: Add programming model for DCN
Date: Wed, 16 Oct 2024 21:34:27 -0600
Message-ID: <20241017034244.223993-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017034244.223993-1-Rodrigo.Siqueira@amd.com>
References: <20241017034244.223993-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|DM3PR12MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d082dd1-90b7-4e1b-5040-08dcee5de8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1o5REU1MDJmSUxrZ1NiNzQ0NCtJNnhRdkptS1lWeGpiNFE1VUJLK2plY1lu?=
 =?utf-8?B?Z0RUMFI4dEdKanlvOVdqTjJqRUdTQUMrWHE4SjRmdzVxZU04RUU5Z1FrWUx6?=
 =?utf-8?B?dU9QcTQ5dXB4S2dRNklzS1gvQlBpSkh3UkRCVDF3Y09sZEVIcFd6K0MxQjZD?=
 =?utf-8?B?c3NXRVI5WHhMa2RvU00rcXBFOVdoL3dnY2x2R0w2YnV4QXR0MDVyU25EMWJa?=
 =?utf-8?B?b1puSHJleC9XTU5VeUZBRWNwYUFyek5Mc2NDSTRGWm5WQ2g2Z2ZLbnJ0Q2ND?=
 =?utf-8?B?dE5aVkU5V0hTMXVwR1pmYWxJYUEwbTg2bHNIN1lsVHRaQVc3Z1lVckw3eElL?=
 =?utf-8?B?NmJoWVI3VTBWWVZSTkhHOGZEMG1uTjFKakRUTXhHdkFQY0F1U1ZoSkxja2Vq?=
 =?utf-8?B?VnVMVkk2dU91OTlPSWtWNFN3VEdORWViazBuMld2dmtxWUU2N3poUXN0c3o4?=
 =?utf-8?B?UHNydXdGYy9veDdpS1VyK3hwbkhYMCtkK2k5QnYrVkdTWFArUEgzbDZxdzhI?=
 =?utf-8?B?RnBwWWpJajd2ZmVGNHNIcVlzMXV0M0pJU2xrRlR3SXVrRUFydVlub0N0UzFh?=
 =?utf-8?B?dmxkMlh3ckdWS2dHdVZtTmpjZFJSTnNQaUNObG95YlgwUnhubEpHVTUvZWxY?=
 =?utf-8?B?TFpsRmthamYyemdvRHgrc01GbUJGU3h2cTk1a1NNc2RXRnJTbjN4anNjS1RT?=
 =?utf-8?B?dTBJYkJBdG1nbnhnQ2NrdWVOQ0w4dkNDY1VYKzV4UFRUQlJnYkFKVnpZZXM0?=
 =?utf-8?B?UFBGYjBqY0ZKZ2ZRbUYwNks4RWhsNGxvekpHd0M3YXQra0J4eDhjeWgrTksr?=
 =?utf-8?B?Q21qTTlUNXQvSTNpc3VPWXdVL0RPUU1xa3FQVW1ieitjY0ZUQ0RaZlBzUFow?=
 =?utf-8?B?T1ZIYWthVlA3bjJ5ZCszZDFpMkUxR0Z4Z2tON1FWM21oVUNrYjFLbVoyblRq?=
 =?utf-8?B?V1FHOEd4OXphUG9LVFppZGxYNU5VMCt5YjUrS1Vad2RXQXpudFRhd2FRam5N?=
 =?utf-8?B?RDUzTERYNXNNaXpCM3NqMERaa3hxdmwvVzJVcDBmZERNeXFzUmlJYzB2cnNq?=
 =?utf-8?B?NEZVdExkcVRGdlY3M3lFOXRxaVJPKzJoV3h2Q2c2R3NtV09TZ0JiQTc5SVd1?=
 =?utf-8?B?TVY4NWIyNk1ZcVMwRlhQSzNVQnl2VVlXdEdHd1hEYXF0Ylp2THNwNEllUUJT?=
 =?utf-8?B?Y2k1NFZYSlRxWHUrWE9vNmRsVG9DRjBzZkk2SjFlQWowaXAxNTN6Znc4Z2Yy?=
 =?utf-8?B?ckZwUW5CVnFGZGtxcXJaMGVTK1BkWWJpT1pNVkhXVHIrbkdnTG9SWU1Ub0Vu?=
 =?utf-8?B?TzdiTHdPbGxtZFFTdkU4UDFOTGNTRngwMmdxRGdpbmVXbGptbk9uQWN4cXp0?=
 =?utf-8?B?QXRQTTZaSWNmRmF4bHVUaEFBUUQ1OXdEb0c0Z1JiM28vM2hKTXUzSUV5bEta?=
 =?utf-8?B?dlg2c25iWG9QTlpSWWduUCtqeGkwQVpCV1pIOFgzOG4rUkdKdE9BSVp6cC93?=
 =?utf-8?B?djRTSlh3czZya2tpU2Y3Qkl6SmhYZnd1RUlQQVlnN2w5NllodUJnQzZJZzN2?=
 =?utf-8?B?VW8xRjN3Y2RRWGRvems2WGQ3VHRzcXp0VXR3THFwYXZmVTZNV25yWCszMWFD?=
 =?utf-8?B?SDZtNFpFMnlwYlNrMGJXMnR0TnNDa0xad3lMVVBDQWNKSHhpdzNuckU1NEhH?=
 =?utf-8?B?cUdEMlBiYWJUNHUwa3BWNmpXbmhIYmgzZnRTNHZpQURLMnRDSnRDdFlKRE04?=
 =?utf-8?B?dVhRK2l1SGErelltai9JbXZKbGlMZ0hmSktnSGUyWmNRc0tQQk5SNk5JK1hy?=
 =?utf-8?Q?V6RLA7wvrNyyvue3o+oMh6ut447hdqvEIEcFc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 03:43:48.1438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d082dd1-90b7-4e1b-5040-08dcee5de8a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9416
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

One of the challenges to contributing to the display code is the
complexity of the DC component. This commit adds a documentation page
that discusses the programming model used by DCN and an overview of how
the display code is organized.

Cc: Leo Li <sunpeng.li@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Christian Konig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/amdgpu/display/dc-arch-overview.svg   | 731 +++++++++++++++++
 .../gpu/amdgpu/display/dc-components.svg      | 732 ++++++++++++++++++
 .../gpu/amdgpu/display/dcn-blocks.rst         |   2 +
 .../gpu/amdgpu/display/dcn-overview.rst       |   2 +
 Documentation/gpu/amdgpu/display/index.rst    |   1 +
 .../amdgpu/display/programming-model-dcn.rst  | 162 ++++
 6 files changed, 1630 insertions(+)
 create mode 100644 Documentation/gpu/amdgpu/display/dc-arch-overview.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dc-components.svg
 create mode 100644 Documentation/gpu/amdgpu/display/programming-model-dcn.rst

diff --git a/Documentation/gpu/amdgpu/display/dc-arch-overview.svg b/Documentation/gpu/amdgpu/display/dc-arch-overview.svg
new file mode 100644
index 000000000000..23394931cf26
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/dc-arch-overview.svg
@@ -0,0 +1,731 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   width="1204.058"
+   height="510.57321"
+   viewBox="0 0 318.57366 135.08917"
+   version="1.1"
+   id="svg8"
+   inkscape:version="1.2.2 (b0a8486541, 2022-12-01)"
+   sodipodi:docname="dc-arch-overview.svg"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:svg="http://www.w3.org/2000/svg"
+   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:cc="http://creativecommons.org/ns#"
+   xmlns:dc="http://purl.org/dc/elements/1.1/">
+  <defs
+     id="defs2">
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker8858"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path8616"
+         style="fill:#aa00d4;fill-opacity:1;fill-rule:evenodd;stroke:#aa00d4;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Send"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Send"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path8622"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="matrix(-0.3,0,0,-0.3,0.69,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Lend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Lend"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path8592"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:1pt;stroke-opacity:1"
+         transform="matrix(-0.8,0,0,-0.8,-10,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Lend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Lend"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path8610"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1200"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-2"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-9"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-2-1"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-9-9"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-2-7"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-9-8"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-4"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-5"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-0"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-3"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-1"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-2-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-9-1"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-0-7"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-3-4"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-6-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-1-0"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-2-8"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-9-6"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1200-6"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker8858-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path8616-5"
+         style="fill:#00ffcc;fill-opacity:1;fill-rule:evenodd;stroke:#00ffcc;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-56"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-0-2"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-3-9"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+  </defs>
+  <sodipodi:namedview
+     id="base"
+     pagecolor="#ffffff"
+     bordercolor="#666666"
+     borderopacity="1.0"
+     inkscape:pageopacity="0.0"
+     inkscape:pageshadow="2"
+     inkscape:zoom="1.4"
+     inkscape:cx="812.5"
+     inkscape:cy="315"
+     inkscape:document-units="mm"
+     inkscape:current-layer="layer1"
+     showgrid="false"
+     inkscape:window-width="3840"
+     inkscape:window-height="2083"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
+     inkscape:window-maximized="1"
+     showguides="false"
+     fit-margin-top="0"
+     fit-margin-left="0"
+     fit-margin-right="0"
+     fit-margin-bottom="0"
+     units="px"
+     inkscape:snap-global="false"
+     inkscape:showpageshadow="2"
+     inkscape:pagecheckerboard="0"
+     inkscape:deskcolor="#d1d1d1" />
+  <metadata
+     id="metadata5">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about="">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
+      </cc:Work>
+    </rdf:RDF>
+  </metadata>
+  <g
+     inkscape:label="Layer 1"
+     inkscape:groupmode="layer"
+     id="layer1"
+     transform="translate(399.57097,11.171866)">
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:6.54816px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163704"
+       x="-297.75696"
+       y="109.44505"
+       id="text1063" />
+    <path
+       style="fill:#008000;stroke:#008000;stroke-width:0.463298;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.463298, 0.926596;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -120.41395,84.001461 h -9.04766"
+       id="path1171-0-7"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.982225;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.982225, 1.96445;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -129.96274,90.649221 h 8.66407"
+       id="path1171-7-1-3-8"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#3771c8;stroke-width:0.745037;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -121.33167,97.283841 h -7.91265"
+       id="path7149-3-7-8"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:6.54816px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163704"
+       x="-115.55721"
+       y="85.330681"
+       id="text12079"><tspan
+         sodipodi:role="line"
+         id="tspan12077"
+         x="-115.55721"
+         y="85.330681"
+         style="font-size:4.80199px;stroke-width:0.163704">Board/Platform</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:6.54816px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163704"
+       x="-115.75885"
+       y="92.435066"
+       id="text12079-3"><tspan
+         sodipodi:role="line"
+         id="tspan12077-1"
+         x="-115.75885"
+         y="92.435066"
+         style="font-size:4.80199px;stroke-width:0.163704">SoC</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:6.54816px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163704"
+       x="-115.6041"
+       y="98.608604"
+       id="text12079-3-4"><tspan
+         sodipodi:role="line"
+         id="tspan12077-1-9"
+         x="-115.6041"
+         y="98.608604"
+         style="font-size:4.80199px;stroke-width:0.163704">Component</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.175px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="-368.54205"
+       y="92.633011"
+       id="text1010-5"><tspan
+         sodipodi:role="line"
+         x="-368.54205"
+         y="92.633011"
+         style="font-size:6.35px;text-align:center;text-anchor:middle;stroke-width:0.264583"
+         id="tspan1057">DRAM</tspan></text>
+    <g
+       id="g730"
+       transform="translate(6.9386906,-2.5203356)">
+      <text
+         id="text838-5-2-6-2"
+         y="32.372173"
+         x="-372.97867"
+         style="font-style:normal;font-weight:normal;font-size:6.54814px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163704"
+         xml:space="preserve"><tspan
+           id="tspan936-1-2-3"
+           style="text-align:center;text-anchor:middle;stroke-width:0.163704"
+           y="32.372173"
+           x="-372.97867"
+           sodipodi:role="line">dc_plane</tspan></text>
+      <rect
+         ry="6.9139691e-07"
+         y="18.717371"
+         x="-390.50565"
+         height="23.904575"
+         width="35.080177"
+         id="rect834-5-2-6-75"
+         style="fill:none;stroke:#000000;stroke-width:0.561714;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <g
+       id="g738"
+       transform="translate(6.9386906,31.346346)">
+      <text
+         id="text734"
+         y="32.372173"
+         x="-372.97867"
+         style="font-style:normal;font-weight:normal;font-size:6.54814px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163704"
+         xml:space="preserve"><tspan
+           id="tspan732"
+           style="text-align:center;text-anchor:middle;stroke-width:0.163704"
+           y="32.372173"
+           x="-372.97867"
+           sodipodi:role="line">dc_plane</tspan></text>
+      <rect
+         ry="6.9139691e-07"
+         y="18.717371"
+         x="-390.50565"
+         height="23.904575"
+         width="35.080177"
+         id="rect736"
+         style="fill:none;stroke:#000000;stroke-width:0.561714;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <rect
+       ry="2.1256196e-06"
+       y="8.5983658"
+       x="-389.18051"
+       height="73.491852"
+       width="46.307304"
+       id="rect744"
+       style="fill:none;stroke:#3771c8;stroke-width:1.13159;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <g
+       id="g757"
+       transform="translate(-19.949528,-8.6078171)">
+      <text
+         id="text600"
+         y="56.289795"
+         x="-256.91336"
+         style="font-style:normal;font-weight:normal;font-size:6.54814px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163704"
+         xml:space="preserve"><tspan
+           id="tspan598"
+           style="text-align:center;text-anchor:middle;stroke-width:0.163704"
+           y="56.289795"
+           x="-256.91336"
+           sodipodi:role="line">DC</tspan></text>
+      <rect
+         ry="1.7458606e-06"
+         y="23.771139"
+         x="-289.21854"
+         height="60.361938"
+         width="65.042557"
+         id="rect602"
+         style="fill:none;stroke:#000000;stroke-width:1.21541;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <rect
+       ry="2.3633565e-06"
+       y="4.4885707"
+       x="-316.43292"
+       height="81.711441"
+       width="79.57225"
+       id="rect787"
+       style="fill:none;stroke:#3771c8;stroke-width:1.5641;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <g
+       id="g765"
+       transform="translate(6.5577393,-7.020317)">
+      <text
+         id="text608"
+         y="31.942825"
+         x="-189.71797"
+         style="font-style:normal;font-weight:normal;font-size:6.54814px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163704"
+         xml:space="preserve"><tspan
+           id="tspan606"
+           style="text-align:center;text-anchor:middle;stroke-width:0.163704"
+           y="31.942825"
+           x="-189.71797"
+           sodipodi:role="line">dc_link</tspan></text>
+      <rect
+         ry="6.8036792e-07"
+         y="18.197111"
+         x="-211.99069"
+         height="23.523254"
+         width="44.846642"
+         id="rect610"
+         style="fill:none;stroke:#000000;stroke-width:0.630025;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <rect
+       ry="1.0582555e-06"
+       y="4.3160448"
+       x="-210.69141"
+       height="36.588463"
+       width="55.543594"
+       id="rect794"
+       style="fill:none;stroke:#3771c8;stroke-width:0.874443;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <g
+       id="g781"
+       transform="translate(6.5577393,37.542802)">
+      <text
+         id="text777"
+         y="31.942825"
+         x="-189.71797"
+         style="font-style:normal;font-weight:normal;font-size:6.54814px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163704"
+         xml:space="preserve"><tspan
+           id="tspan775"
+           style="text-align:center;text-anchor:middle;stroke-width:0.163704"
+           y="31.942825"
+           x="-189.71797"
+           sodipodi:role="line">dc_link</tspan></text>
+      <rect
+         ry="6.8036792e-07"
+         y="18.197111"
+         x="-211.99069"
+         height="23.523254"
+         width="44.846642"
+         id="rect779"
+         style="fill:none;stroke:#000000;stroke-width:0.630025;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <rect
+       ry="1.0582555e-06"
+       y="50.466679"
+       x="-210.69141"
+       height="36.588463"
+       width="55.543594"
+       id="rect796"
+       style="fill:none;stroke:#3771c8;stroke-width:0.874443;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <g
+       id="g2151"
+       transform="translate(2.1659807,-25.895798)">
+      <rect
+         ry="9.2671934e-07"
+         y="29.395185"
+         x="-132.25786"
+         height="32.040688"
+         width="44.742229"
+         id="rect618"
+         style="fill:none;stroke:#3771c8;stroke-width:0.734435;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+      <g
+         id="g838"
+         transform="translate(1.9073486e-6,0.26687336)">
+        <text
+           id="text616"
+           y="47.132744"
+           x="-110.03735"
+           style="font-style:normal;font-weight:normal;font-size:6.54814px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163704"
+           xml:space="preserve"><tspan
+             id="tspan614"
+             style="text-align:center;text-anchor:middle;stroke-width:0.163704"
+             y="47.132744"
+             x="-110.03735"
+             sodipodi:role="line">dc_link</tspan></text>
+        <rect
+           ry="5.7260945e-07"
+           y="35.249866"
+           x="-126.21788"
+           height="19.797579"
+           width="32.66227"
+           id="rect833"
+           style="fill:none;stroke:#000000;stroke-width:0.493257;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+      </g>
+    </g>
+    <rect
+       ry="3.6076738e-06"
+       y="-9.4559708"
+       x="-397.85507"
+       height="124.73286"
+       width="250.94243"
+       id="rect1307"
+       style="fill:none;stroke:#008000;stroke-width:3.43179;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:6.86358, 3.43179;stroke-dashoffset:0" />
+    <rect
+       ry="2.9172609e-06"
+       y="-4.5401988"
+       x="-393.52301"
+       height="100.8623"
+       width="174.14117"
+       id="rect1990"
+       style="fill:none;stroke:#ff0000;stroke-width:2.57074;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:2.57074, 5.14148;stroke-dashoffset:0" />
+    <path
+       style="fill:none;stroke:#aa00d4;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-dasharray:none;stroke-opacity:1"
+       d="m -317.69814,47.452094 h -23.80954"
+       id="path2142" />
+    <path
+       style="fill:none;stroke:#aa00d4;stroke-width:2;stroke-linecap:butt;stroke-linejoin:miter;stroke-dasharray:none;stroke-opacity:1"
+       d="m -130.71642,19.101665 h -23.80954"
+       id="path2144" />
+    <g
+       aria-label="}"
+       transform="rotate(180,-59.876965,-0.22738225)"
+       style="font-style:normal;font-weight:normal;font-size:3.175px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#aa00d4;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       id="text1003-5">
+      <path
+         d="m 92.00239,-21.748413 h 0.86816 c 0,0 15.81267,-0.177767 16.15994,-0.5333 0.35553,-0.355534 1.10026,-1.124479 1.10026,-2.306836 v -20.048953 c 0,-1.289844 0.18603,-2.228288 0.5581,-2.815332 0.37207,-0.587044 0.45004,-0.992187 1.36781,-1.215429 -0.91777,-0.206706 -0.99574,-0.603581 -1.36781,-1.190625 -0.37207,-0.587045 -0.5581,-1.529623 -0.5581,-2.827735 v -19.913761 c 0,-1.174088 -0.74473,-1.938899 -1.10026,-2.294433 -0.34727,-0.363802 -15.00239,-0.545703 -16.15994,-0.545703 h -0.86816 v -1.773536 h 0.78134 c 2.05879,0 17.33403,0.305924 18.02029,0.917774 0.69453,0.60358 1.0418,1.81901 1.0418,3.646289 v 19.814542 c 0,1.231966 0.22324,2.087728 0.66973,2.567285 0.44648,0.471289 1.25677,0.706934 2.43086,0.706934 h 0.76894 v 1.773535 h -0.76894 c -1.17409,0 -1.98438,0.239778 -2.43086,0.719336 -0.44649,0.479557 -0.66973,1.343587 -0.66973,2.59209 v 19.937331 c 0,1.827279 -0.34727,3.046842 -1.0418,3.658691 -0.68626,0.611849 -15.9615,0.917774 -18.02029,0.917774 h -0.78134 z"
+         style="font-size:25.4px;fill:#aa00d4;stroke-width:0.264583"
+         id="path1005-3"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="cccsscccsscsccscsscsccscsscscc" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.175px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="-275.85803"
+       y="92.633011"
+       id="text2157"><tspan
+         sodipodi:role="line"
+         x="-275.85803"
+         y="92.633011"
+         style="font-size:6.35px;text-align:center;text-anchor:middle;stroke-width:0.264583"
+         id="tspan2155">DCN</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.175px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="-279.29822"
+       y="110.19857"
+       id="text3141"><tspan
+         sodipodi:role="line"
+         x="-279.29822"
+         y="110.19857"
+         style="font-weight:bold;font-size:6.35px;text-align:center;text-anchor:middle;stroke-width:0.264583"
+         id="tspan3139">SoC</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.175px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="-275.85803"
+       y="123.8538"
+       id="text3375"><tspan
+         sodipodi:role="line"
+         x="-275.85803"
+         y="123.8538"
+         style="font-size:6.35px;text-align:center;text-anchor:middle;stroke-width:0.264583"
+         id="tspan3373">Board/Platform</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.175px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="-107.57491"
+       y="42.939579"
+       id="text3379"><tspan
+         sodipodi:role="line"
+         x="-107.57491"
+         y="42.939579"
+         style="font-size:6.35px;text-align:center;text-anchor:middle;stroke-width:0.264583"
+         id="tspan3377">Display</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.175px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="-182.71582"
+       y="46.643749"
+       id="text3383"><tspan
+         sodipodi:role="line"
+         x="-182.71582"
+         y="46.643749"
+         style="font-size:6.35px;text-align:center;text-anchor:middle;stroke-width:0.264583"
+         id="tspan3381">Connector</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.175px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+       x="-182.71582"
+       y="93.210457"
+       id="text3387"><tspan
+         sodipodi:role="line"
+         x="-182.71582"
+         y="93.210457"
+         style="font-size:6.35px;text-align:center;text-anchor:middle;stroke-width:0.264583"
+         id="tspan3385">Connector</tspan></text>
+  </g>
+</svg>
diff --git a/Documentation/gpu/amdgpu/display/dc-components.svg b/Documentation/gpu/amdgpu/display/dc-components.svg
new file mode 100644
index 000000000000..f84bb2a57c05
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/dc-components.svg
@@ -0,0 +1,732 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   width="533.42053"
+   height="631.18573"
+   viewBox="0 0 141.13418 167.00122"
+   version="1.1"
+   id="svg8"
+   inkscape:version="1.2.2 (b0a8486541, 2022-12-01)"
+   sodipodi:docname="dc-components.svg"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:svg="http://www.w3.org/2000/svg"
+   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:cc="http://creativecommons.org/ns#"
+   xmlns:dc="http://purl.org/dc/elements/1.1/">
+  <defs
+     id="defs2">
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker8858"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path8616"
+         style="fill:#aa00d4;fill-opacity:1;fill-rule:evenodd;stroke:#aa00d4;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Send"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Send"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path8622"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="matrix(-0.3,0,0,-0.3,0.69,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Lend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Lend"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path8592"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:1pt;stroke-opacity:1"
+         transform="matrix(-0.8,0,0,-0.8,-10,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Lend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Lend"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path8610"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1200"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-2"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-9"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-2-1"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-9-9"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-2-7"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-9-8"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-4"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-5"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-0"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-3"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-1"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-2-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-9-1"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-0-7"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-3-4"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-6-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-1-0"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-2-8"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-9-6"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1200-6"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker8858-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path8616-5"
+         style="fill:#00ffcc;fill-opacity:1;fill-rule:evenodd;stroke:#00ffcc;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-3-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-6-56"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-8-0-2"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1200-9-3-9"
+         style="fill:#008000;fill-opacity:1;fill-rule:evenodd;stroke:#008000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+  </defs>
+  <sodipodi:namedview
+     id="base"
+     pagecolor="#ffffff"
+     bordercolor="#666666"
+     borderopacity="1.0"
+     inkscape:pageopacity="0.0"
+     inkscape:pageshadow="2"
+     inkscape:zoom="1.4"
+     inkscape:cx="482.85714"
+     inkscape:cy="470"
+     inkscape:document-units="mm"
+     inkscape:current-layer="layer1"
+     showgrid="false"
+     inkscape:window-width="3840"
+     inkscape:window-height="2083"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
+     inkscape:window-maximized="1"
+     showguides="false"
+     fit-margin-top="0"
+     fit-margin-left="0"
+     fit-margin-right="0"
+     fit-margin-bottom="0"
+     units="px"
+     inkscape:snap-global="false"
+     inkscape:showpageshadow="2"
+     inkscape:pagecheckerboard="0"
+     inkscape:deskcolor="#d1d1d1" />
+  <metadata
+     id="metadata5">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about="">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
+      </cc:Work>
+    </rdf:RDF>
+  </metadata>
+  <g
+     inkscape:label="Layer 1"
+     inkscape:groupmode="layer"
+     id="layer1"
+     transform="translate(384.1992,26.608359)">
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.0511px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.101278"
+       x="-330.72058"
+       y="57.56284"
+       id="text1063" />
+    <rect
+       ry="4.7572436e-07"
+       y="-26.142614"
+       x="-383.73346"
+       height="16.447845"
+       width="140.2027"
+       id="rect744"
+       style="fill:none;stroke:#3771c8;stroke-width:0.93149;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <rect
+       ry="1.0800992e-06"
+       y="-5.1415901"
+       x="-383.27942"
+       height="37.343693"
+       width="40.239418"
+       id="rect602"
+       style="fill:none;stroke:#000000;stroke-width:0.751929;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.476px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163688"
+       x="-363.2121"
+       y="17.270189"
+       id="text3379"><tspan
+         sodipodi:role="line"
+         x="-363.2121"
+         y="17.270189"
+         style="font-size:10.476px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan3377">Core</tspan></text>
+    <rect
+       ry="1.0800992e-06"
+       y="-5.1415901"
+       x="-331.06259"
+       height="37.343693"
+       width="40.239418"
+       id="rect526"
+       style="fill:none;stroke:#000000;stroke-width:0.751929;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <rect
+       ry="4.4701343e-07"
+       y="-5.2654457"
+       x="-286.88507"
+       height="15.455184"
+       width="43.167706"
+       id="rect528"
+       style="fill:none;stroke:#000000;stroke-width:0.501024;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <rect
+       ry="4.4701343e-07"
+       y="15.68337"
+       x="-286.88507"
+       height="15.455184"
+       width="43.167706"
+       id="rect530"
+       style="fill:none;stroke:#000000;stroke-width:0.501024;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <rect
+       ry="4.4701343e-07"
+       y="36.959518"
+       x="-286.88507"
+       height="15.455184"
+       width="43.167706"
+       id="rect532"
+       style="fill:none;stroke:#000000;stroke-width:0.501024;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <rect
+       ry="1.6213723e-06"
+       y="60.089264"
+       x="-286.65378"
+       height="56.057846"
+       width="42.705132"
+       id="rect534"
+       style="fill:none;stroke:#000000;stroke-width:0.949072;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <rect
+       ry="4.4031123e-07"
+       y="37.077362"
+       x="-382.96875"
+       height="15.223459"
+       width="92.225845"
+       id="rect536"
+       style="fill:none;stroke:#000000;stroke-width:0.726817;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <rect
+       ry="4.4031123e-07"
+       y="59.989784"
+       x="-382.96875"
+       height="15.223459"
+       width="92.225845"
+       id="rect538"
+       style="fill:none;stroke:#000000;stroke-width:0.726817;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <rect
+       ry="4.4031123e-07"
+       y="80.283493"
+       x="-382.96875"
+       height="15.223459"
+       width="92.225845"
+       id="rect540"
+       style="fill:none;stroke:#000000;stroke-width:0.726817;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <rect
+       ry="4.3543034e-07"
+       y="124.89404"
+       x="-382.88803"
+       height="15.054706"
+       width="139.2859"
+       id="rect554"
+       style="fill:none;stroke:#000000;stroke-width:0.888245;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:8.73001px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163688"
+       x="-311.29712"
+       y="-16.144287"
+       id="text660"><tspan
+         sodipodi:role="line"
+         x="-311.29712"
+         y="-16.144287"
+         style="font-size:8.73001px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan658">Display Core API (dc/dc.h)</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.476px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163688"
+       x="-311.40384"
+       y="17.511137"
+       id="text664"><tspan
+         sodipodi:role="line"
+         x="-311.40384"
+         y="17.511137"
+         style="font-size:10.476px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan662">Link</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.36501px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163688"
+       x="-336.97806"
+       y="43.095863"
+       id="text668"><tspan
+         sodipodi:role="line"
+         x="-336.97806"
+         y="43.095863"
+         style="font-size:4.36501px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan666">Hardware Sequencer API</tspan><tspan
+         sodipodi:role="line"
+         x="-336.97806"
+         y="48.552124"
+         style="font-size:4.36501px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan670">(dc/inc/hw_sequence.h)</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.36501px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163688"
+       x="-337.03479"
+       y="68.73642"
+       id="text750"><tspan
+         sodipodi:role="line"
+         x="-337.03479"
+         y="68.73642"
+         style="font-size:4.36501px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan748">Hardware Sequencer</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.36501px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163688"
+       x="-336.98022"
+       y="89.209091"
+       id="text756"><tspan
+         sodipodi:role="line"
+         x="-336.98022"
+         y="89.209091"
+         style="font-size:4.36501px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan754">Block Level API (dc/inc/hw)</tspan></text>
+    <g
+       id="g1543"
+       transform="matrix(0.61866289,0,0,0.61866289,-146.50941,-10.146755)">
+      <rect
+         ry="7.3007396e-07"
+         y="180.25436"
+         x="-382.5336"
+         height="25.241808"
+         width="29.376135"
+         id="rect542"
+         style="fill:none;stroke:#000000;stroke-width:0.528201;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         x="-367.99722"
+         y="195.3941"
+         id="text838"><tspan
+           sodipodi:role="line"
+           x="-367.99722"
+           y="195.3941"
+           style="font-size:7.05556px;text-align:center;text-anchor:middle;stroke-width:0.264583"
+           id="tspan836">DCHUB</tspan></text>
+    </g>
+    <a
+       id="a1538"
+       transform="matrix(0.61866289,0,0,0.61866289,-154.037,-10.146755)">
+      <rect
+         ry="7.3027257e-07"
+         y="180.25093"
+         x="-339.82092"
+         height="25.248676"
+         width="28.609333"
+         id="rect546"
+         style="fill:none;stroke:#000000;stroke-width:0.521332;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         x="-325.67853"
+         y="195.35883"
+         id="text842"><tspan
+           sodipodi:role="line"
+           x="-325.67853"
+           y="195.35883"
+           style="font-size:7.05556px;text-align:center;text-anchor:middle;stroke-width:0.264583"
+           id="tspan840">HUBP</tspan></text>
+    </a>
+    <g
+       id="g1533"
+       transform="matrix(0.61866289,0,0,0.61866289,-154.69251,-10.146755)">
+      <rect
+         ry="7.3027257e-07"
+         y="180.25093"
+         x="-308.59961"
+         height="25.248676"
+         width="28.609333"
+         id="rect844"
+         style="fill:none;stroke:#000000;stroke-width:0.521332;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         x="-294.45721"
+         y="195.3941"
+         id="text848"><tspan
+           sodipodi:role="line"
+           x="-294.45721"
+           y="195.3941"
+           style="font-size:7.05556px;text-align:center;text-anchor:middle;stroke-width:0.264583"
+           id="tspan846">DPP</tspan></text>
+    </g>
+    <g
+       id="g1528"
+       transform="matrix(0.61866289,0,0,0.61866289,-155.67539,-10.146755)">
+      <rect
+         ry="7.3027257e-07"
+         y="180.25093"
+         x="-276.84912"
+         height="25.248676"
+         width="28.609333"
+         id="rect850"
+         style="fill:none;stroke:#000000;stroke-width:0.521332;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         x="-262.77728"
+         y="195.3941"
+         id="text854"><tspan
+           sodipodi:role="line"
+           x="-262.77728"
+           y="195.3941"
+           style="font-size:7.05556px;text-align:center;text-anchor:middle;stroke-width:0.264583"
+           id="tspan852">MPC</tspan></text>
+    </g>
+    <g
+       id="g1523"
+       transform="matrix(0.61866289,0,0,0.61866289,-157.64019,-10.146755)">
+      <rect
+         ry="7.3027257e-07"
+         y="180.25093"
+         x="-243.51147"
+         height="25.248676"
+         width="28.609333"
+         id="rect856"
+         style="fill:none;stroke:#000000;stroke-width:0.521332;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.264583"
+         x="-229.2068"
+         y="193.25275"
+         id="text860"><tspan
+           sodipodi:role="line"
+           x="-229.2068"
+           y="193.25275"
+           style="font-size:7.05556px;text-align:center;text-anchor:middle;stroke-width:0.264583"
+           id="tspan858">...</tspan></text>
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.36501px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163688"
+       x="-313.35858"
+       y="133.55629"
+       id="text951"><tspan
+         sodipodi:role="line"
+         x="-313.35858"
+         y="133.55629"
+         style="font-size:4.36501px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan949">Hardware Registers</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.36501px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163688"
+       x="-265.39505"
+       y="86.926537"
+       id="text1044"><tspan
+         sodipodi:role="line"
+         x="-265.39505"
+         y="86.926537"
+         style="font-size:4.36501px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan1042">DMUB</tspan><tspan
+         sodipodi:role="line"
+         x="-265.39505"
+         y="92.382797"
+         style="font-size:4.36501px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan1046">Block</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.36501px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163688"
+       x="-265.42343"
+       y="43.272846"
+       id="text1052"><tspan
+         sodipodi:role="line"
+         x="-265.42343"
+         y="43.272846"
+         style="font-size:4.36501px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan1048">DMUB Hardware API</tspan><tspan
+         sodipodi:role="line"
+         x="-265.42343"
+         y="48.729107"
+         style="font-size:4.36501px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan1050">(dmub/dmub_srv.h)</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.36501px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163688"
+       x="-265.40161"
+       y="24.997644"
+       id="text1058"><tspan
+         sodipodi:role="line"
+         x="-265.40161"
+         y="24.997644"
+         style="font-size:4.36501px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan1056">DMUB Service</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.36501px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.163688"
+       x="-265.30121"
+       y="0.99768418"
+       id="text1064"><tspan
+         sodipodi:role="line"
+         x="-265.30121"
+         y="0.99768418"
+         style="font-size:4.36501px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan1062">DMUB Service API</tspan><tspan
+         sodipodi:role="line"
+         x="-265.30121"
+         y="6.4539466"
+         style="font-size:4.36501px;text-align:center;text-anchor:middle;stroke-width:0.163688"
+         id="tspan1066">(dc/dc_dmub_srv.h)</tspan></text>
+  </g>
+</svg>
diff --git a/Documentation/gpu/amdgpu/display/dcn-blocks.rst b/Documentation/gpu/amdgpu/display/dcn-blocks.rst
index 5e34366f6dbe..756957128dad 100644
--- a/Documentation/gpu/amdgpu/display/dcn-blocks.rst
+++ b/Documentation/gpu/amdgpu/display/dcn-blocks.rst
@@ -1,3 +1,5 @@
+.. _dcn_blocks:
+
 ==========
 DCN Blocks
 ==========
diff --git a/Documentation/gpu/amdgpu/display/dcn-overview.rst b/Documentation/gpu/amdgpu/display/dcn-overview.rst
index 9fea6500448b..eb54a6802e04 100644
--- a/Documentation/gpu/amdgpu/display/dcn-overview.rst
+++ b/Documentation/gpu/amdgpu/display/dcn-overview.rst
@@ -1,3 +1,5 @@
+.. _dcn_overview:
+
 =======================
 Display Core Next (DCN)
 =======================
diff --git a/Documentation/gpu/amdgpu/display/index.rst b/Documentation/gpu/amdgpu/display/index.rst
index f0c342e00a39..bd2d797c123e 100644
--- a/Documentation/gpu/amdgpu/display/index.rst
+++ b/Documentation/gpu/amdgpu/display/index.rst
@@ -90,6 +90,7 @@ table of content:
    display-manager.rst
    dcn-overview.rst
    dcn-blocks.rst
+   programming-model-dcn.rst
    mpo-overview.rst
    dc-debug.rst
    display-contributing.rst
diff --git a/Documentation/gpu/amdgpu/display/programming-model-dcn.rst b/Documentation/gpu/amdgpu/display/programming-model-dcn.rst
new file mode 100644
index 000000000000..c1b48d49fb0b
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/programming-model-dcn.rst
@@ -0,0 +1,162 @@
+====================
+DC Programming Model
+====================
+
+In the :ref:`Display Core Next (DCN) <dcn_overview>` and :ref:`DCN Block
+<dcn_blocks>` pages, you learned about the hardware components and how they
+interact with each other. On this page, the focus is shifted to the display
+code architecture. Hence, it is reasonable to remind the reader that the code
+in DC is shared with other OSes; for this reason, DC provides a set of
+abstractions and operations to connect different APIs with the hardware
+configuration. See DC as a service available for a Display Manager (amdgpu_dm)
+to access and configure DCN/DCE hardware (DCE is also part of DC, but for
+simplicity's sake, this documentation only examines DCN).
+
+.. note::
+   For this page, we will use the term GPU to refers to dGPU and APU.
+
+Overview
+========
+
+From the display hardware perspective, it is plausible to expect that if a
+problem is well-defined, it will probably be implemented at the hardware level.
+On the other hand, when there are multiple ways of achieving something without
+a very well-defined scope, the solution is usually implemented as a policy at
+the DC level. In other words, some policies are defined in the DC core
+(resource management, power optimization, image quality, etc.), and the others
+implemented in hardware are enabled via DC configuration.
+
+In terms of hardware management, DCN has multiple instances of the same block
+(e.g., HUBP, DPP, MPC, etc), and during the driver execution, it might be
+necessary to use some of these instances. The core has policies in place for
+handling those instances. Regarding resource management, the DC objective is
+quite simple: minimize the hardware shuffle when the driver performs some
+actions. When the state changes from A to B, the transition is considered
+easier to maneuver if the hardware resource is still used for the same set of
+driver objects. Usually, adding and removing a resource to a `pipe_ctx` (more
+details below) is not a problem; however, moving a resource from one `pipe_ctx`
+to another should be avoided.
+
+Another area of influence for DC is power optimization, which has a myriad of
+arrangement possibilities. In some way, just displaying an image via DCN should
+be relatively straightforward; however, showing it with the best power
+footprint is more desirable, but it has many associated challenges.
+Unfortunately, there is no straight-forward analytic way to determine if a
+configuration is the best one for the context due to the enormous variety of
+variables related to this problem (e.g., many different DCN/DCE hardware
+versions, different displays configurations, etc.) for this reason DC
+implements a dedicated library for trying some configuration and verify if it
+is possible to support it or not. This type of policy is extremely complex to
+create and maintain, and amdgpu driver relies on Display Mode Library (DML) to
+generate the best decisions.
+
+In summary, DC must deal with the complexity of handling multiple scenarios and
+determine policies to manage them. All of the above information is conveyed to
+give the reader some idea about the complexity of driving a display from the
+driver's perspective. This page hopes to allow the reader to better navigate
+over the amdgpu display code.
+
+Display Driver Architecture Overview
+====================================
+
+The diagram below provides an overview of the display driver architecture;
+notice it illustrates the software layers adopted by DC:
+
+.. kernel-figure:: dc-components.svg
+
+The first layer of the diagram is the high-level DC API represented by the
+`dc.h` file; below it are two big blocks represented by Core and Link. Next is
+the hardware configuration block; the main file describing it is
+the`hw_sequencer.h`, where the implementation of the callbacks can be found in
+the hardware sequencer folder. Almost at the end, you can see the block level
+API (`dc/inc/hw`), which represents each DCN low-level block, such as HUBP,
+DPP, MPC, OPTC, etc. Notice on the left side of the diagram that we have a
+different set of layers representing the interaction with the DMUB
+microcontroller.
+
+Basic Objects
+-------------
+
+The below diagram outlines the basic display objects. In particular, pay
+attention to the names in the boxes since they represent a data structure in
+the driver:
+
+.. kernel-figure:: dc-arch-overview.svg
+
+Let's start with the central block in the image, `dc`. The `dc` struct is
+initialized per GPU; for example, one GPU has one `dc` instance, two GPUs have
+two `dc` instances, and so forth. In other words we have one 'dc' per 'amdgpu'
+instance. In some ways, this object behaves like the `Singleton` pattern.
+
+After the `dc` block in the diagram, you can see the `dc_link` component, which
+is a low-level abstraction for the connector. One interesting aspect of the
+image is that connectors are not part of the DCN block; they are defined by the
+platform/board and not by the SoC. The `dc_link` struct is the high-level data
+container with information such as connected sinks, connection status, signal
+types, etc. After `dc_link`, there is the `dc_sink`, which is the object that
+represents the connected display.
+
+.. note::
+   For historical reasons, we used the name `dc_link`, which gives the
+   wrong impression that this abstraction only deals with physical connections
+   that the developer can easily manipulate. However, this also covers
+   conections like eDP or cases where the output is connected to other devices.
+
+There are two structs that are not represented in the diagram since they were
+elaborated in the DCN overview page  (check the DCN block diagram :ref:`Display
+Core Next (DCN) <dcn_overview>`); still, it is worth bringing back for this
+overview which is `dc_stream` and `dc_state`. The `dc_stream` stores many
+properties associated with the data transmission, but most importantly, it
+represents the data flow from the connector to the display. Next we have
+`dc_state`, which represents the logic state within the hardware at the moment;
+`dc_state` is composed of `dc_stream` and `dc_plane`. The `dc_stream` is the DC
+version of `drm_crtc` and represents the post-blending pipeline.
+
+Speaking of the `dc_plane` data structure (first part of the diagram), you can
+think about it as an abstraction similar to `drm_plane` that represents the
+pre-blending portion of the pipeline. This image was probably processed by GFX
+and is ready to be composited under a `dc_stream`. Normally, the driver may
+have one or more `dc_plane` connected to the same `dc_stream`, which defines a
+composition at the DC level.
+
+Basic Operations
+----------------
+
+Now that we have covered the basic objects, it is time to examine some of the
+basic hardware/software operations. Let's start with the `dc_create()`
+function, which directly works with the `dc` data struct; this function behaves
+like a constructor responsible for the basic software initialization and
+preparing for enabling other parts of the API. It is important to highlight
+that this operation does not touch any hardware configuration; it is only a
+software initialization.
+
+Next, we have the `dc_hardware_init()`, which also relies on the `dc` data
+struct. Its main function is to put the hardware in a valid state. It is worth
+highlighting that the hardware might initialize in an unknown state, and it is
+a requirement to put it in a valid state; this function has multiple callbacks
+for the hardware-specific initialization, whereas `dc_hardware_init` does the
+hardware initialization and is the first point where we touch hardware.
+
+The `dc_get_link_at_index` is an operation that depends on the `dc_link` data
+structure. This function retrieves and enumerates all the `dc_links` available
+on the device; this is required since this information is not part of the SoC
+definition but depends on the board configuration. As soon as the `dc_link` is
+initialized, it is useful to figure out if any of them are already connected to
+the display by using the `dc_link_detect()` function. After the driver figures
+out if any display is connected to the device, the challenging phase starts:
+configuring the monitor to show something. Nonetheless, dealing with the ideal
+configuration is not a DC task since this is the Display Manager (`amdgpu_dm`)
+responsibility which in turn is responsible for dealing with the atomic
+commits. The only interface DC provides to the configuration phase is the
+function `dc_validate_with_context` that receives the configuration information
+and, based on that, validates whether the hardware can support it or not. It is
+important to add that even if the display supports some specific configuration,
+it does not mean the DCN hardware can support it.
+
+After the DM and DC agree upon the configuration, the stream configuration
+phase starts. This task activates one or more `dc_stream` at this phase, and in
+the best-case scenario, you might be able to turn the display on with a black
+screen (it does not show anything yet since it does not have any plane
+associated with it). The final step would be to call the
+`dc_update_planes_and_stream,` which will add or remove planes.
+
-- 
2.45.2

