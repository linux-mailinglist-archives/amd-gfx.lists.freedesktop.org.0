Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DC6549E45
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jun 2022 22:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD7D10F720;
	Mon, 13 Jun 2022 20:02:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2067.outbound.protection.outlook.com [40.107.102.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED19910F786
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jun 2022 20:01:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axT+Foc13HfeqqCvk/kyJaFpFyT+H7JPfrGECQGW3RdBoU57Nym7CR4r2H+x6k3wGkLrMcWHANxFWjX/x2egOlZRiNZMWOlp6TkzLTe0Cua6RPdI98FSZJLnqLU5xqhp6RowQ4bfZ/xtc2WqmS9jwZ0njUcdQlhHpaWqNNl2M7Rv8MUxHGpBV2HE16SZGCeQkBNAV5kkHlLIyS4jlFghrwwBZZ1sX655qx89fRll6w3U7XLol2H19pguFPIuU4sCxwhkpPM22s8oElxX7cV4TcTjh5QWy7SntdFTkZt3AhSxlTMdfLqAv6qHBuMu1WrdAb/2wnFEo2MaIzTNBGsX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MyH75ou8uimCrcv7QFa4pPbbom3yVVM7uvltqyza6c=;
 b=oMt9bV3QQgpFwsp7t1E3aJMUFtDalocHNS7VBUCTamwWIUEqoqlVKwMhy5cZWbVNRzumxFOaRC+BlfXb//Q4L/373aNZc87uh8RHK4UFlmtUsDm/fkjPVxZWbScR0SVcFVG6lKUWTPlq9JJKo/DmVtGh9z1SlVDVmtnZZ4/6kw6QmxsciqCXAGZoNr1JJOrMsE7ipWQdxq7JTlqyo74uIjXq47mTk0VxU1mQRyTsj4SWC5M5hzpdp6YrB2+uof4MQBhQYDNSLTBAfmnsCuAJEnCwEoQXavzAxdC2AOdM9EkzxueWH1Mscam4koclljA53Uxhr+7R6p5RZC+GCAAMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MyH75ou8uimCrcv7QFa4pPbbom3yVVM7uvltqyza6c=;
 b=rxW8Pu82I0dpJENCLF28//yYgS56PkXCYkgVq6N6Wtx/KEyGjOQVzpCYy9QfnAdnw0aevlYGsCSWL+gK/fZqIZqMO+3zIVe13r/5NfzaTOlPx/vTbPrYx5Te2XiXTqfsL5L2b/kQcyiPOEsLSwTwJkA3h2Pl/iCEgMEQ1IGgs6c=
Received: from DS7PR03CA0239.namprd03.prod.outlook.com (2603:10b6:5:3ba::34)
 by PH7PR12MB5618.namprd12.prod.outlook.com (2603:10b6:510:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Mon, 13 Jun
 2022 20:01:56 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::cd) by DS7PR03CA0239.outlook.office365.com
 (2603:10b6:5:3ba::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Mon, 13 Jun 2022 20:01:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Mon, 13 Jun 2022 20:01:55 +0000
Received: from atma2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 13 Jun
 2022 15:01:53 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] Documentation/gpu: Add Multiplane Overlay doc
Date: Mon, 13 Jun 2022 16:01:12 -0400
Message-ID: <20220613200112.3377638-4-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613200112.3377638-1-Rodrigo.Siqueira@amd.com>
References: <20220613200112.3377638-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 928d8417-0677-453f-cc65-08da4d77910b
X-MS-TrafficTypeDiagnostic: PH7PR12MB5618:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB5618198F1491AF3A52D3706A98AB9@PH7PR12MB5618.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MnkXR//sb4FVMXHCzkP5v3I6HrfLjO/ZTtyZlGS0Xde0hqhIvwCX+asDlwpuo32xQPbUCe6cisToMU8bUqruYa5s3tzIcvMs/Ie1kUNLnJVCW/RGWQccspt2FdXkjQVgQCMPVnSlXr2v5FAMmq5EiB0dT5SAhqCPd1uSyO14oqYjQys6CfWJWnzpOvs03JiIcI/d5bhUV53DIY4WW7yH78VS2yhc8dBPrWR8GNbE2x5BUiN6Q9NUULTr/CNeffgwF0Ssk05W/sNO3QAWZeYWBu4Npoyih64oyp1sqqOJ3tu4+O4EtVEcK1QlklXqEEv8ulIy/obKULv71V4ggzYv1VpGd5r8D3lpQcOYjKK0J2gtNJaVoe6FHdvtKYtPxTtslSBwHTm7NA+xos4ovuhY/ghS1tuCl5D9512EuqYySUpOSaOYnHFMi1qvWJIg2rXQodb72vZrOuWzNdxu9JDxCLa4WWhDXChcWdfZV2nxVS96wCk+e5DWomb9zqVspr3Qn0dxcEavwiAvVdbxphrsKDMy6ZxTaBZExzWfK+TsaKJ9TTCoYH2IcoI+oi5UqOPZgJ/6+L+QFQdTQdbLLhNavhVD4TyoVwyuBOx+zjcVBcMCq86DKm7qL/encUM3BQ9Rfo/pJ1Ey/o6FKRm/tD2Zvv89bgr9bl8yDKYKi0LU7D9bniaZAAHS+bv+K7UUaSsQ9eeVrynbfJuXfliVo+3UqzgycdkjN5H3Fxtw76cWDGBflGERl2/GyngcfFfhOi0r5miR2lHXSsti3H6jVqwXZd+e0dKn/VYxCHSBVdZ04NcYb5p1CyjMrTbdC2rVipoIWD23rc9JsYoLFvBrFrCAU9rEaoOz1ZwHS/yNxG/uIUc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(36840700001)(46966006)(40470700004)(36756003)(2906002)(356005)(7696005)(26005)(81166007)(186003)(30864003)(7416002)(86362001)(8936002)(40460700003)(36860700001)(5660300002)(70586007)(4326008)(966005)(1076003)(508600001)(6666004)(2616005)(70206006)(426003)(47076005)(66574015)(336012)(19273905006)(82310400005)(8676002)(83380400001)(16526019)(6916009)(316002)(54906003)(36900700001)(559001)(579004)(563064011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:01:55.5169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 928d8417-0677-453f-cc65-08da4d77910b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5618
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Alex Hung <alex.hung@amd.com>, maira.canal@usp.br, mwen@igalia.com,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, tales.aparecida@gmail.com, Sean
 Paul <seanpaul@chromium.org>, isabbasso@riseup.net, andrealmeid@riseup.net,
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Pierre-Loup <pgriffais@valvesoftware.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Multiple plane overlay is a feature supported by AMD hardware, but it
has specific details that deserve proper documentation. This commit
introduces a documentation that describes some of the features,
limitations, and use cases for this feature. Part of this documentation
came from some discussion in the public upstream [1][2].

[1]. https://lore.kernel.org/amd-gfx/3qY-QeukF_Q_MJeIXAuBjO4szbS4jRtqkTifXnbnN3bp88SxVodFQRpah3mIIVJq24DUkF6g0rOGdCmSqTvVxx9LCGEItmzLw8uWU44jtXE=@emersion.fr/
[2]. https://lore.kernel.org/amd-gfx/864e45d0-c14b-3b12-0f5b-9d26a9cb41bd@amd.com/

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Pierre-Loup <pgriffais@valvesoftware.com>
Cc: Michel Dänzer <michel.daenzer@mailbox.org>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu/display/index.rst    |   1 +
 .../gpu/amdgpu/display/mpo-cursor.svg         | 435 ++++++++++++++++++
 .../gpu/amdgpu/display/mpo-overview.rst       | 242 ++++++++++
 .../multi-display-hdcp-mpo-less-pipe-ex.svg   | 220 +++++++++
 .../amdgpu/display/multi-display-hdcp-mpo.svg | 171 +++++++
 .../single-display-mpo-multi-video.svg        | 339 ++++++++++++++
 .../gpu/amdgpu/display/single-display-mpo.svg | 266 +++++++++++
 7 files changed, 1674 insertions(+)
 create mode 100644 Documentation/gpu/amdgpu/display/mpo-cursor.svg
 create mode 100644 Documentation/gpu/amdgpu/display/mpo-overview.rst
 create mode 100644 Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo-less-pipe-ex.svg
 create mode 100644 Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo.svg
 create mode 100644 Documentation/gpu/amdgpu/display/single-display-mpo-multi-video.svg
 create mode 100644 Documentation/gpu/amdgpu/display/single-display-mpo.svg

diff --git a/Documentation/gpu/amdgpu/display/index.rst b/Documentation/gpu/amdgpu/display/index.rst
index c1fb2fb3c710..f8a4f53d70d8 100644
--- a/Documentation/gpu/amdgpu/display/index.rst
+++ b/Documentation/gpu/amdgpu/display/index.rst
@@ -28,4 +28,5 @@ table of content:
    display-manager.rst
    dc-debug.rst
    dcn-overview.rst
+   mpo-overview.rst
    dc-glossary.rst
diff --git a/Documentation/gpu/amdgpu/display/mpo-cursor.svg b/Documentation/gpu/amdgpu/display/mpo-cursor.svg
new file mode 100644
index 000000000000..9d9de76847c3
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/mpo-cursor.svg
@@ -0,0 +1,435 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   xmlns:dc="http://purl.org/dc/elements/1.1/"
+   xmlns:cc="http://creativecommons.org/ns#"
+   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:svg="http://www.w3.org/2000/svg"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   width="160.5318mm"
+   height="65.443306mm"
+   viewBox="0 0 160.5318 65.443308"
+   version="1.1"
+   id="svg843"
+   inkscape:version="0.92.5 (2060ec1f9f, 2020-04-08)"
+   sodipodi:docname="mpo-cursor.svg">
+  <defs
+     id="defs837">
+    <marker
+       inkscape:stockid="Arrow1Send"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Send"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1568"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.2,0,0,-0.2,-1.2,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Mend"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1562"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.4,0,0,-0.4,-4,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker1837"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1835"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
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
+         id="path1580"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Send"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Send-7"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1568-5"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.2,0,0,-0.2,-1.2,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Send"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Send-7-2"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1568-5-2"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.2,0,0,-0.2,-1.2,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Send"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Send-9"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1568-7"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.2,0,0,-0.2,-1.2,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Send"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Send-9-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1568-7-1"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.2,0,0,-0.2,-1.2,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Send"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Send-9-6-9"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1568-7-1-3"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.2,0,0,-0.2,-1.2,0)" />
+    </marker>
+  </defs>
+  <sodipodi:namedview
+     id="base"
+     pagecolor="#ffffff"
+     bordercolor="#666666"
+     borderopacity="1.0"
+     inkscape:pageopacity="0.0"
+     inkscape:pageshadow="2"
+     inkscape:zoom="0.35"
+     inkscape:cx="895.68984"
+     inkscape:cy="-284.87808"
+     inkscape:document-units="mm"
+     inkscape:current-layer="g1433-6"
+     showgrid="false"
+     inkscape:window-width="2560"
+     inkscape:window-height="1376"
+     inkscape:window-x="0"
+     inkscape:window-y="27"
+     inkscape:window-maximized="1"
+     fit-margin-top="0"
+     fit-margin-left="0"
+     fit-margin-right="0"
+     fit-margin-bottom="0" />
+  <metadata
+     id="metadata840">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about="">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
+        <dc:title></dc:title>
+      </cc:Work>
+    </rdf:RDF>
+  </metadata>
+  <g
+     inkscape:label="Layer 1"
+     inkscape:groupmode="layer"
+     id="layer1"
+     transform="translate(70.035531,-11.72001)">
+    <g
+       id="g1438"
+       transform="matrix(0.33108827,0,0,0.33108827,-46.847588,7.8396545)">
+      <rect
+         y="51.228218"
+         x="-69.09626"
+         height="34.773811"
+         width="66.523811"
+         id="rect1388"
+         style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:1.87854159;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <text
+         id="text1392"
+         y="73.238098"
+         x="-59.718166"
+         style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           style="font-weight:bold;font-size:12.69999981px;stroke-width:0.26458332"
+           y="73.238098"
+           x="-59.718166"
+           id="tspan1390"
+           sodipodi:role="line">Cursor</tspan></text>
+    </g>
+    <g
+       id="g1433"
+       transform="matrix(0.33108827,0,0,0.33108827,-49.701591,6.5552955)">
+      <rect
+         y="116.32738"
+         x="-60.476192"
+         height="34.773811"
+         width="66.523811"
+         id="rect1388-3"
+         style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:1.87854159;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <text
+         id="text1392-6"
+         y="138.44888"
+         x="-53.932037"
+         style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           style="font-weight:bold;font-size:12.69999981px;stroke-width:0.26458332"
+           y="138.44888"
+           x="-53.932037"
+           id="tspan1390-7"
+           sodipodi:role="line">Plane 1</tspan></text>
+    </g>
+    <g
+       id="g1428"
+       transform="matrix(0.33108827,0,0,0.33108827,-46.847588,7.8396518)">
+      <rect
+         y="173.66814"
+         x="-69.09626"
+         height="34.773811"
+         width="66.523811"
+         id="rect1388-5"
+         style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:1.87854159;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <text
+         id="text1392-3"
+         y="195.78964"
+         x="-62.437382"
+         style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           style="font-weight:bold;font-size:12.69999981px;stroke-width:0.26458332"
+           y="195.78964"
+           x="-62.437382"
+           id="tspan1390-5"
+           sodipodi:role="line">Plane 2</tspan></text>
+    </g>
+    <g
+       id="g1433-6"
+       transform="translate(116.41667,-9.0714256)">
+      <g
+         id="g1467"
+         transform="matrix(0.33108827,0,0,0.33108827,-132.72925,15.626721)">
+        <rect
+           style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:1.87854159;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+           id="rect1388-3-2"
+           width="66.523811"
+           height="34.773811"
+           x="-60.476192"
+           y="116.32738" />
+        <text
+           xml:space="preserve"
+           style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+           x="-45.380619"
+           y="138.33725"
+           id="text1392-6-9"><tspan
+             sodipodi:role="line"
+             id="tspan1390-7-1"
+             x="-45.380619"
+             y="138.33725"
+             style="font-weight:bold;font-size:12.69999981px;stroke-width:0.26458332">CRTC</tspan></text>
+      </g>
+      <g
+         id="g1438-2"
+         transform="matrix(0.33108827,0,0,0.33108827,-92.282164,27.16881)">
+        <rect
+           y="51.228218"
+           x="-69.09626"
+           height="34.773811"
+           width="66.523811"
+           id="rect1388-7"
+           style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:1.87854159;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+        <text
+           id="text1392-0"
+           y="73.238098"
+           x="-59.718166"
+           style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+           xml:space="preserve"><tspan
+             style="font-weight:bold;font-size:12.69999981px;stroke-width:0.26458332"
+             y="73.238098"
+             x="-59.718166"
+             id="tspan1390-9"
+             sodipodi:role="line">Cursor</tspan></text>
+      </g>
+      <g
+         id="g1433-3"
+         transform="matrix(0.33108827,0,0,0.33108827,-61.59731,5.6152398)">
+        <rect
+           y="116.32738"
+           x="-60.476192"
+           height="34.773811"
+           width="66.523811"
+           id="rect1388-3-6"
+           style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:1.87854159;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+        <text
+           id="text1392-6-0"
+           y="138.44888"
+           x="-53.932037"
+           style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+           xml:space="preserve"><tspan
+             style="font-weight:bold;font-size:12.69999981px;stroke-width:0.26458332"
+             y="138.44888"
+             x="-53.932037"
+             id="tspan1390-7-6"
+             sodipodi:role="line">Plane 1</tspan></text>
+      </g>
+      <g
+         id="g1428-2"
+         transform="matrix(0.33108827,0,0,0.33108827,-58.743296,6.7994816)">
+        <rect
+           y="173.66814"
+           x="-69.09626"
+           height="34.773811"
+           width="66.523811"
+           id="rect1388-5-6"
+           style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:1.87854159;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+        <text
+           id="text1392-3-1"
+           y="195.78964"
+           x="-62.437382"
+           style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+           xml:space="preserve"><tspan
+             style="font-weight:bold;font-size:12.69999981px;stroke-width:0.26458332"
+             y="195.78964"
+             x="-62.437382"
+             id="tspan1390-5-8"
+             sodipodi:role="line">Plane 2</tspan></text>
+      </g>
+      <g
+         id="g1467-7"
+         transform="matrix(0.33108827,0,0,0.33108827,-28.233674,5.6152398)">
+        <rect
+           style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:1.87854159;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+           id="rect1388-3-2-9"
+           width="66.523811"
+           height="34.773811"
+           x="-60.476192"
+           y="116.32738" />
+        <text
+           xml:space="preserve"
+           style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+           x="-45.380619"
+           y="138.33725"
+           id="text1392-6-9-2"><tspan
+             sodipodi:role="line"
+             id="tspan1390-7-1-0"
+             x="-45.380619"
+             y="138.33725"
+             style="font-weight:bold;font-size:12.69999981px;stroke-width:0.26458332">CRTC</tspan></text>
+      </g>
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:1.05120528px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.08760043"
+         x="-164.26541"
+         y="24.302296"
+         id="text1531"><tspan
+           sodipodi:role="line"
+           id="tspan1529"
+           x="-164.26541"
+           y="24.302296"
+           style="font-weight:bold;font-size:4.6720233px;stroke-width:0.08760043">DRM</tspan></text>
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:1.05120528px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.08760043"
+         x="-89.233742"
+         y="24.341078"
+         id="text1531-2"><tspan
+           sodipodi:role="line"
+           id="tspan1529-3"
+           x="-89.233742"
+           y="24.341078"
+           style="font-weight:bold;font-size:4.6720233px;stroke-width:0.08760043">AMD Hardware</tspan></text>
+      <path
+         style="fill:none;stroke:#000000;stroke-width:1.53318286;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow1Send)"
+         d="m -164.26541,39.407343 h 20.27325 v 11.262913"
+         id="path1551"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="ccc" />
+      <path
+         style="fill:none;stroke:#000000;stroke-width:1.53318286;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow1Send-7)"
+         d="m -164.11597,80.385815 h 20.27325 v -11.26291"
+         id="path1551-9"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="ccc" />
+      <path
+         style="fill:none;stroke:#000000;stroke-width:1.53318286;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow1Send-7-2)"
+         d="m -59.24211,70.452123 h 20.273243 V 59.18921"
+         id="path1551-9-8"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="ccc" />
+      <path
+         style="fill:none;stroke:#000000;stroke-width:1.53318286;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow1Send-9)"
+         d="m -163.61178,59.821549 h 9.26062"
+         id="path1551-3"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#000000;stroke-width:1.53318286;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow1Send-9-6)"
+         d="m -93.426241,50.16968 h 9.260617"
+         id="path1551-3-2"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#000000;stroke-width:1.53318286;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow1Send-9-6-9)"
+         d="m -59.637503,50.169684 h 9.260618"
+         id="path1551-3-2-1"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="cc" />
+    </g>
+  </g>
+</svg>
diff --git a/Documentation/gpu/amdgpu/display/mpo-overview.rst b/Documentation/gpu/amdgpu/display/mpo-overview.rst
new file mode 100644
index 000000000000..0499aa92d08d
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/mpo-overview.rst
@@ -0,0 +1,242 @@
+========================
+Multiplane Overlay (MPO)
+========================
+
+.. note:: You will get more from this page if you have already read the
+   'Documentation/gpu/amdgpu/display/dcn-overview.rst'.
+
+
+Multiplane Overlay (MPO) allows for multiple framebuffers to be composited via
+fixed-function hardware in the display controller rather than using graphics or
+compute shaders for composition. This can yield some power savings if it means
+the graphics/compute pipelines can be put into low-power states. In summary,
+MPO can bring the following benefits:
+
+* Decreased GPU and CPU workload - no composition shaders needed, no extra
+  buffer copy needed, GPU can remain idle.
+* Plane independent page flips - No need to be tied to global compositor
+  page-flip present rate, reduced latency, independent timing.
+
+.. note:: Keep in mind that MPO is all about power-saving; if you want to learn
+   more about power-save in the display context, check the link:
+   `Power <https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/power.rst>`__.
+
+Multiplane Overlay is only available using the DRM atomic model. The atomic
+model only uses a single userspace IOCTL for configuring the display hardware
+(modesetting, page-flipping, etc) - drmModeAtomicCommit. To query hardware
+resources and limitations userspace also calls into drmModeGetResources which
+reports back the number of planes, CRTCs, and connectors. There are three types
+of DRM planes that the driver can register and work with:
+
+* ``DRM_PLANE_TYPE_PRIMARY``: Primary planes represent a "main" plane for a
+  CRTC, primary planes are the planes operated upon by CRTC modesetting and
+  flipping operations.
+* ``DRM_PLANE_TYPE_CURSOR``: Cursor planes represent a "cursor" plane for a
+  CRTC. Cursor planes are the planes operated upon by the cursor IOCTLs
+* ``DRM_PLANE_TYPE_OVERLAY``: Overlay planes represent all non-primary,
+  non-cursor planes. Some drivers refer to these types of planes as "sprites"
+  internally.
+
+To illustrate how it works, let's take a look at a device that exposes the
+following planes to userspace:
+
+* 4 Primary planes (1 per CRTC).
+* 4 Cursor planes (1 per CRTC).
+* 1 Overlay plane (shared among CRTCs).
+
+.. note:: Keep in mind that different ASICs might expose other numbers of
+   planes.
+
+For this hardware example, we have 4 pipes (if you don't know what AMD pipe
+means, look at 'Documentation/gpu/amdgpu/display/dcn-overview.rst', section
+"AMD Hardware Pipeline"). Typically most AMD devices operate in a pipe-split
+configuration for optimal single display output (e.g., 2 pipes per plane).
+
+A typical MPO configuration from userspace - 1 primary + 1 overlay on a single
+display - will see 4 pipes in use, 2 per plane.
+
+At least 1 pipe must be used per plane (primary and overlay), so for this
+hypothetical hardware that we are using as an example, we have an absolute
+limit of 4 planes across all CRTCs. Atomic commits will be rejected for display
+configurations using more than 4 planes. Again, it is important to stress that
+every DCN has different restrictions; here, we are just trying to provide the
+concept idea.
+
+Plane Restrictions
+==================
+
+AMDGPU imposes restrictions on the use of DRM planes in the driver.
+
+Atomic commits will be rejected for commits which do not follow these
+restrictions:
+
+* Overlay planes must be in ARGB8888 or XRGB8888 format
+* Planes cannot be placed outside of the CRTC destination rectangle
+* Planes cannot be downscaled more than 1/4x of their original size
+* Planes cannot be upscaled more than 16x of their original size
+
+Not every property is available on every plane:
+
+* Only primary planes have color-space and non-RGB format support
+* Only overlay planes have alpha blending support
+
+Cursor Restrictions
+===================
+
+Before we start to describe some restrictions around cursor and MPO, see the
+below image:
+
+.. kernel-figure:: mpo-cursor.svg
+
+The image on the left side represents how DRM expects the cursor and planes to
+be blended. However, AMD hardware handles cursors differently, as you can see
+on the right side; basically, our cursor cannot be drawn outside its associated
+plane as it is being treated as part of the plane. Another consequence of that
+is that cursors inherit the color and scale from the plane.
+
+As a result of the above behavior, do not use legacy API to set up the cursor
+plane when working with MPO; otherwise, you might encounter unexpected
+behavior.
+
+In short, AMD HW has no dedicated cursor planes. A cursor is attached to
+another plane and therefore inherits any scaling or color processing from its
+parent plane.
+
+Use Cases
+=========
+
+Picture-in-Picture (PIP) playback - Underlay strategy
+-----------------------------------------------------
+
+Video playback should be done using the "primary plane as underlay" MPO
+strategy. This is a 2 planes configuration:
+
+* 1 YUV DRM Primary Plane (e.g. NV12 Video)
+* 1 RGBA DRM Overlay Plane (e.g. ARGB8888 desktop). The compositor should
+  prepare the framebuffers for the planes as follows:
+  - The overlay plane contains general desktop UI, video player controls, and video subtitles
+  - Primary plane contains one or more videos
+
+.. note:: Keep in mind that we could extend this configuration to more planes,
+   but that is currently not supported by our driver yet (maybe if we have a
+   userspace request in the future, we can change that).
+
+See below a single-video example:
+
+.. kernel-figure:: single-display-mpo.svg
+
+.. note:: We could extend this behavior to more planes, but that is currently
+   not supported by our driver.
+
+The video buffer should be used directly for the primary plane. The video can
+be scaled and positioned for the desktop using the properties: CRTC_X, CRTC_Y,
+CRTC_W, and CRTC_H. The primary plane should also have the color encoding and
+color range properties set based on the source content:
+
+* ``COLOR_RANGE``, ``COLOR_ENCODING``
+
+The overlay plane should be the native size of the CRTC. The compositor must
+draw a transparent cutout for where the video should be placed on the desktop
+(i.e., set the alpha to zero). The primary plane video will be visible through
+the underlay. The overlay plane's buffer may remain static while the primary
+plane's framebuffer is used for standard double-buffered playback.
+
+The compositor should create a YUV buffer matching the native size of the CRTC.
+Each video buffer should be composited onto this YUV buffer for direct YUV
+scanout. The primary plane should have the color encoding and color range
+properties set based on the source content: ``COLOR_RANGE``,
+``COLOR_ENCODING``. However, be mindful that the source color space and
+encoding match for each video since it affect the entire plane.
+
+The overlay plane should be the native size of the CRTC. The compositor must
+draw a transparent cutout for where each video should be placed on the desktop
+(i.e., set the alpha to zero). The primary plane videos will be visible through
+the underlay. The overlay plane's buffer may remain static while compositing
+operations for video playback will be done on the video buffer.
+
+This kernel interface is validated using IGT GPU Tools. The following tests can
+be run to validate positioning, blending, scaling under a variety of sequences
+and interactions with operations such as DPMS and S3:
+
+- ``kms_plane@plane-panning-bottom-right-pipe-*-planes``
+- ``kms_plane@plane-panning-bottom-right-suspend-pipe-*-``
+- ``kms_plane@plane-panning-top-left-pipe-*-``
+- ``kms_plane@plane-position-covered-pipe-*-``
+- ``kms_plane@plane-position-hole-dpms-pipe-*-``
+- ``kms_plane@plane-position-hole-pipe-*-``
+- ``kms_plane_multiple@atomic-pipe-*-tiling-``
+- ``kms_plane_scaling@pipe-*-plane-scaling``
+- ``kms_plane_alpha_blend@pipe-*-alpha-basic``
+- ``kms_plane_alpha_blend@pipe-*-alpha-transparant-fb``
+- ``kms_plane_alpha_blend@pipe-*-alpha-opaque-fb``
+- ``kms_plane_alpha_blend@pipe-*-constant-alpha-min``
+- ``kms_plane_alpha_blend@pipe-*-constant-alpha-mid``
+- ``kms_plane_alpha_blend@pipe-*-constant-alpha-max``
+
+Multiple Display MPO
+--------------------
+
+AMDGPU supports display MPO when using multiple displays; however, this feature
+behavior heavily relies on the compositor implementation. Keep in mind that
+usespace can define different policies. For example, some OSes can use MPO to
+protect the plane that handles the video playback; notice that we don't have
+many limitations for a single display. Nonetheless, this manipulation can have
+many more restrictions for a multi-display scenario. The below example shows a
+video playback in the middle of two displays, and it is up to the compositor to
+define a policy on how to handle it:
+
+.. kernel-figure:: multi-display-hdcp-mpo.svg
+
+Let's discuss some of the hardware limitations we have when dealing with
+multi-display with MPO.
+
+Limitations
+~~~~~~~~~~~
+
+For simplicity's sake, for discussing the hardware limitation, this
+documentation supposes an example where we have two displays and video playback
+that will be moved around different displays.
+
+* **Hardware limitations**
+
+From the DCN overview page, each display requires at least one pipe and each
+MPO plane needs another pipe. As a result, when the video is in the middle of
+the two displays, we need to use 2 pipes. See the example below where we avoid
+pipe split:
+
+- 1 display (1 pipe) + MPO (1 pipe), we will use two pipes
+- 2 displays (2 pipes) + MPO (1-2 pipes); we will use 4 pipes. MPO in the
+  middle of both displays needs 2 pipes.
+- 3 Displays (3 pipes) + MPO (1-2 pipes), we need 5 pipes.
+
+If we use MPO with multiple displays, the userspace has to decide to enable
+multiple MPO by the price of limiting the number of external displays supported
+or disable it in favor of multiple displays; it is a policy decision. For
+example:
+
+* When ASIC has 3 pipes, AMD hardware can NOT support 2 displays with MPO
+* When ASIC has 4 pipes, AMD hardware can NOT support 3 displays with MPO
+
+Let's briefly explore how userspace can handle these two display configurations
+on an ASIC that only supports three pipes. We can have:
+
+.. kernel-figure:: multi-display-hdcp-mpo-less-pipe-ex.svg
+
+- Total pipes are 3
+- User lights up 2 displays (2 out of 3 pipes are used)
+- User launches video (1 pipe used for MPO)
+- Now, if the user moves the video in the middle of 2 displays, one part of the
+  video won't be MPO since we have used 3/3 pipes.
+
+* **Scaling limitation**
+
+MPO cannot handle scaling less than 0.25 and more than x16. For example:
+
+If 4k video (3840x2160) is playing in windowed mode, the physical size of the
+window cannot be smaller than (960x540).
+
+.. note:: These scaling limitations might vary from ASIC to ASIC.
+
+* **Size Limitation**
+
+The minimum MPO size is 12px.
diff --git a/Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo-less-pipe-ex.svg b/Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo-less-pipe-ex.svg
new file mode 100644
index 000000000000..6d06b39e83fa
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo-less-pipe-ex.svg
@@ -0,0 +1,220 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   xmlns:dc="http://purl.org/dc/elements/1.1/"
+   xmlns:cc="http://creativecommons.org/ns#"
+   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:svg="http://www.w3.org/2000/svg"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   width="103.08798mm"
+   height="30.335283mm"
+   viewBox="0 0 103.08798 30.335284"
+   version="1.1"
+   id="svg8"
+   inkscape:version="0.92.5 (2060ec1f9f, 2020-04-08)"
+   sodipodi:docname="multi-display-hdcp-mpo-less-pipe-ex.svg">
+  <defs
+     id="defs2">
+    <marker
+       inkscape:stockid="TriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="TriangleOutL"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1133"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="scale(0.8)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="TriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="TriangleOutL-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1133-0"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="scale(0.8)" />
+    </marker>
+  </defs>
+  <sodipodi:namedview
+     id="base"
+     pagecolor="#ffffff"
+     bordercolor="#666666"
+     borderopacity="1.0"
+     inkscape:pageopacity="0.0"
+     inkscape:pageshadow="2"
+     inkscape:zoom="1.979899"
+     inkscape:cx="205.69673"
+     inkscape:cy="33.960031"
+     inkscape:document-units="mm"
+     inkscape:current-layer="layer1"
+     showgrid="false"
+     inkscape:window-width="1288"
+     inkscape:window-height="1376"
+     inkscape:window-x="1272"
+     inkscape:window-y="27"
+     inkscape:window-maximized="0"
+     fit-margin-top="0"
+     fit-margin-left="0"
+     fit-margin-right="0"
+     fit-margin-bottom="0" />
+  <metadata
+     id="metadata5">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about="">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
+        <dc:title></dc:title>
+      </cc:Work>
+    </rdf:RDF>
+  </metadata>
+  <g
+     inkscape:label="Layer 1"
+     inkscape:groupmode="layer"
+     id="layer1"
+     transform="translate(112.75816,51.721433)">
+    <rect
+       style="fill:#ffe680;fill-opacity:1;stroke:#000000;stroke-width:0.62916809;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect836"
+       width="48.988979"
+       height="29.48851"
+       x="-112.44358"
+       y="-51.189243"
+       ry="0" />
+    <rect
+       style="fill:#008000;fill-opacity:1;stroke:none;stroke-width:0.38327959;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect834"
+       width="14.422765"
+       height="15.872559"
+       x="-78.227928"
+       y="-44.469936" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-71.189278"
+       y="-48.114422"
+       id="text844"><tspan
+         sodipodi:role="line"
+         x="-71.189278"
+         y="-48.114422"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846">Protected</tspan><tspan
+         sodipodi:role="line"
+         x="-71.189278"
+         y="-45.584015"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan2288">MPO plane</tspan></text>
+    <rect
+       style="fill:#ffe680;fill-opacity:1;stroke:#000000;stroke-width:0.62916809;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect836-3"
+       width="48.988979"
+       height="29.48851"
+       x="-58.973743"
+       y="-51.406849"
+       ry="0" />
+    <rect
+       style="fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.2500253;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect834-6"
+       width="6.1374092"
+       height="15.872559"
+       x="-58.632965"
+       y="-44.469936" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-107.96788"
+       y="-47.033775"
+       id="text844-7"><tspan
+         sodipodi:role="line"
+         x="-107.96788"
+         y="-47.033775"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777767px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846-3">#1</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-15.20074"
+       y="-46.715996"
+       id="text844-7-2"><tspan
+         sodipodi:role="line"
+         x="-15.20074"
+         y="-46.715996"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777767px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846-3-9">#2</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-88.926605"
+       y="-23.173674"
+       id="text844-1"><tspan
+         sodipodi:role="line"
+         x="-88.926605"
+         y="-23.173674"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846-7">Desktop</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-33.770744"
+       y="-23.819901"
+       id="text844-1-0"><tspan
+         sodipodi:role="line"
+         x="-33.770744"
+         y="-23.819901"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846-7-9">Desktop</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-75.17498"
+       y="-41.219398"
+       id="text844-7-2-3"><tspan
+         sodipodi:role="line"
+         x="-75.17498"
+         y="-41.219398"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777767px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;fill:#ffffff;stroke-width:0.06901112"
+         id="tspan846-3-9-6">#3</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-47.142235"
+       y="-48.056866"
+       id="text844-0"><tspan
+         sodipodi:role="line"
+         x="-47.142235"
+         y="-48.056866"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan2288-2">Software</tspan><tspan
+         sodipodi:role="line"
+         x="-47.142235"
+         y="-45.526459"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan2313">Composited Video</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-36.23288"
+       y="-34.592064"
+       id="text844-1-6"><tspan
+         sodipodi:role="line"
+         x="-36.23288"
+         y="-34.592064"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846-7-1">Video will not be displayed</tspan></text>
+  </g>
+</svg>
diff --git a/Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo.svg b/Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo.svg
new file mode 100644
index 000000000000..84d53a558b05
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/multi-display-hdcp-mpo.svg
@@ -0,0 +1,171 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   xmlns:dc="http://purl.org/dc/elements/1.1/"
+   xmlns:cc="http://creativecommons.org/ns#"
+   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:svg="http://www.w3.org/2000/svg"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   width="103.08798mm"
+   height="30.335283mm"
+   viewBox="0 0 103.08798 30.335284"
+   version="1.1"
+   id="svg8"
+   inkscape:version="0.92.5 (2060ec1f9f, 2020-04-08)"
+   sodipodi:docname="multi-display-hdcp-mpo.svg">
+  <defs
+     id="defs2">
+    <marker
+       inkscape:stockid="TriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="TriangleOutL"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1133"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="scale(0.8)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="TriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="TriangleOutL-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1133-0"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="scale(0.8)" />
+    </marker>
+  </defs>
+  <sodipodi:namedview
+     id="base"
+     pagecolor="#ffffff"
+     bordercolor="#666666"
+     borderopacity="1.0"
+     inkscape:pageopacity="0.0"
+     inkscape:pageshadow="2"
+     inkscape:zoom="1.979899"
+     inkscape:cx="196.85789"
+     inkscape:cy="33.960027"
+     inkscape:document-units="mm"
+     inkscape:current-layer="layer1"
+     showgrid="false"
+     inkscape:window-width="1288"
+     inkscape:window-height="1376"
+     inkscape:window-x="1272"
+     inkscape:window-y="27"
+     inkscape:window-maximized="0"
+     fit-margin-top="0"
+     fit-margin-left="0"
+     fit-margin-right="0"
+     fit-margin-bottom="0" />
+  <metadata
+     id="metadata5">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about="">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
+        <dc:title></dc:title>
+      </cc:Work>
+    </rdf:RDF>
+  </metadata>
+  <g
+     inkscape:label="Layer 1"
+     inkscape:groupmode="layer"
+     id="layer1"
+     transform="translate(112.75816,51.721433)">
+    <rect
+       style="fill:#ffe680;fill-opacity:1;stroke:#000000;stroke-width:0.62916809;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect836"
+       width="48.988979"
+       height="29.48851"
+       x="-112.44358"
+       y="-51.189243"
+       ry="0" />
+    <rect
+       style="fill:#008000;fill-opacity:1;stroke:none;stroke-width:0.38327959;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect834"
+       width="14.422765"
+       height="15.872559"
+       x="-78.227928"
+       y="-44.469936" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-71.189278"
+       y="-48.114422"
+       id="text844"><tspan
+         sodipodi:role="line"
+         x="-71.189278"
+         y="-48.114422"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846">Protected</tspan><tspan
+         sodipodi:role="line"
+         x="-71.189278"
+         y="-45.584015"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan2288">MPO plane</tspan></text>
+    <rect
+       style="fill:#ffe680;fill-opacity:1;stroke:#000000;stroke-width:0.62916809;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect836-3"
+       width="48.988979"
+       height="29.48851"
+       x="-58.973743"
+       y="-51.406849"
+       ry="0" />
+    <rect
+       style="fill:#008000;fill-opacity:1;stroke:none;stroke-width:0.2500253;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect834-6"
+       width="6.1374092"
+       height="15.872559"
+       x="-58.632965"
+       y="-44.469936" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-88.926605"
+       y="-23.173674"
+       id="text844-1"><tspan
+         sodipodi:role="line"
+         x="-88.926605"
+         y="-23.173674"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846-7">Desktop</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-33.770744"
+       y="-23.819901"
+       id="text844-1-0"><tspan
+         sodipodi:role="line"
+         x="-33.770744"
+         y="-23.819901"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846-7-9">Desktop</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-70.364128"
+       y="-35.740372"
+       id="text844-7-2-3"><tspan
+         sodipodi:role="line"
+         x="-70.364128"
+         y="-35.740372"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.52777767px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;fill:#ffffff;stroke-width:0.06901112"
+         id="tspan846-3-9-6">Video</tspan></text>
+  </g>
+</svg>
diff --git a/Documentation/gpu/amdgpu/display/single-display-mpo-multi-video.svg b/Documentation/gpu/amdgpu/display/single-display-mpo-multi-video.svg
new file mode 100644
index 000000000000..fa807115cfe2
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/single-display-mpo-multi-video.svg
@@ -0,0 +1,339 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   xmlns:dc="http://purl.org/dc/elements/1.1/"
+   xmlns:cc="http://creativecommons.org/ns#"
+   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:svg="http://www.w3.org/2000/svg"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   width="112.16296mm"
+   height="93.314507mm"
+   viewBox="0 0 112.16296 93.314508"
+   version="1.1"
+   id="svg8"
+   inkscape:version="0.92.5 (2060ec1f9f, 2020-04-08)"
+   sodipodi:docname="single-display-mpo-multi-video.svg">
+  <defs
+     id="defs2">
+    <marker
+       inkscape:stockid="TriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="TriangleOutL"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1133"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="scale(0.8)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Send"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Send"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1006"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.2,0,0,-0.2,-1.2,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="TriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="TriangleOutL-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1133-0"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="scale(0.8)" />
+    </marker>
+  </defs>
+  <sodipodi:namedview
+     id="base"
+     pagecolor="#ffffff"
+     bordercolor="#666666"
+     borderopacity="1.0"
+     inkscape:pageopacity="0.0"
+     inkscape:pageshadow="2"
+     inkscape:zoom="1.979899"
+     inkscape:cx="255.95284"
+     inkscape:cy="222.25473"
+     inkscape:document-units="mm"
+     inkscape:current-layer="layer1"
+     showgrid="false"
+     inkscape:window-width="1514"
+     inkscape:window-height="1376"
+     inkscape:window-x="1046"
+     inkscape:window-y="27"
+     inkscape:window-maximized="0"
+     fit-margin-top="0"
+     fit-margin-left="0"
+     fit-margin-right="0"
+     fit-margin-bottom="0" />
+  <metadata
+     id="metadata5">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about="">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
+        <dc:title></dc:title>
+      </cc:Work>
+    </rdf:RDF>
+  </metadata>
+  <g
+     inkscape:label="Layer 1"
+     inkscape:groupmode="layer"
+     id="layer1"
+     transform="translate(26.189925,5.2546503)">
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813352px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-2.2053311"
+       y="32.839729"
+       id="text844"><tspan
+         sodipodi:role="line"
+         x="-2.2053313"
+         y="32.839729"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846">Video Buffer (YUV)</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813352px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="30.867918"
+       y="87.638779"
+       id="text844-2"><tspan
+         sodipodi:role="line"
+         x="30.867918"
+         y="87.638779"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846-0">CRTC Output</tspan></text>
+    <rect
+       style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.53249496;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:1.59748484, 0.53249495;stroke-dashoffset:0"
+       id="rect969"
+       width="111.63046"
+       height="44.238331"
+       x="-25.923677"
+       y="-4.9884028" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813352px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="48.037342"
+       y="45.781586"
+       id="text844-2-9"><tspan
+         sodipodi:role="line"
+         x="48.037342"
+         y="45.781586"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan2868">Hardware Composition</tspan></text>
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.48997903;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#TriangleOutL)"
+       d="m 32.66992,40.326865 v 9.760144"
+       id="path989"
+       inkscape:connector-curvature="0" />
+    <g
+       id="g4447"
+       style="stroke:#000000">
+      <rect
+         ry="0"
+         y="0.23764905"
+         x="-23.784248"
+         height="29.48851"
+         width="48.988979"
+         id="rect836"
+         style="fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.62916809;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <rect
+         ry="0"
+         y="3.8184125"
+         x="-20.589451"
+         height="6.9794898"
+         width="11.594959"
+         id="rect836-2-6"
+         style="fill:#008000;fill-opacity:1;stroke:#000000;stroke-width:0.14891468;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <rect
+         ry="0"
+         y="3.8184123"
+         x="-5.6613555"
+         height="6.9794903"
+         width="11.594959"
+         id="rect836-2-6-1"
+         style="fill:#008000;fill-opacity:1;stroke:#000000;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <rect
+         ry="0"
+         y="3.8184121"
+         x="10.374816"
+         height="6.9794908"
+         width="11.594959"
+         id="rect836-2-6-1-8"
+         style="fill:#008000;fill-opacity:1;stroke:#000000;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <rect
+         ry="0"
+         y="18.386644"
+         x="-20.341679"
+         height="6.9794903"
+         width="11.594959"
+         id="rect836-2-6-7"
+         style="fill:#008000;fill-opacity:1;stroke:#000000;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <rect
+         ry="0"
+         y="18.386644"
+         x="-5.4135842"
+         height="6.9794908"
+         width="11.594959"
+         id="rect836-2-6-1-9"
+         style="fill:#008000;fill-opacity:1;stroke:#000000;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <rect
+         ry="0"
+         y="18.386644"
+         x="10.622585"
+         height="6.9794908"
+         width="11.594959"
+         id="rect836-2-6-1-8-2"
+         style="fill:#008000;fill-opacity:1;stroke:#000000;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+    </g>
+    <rect
+       style="fill:#808080;fill-opacity:1;stroke:#808080;stroke-width:0.62916809;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect836-2"
+       width="48.988979"
+       height="29.48851"
+       x="31.367332"
+       y="0.45039755"
+       ry="0" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:0.14891468;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect836-2-6-3"
+       width="11.594959"
+       height="6.9794898"
+       x="34.56213"
+       y="4.0311608"
+       ry="0" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect836-2-6-1-7"
+       width="11.594959"
+       height="6.9794903"
+       x="49.490223"
+       y="4.0311608"
+       ry="0" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect836-2-6-1-8-5"
+       width="11.594959"
+       height="6.9794908"
+       x="65.526398"
+       y="4.0311604"
+       ry="0" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect836-2-6-7-9"
+       width="11.594959"
+       height="6.9794903"
+       x="34.809902"
+       y="18.599392"
+       ry="0" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect836-2-6-1-9-2"
+       width="11.594959"
+       height="6.9794908"
+       x="49.737995"
+       y="18.599392"
+       ry="0" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect836-2-6-1-8-2-2"
+       width="11.594959"
+       height="6.9794908"
+       x="65.774162"
+       y="18.599392"
+       ry="0" />
+    <g
+       id="g4562"
+       transform="translate(0,11.22532)">
+      <rect
+         ry="0"
+         y="43.21352"
+         x="5.9767256"
+         height="29.48851"
+         width="48.988979"
+         id="rect836-97"
+         style="fill:#808080;fill-opacity:1;stroke:#808080;stroke-width:0.62916809;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <rect
+         ry="0"
+         y="46.794285"
+         x="9.1715231"
+         height="6.9794898"
+         width="11.594959"
+         id="rect836-2-6-36"
+         style="fill:#008000;fill-opacity:1;stroke:#000000;stroke-width:0.14891468;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <rect
+         ry="0"
+         y="46.794285"
+         x="24.099619"
+         height="6.9794903"
+         width="11.594959"
+         id="rect836-2-6-1-1"
+         style="fill:#008000;fill-opacity:1;stroke:#000000;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <rect
+         ry="0"
+         y="46.794285"
+         x="40.135792"
+         height="6.9794908"
+         width="11.594959"
+         id="rect836-2-6-1-8-29"
+         style="fill:#008000;fill-opacity:1;stroke:#000000;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <rect
+         ry="0"
+         y="61.362514"
+         x="9.4192953"
+         height="6.9794903"
+         width="11.594959"
+         id="rect836-2-6-7-3"
+         style="fill:#008000;fill-opacity:1;stroke:#000000;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <rect
+         ry="0"
+         y="61.362514"
+         x="24.347389"
+         height="6.9794908"
+         width="11.594959"
+         id="rect836-2-6-1-9-1"
+         style="fill:#008000;fill-opacity:1;stroke:#000000;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <rect
+         ry="0"
+         y="61.362514"
+         x="40.38356"
+         height="6.9794908"
+         width="11.594959"
+         id="rect836-2-6-1-8-2-9"
+         style="fill:#008000;fill-opacity:1;stroke:#000000;stroke-width:0.14891469;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813358px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="57.012939"
+       y="33.603645"
+       id="text844-4"><tspan
+         sodipodi:role="line"
+         x="57.012939"
+         y="33.603645"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846-7">Desktop Buffer (ARGB)</tspan></text>
+  </g>
+</svg>
diff --git a/Documentation/gpu/amdgpu/display/single-display-mpo.svg b/Documentation/gpu/amdgpu/display/single-display-mpo.svg
new file mode 100644
index 000000000000..fb53b0920c87
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/single-display-mpo.svg
@@ -0,0 +1,266 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   xmlns:dc="http://purl.org/dc/elements/1.1/"
+   xmlns:cc="http://creativecommons.org/ns#"
+   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:svg="http://www.w3.org/2000/svg"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   width="148.71147mm"
+   height="38.356358mm"
+   viewBox="0 0 148.71148 38.356358"
+   version="1.1"
+   id="svg8"
+   inkscape:version="0.92.5 (2060ec1f9f, 2020-04-08)"
+   sodipodi:docname="single-display-mpo.svg">
+  <defs
+     id="defs2">
+    <marker
+       inkscape:stockid="TriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="TriangleOutL"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1133"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="scale(0.8)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Send"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Send"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1006"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.2,0,0,-0.2,-1.2,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="TriangleOutL"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="TriangleOutL-6"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path1133-0"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="scale(0.8)" />
+    </marker>
+  </defs>
+  <sodipodi:namedview
+     id="base"
+     pagecolor="#ffffff"
+     bordercolor="#666666"
+     borderopacity="1.0"
+     inkscape:pageopacity="0.0"
+     inkscape:pageshadow="2"
+     inkscape:zoom="1.979899"
+     inkscape:cx="266.07058"
+     inkscape:cy="81.254796"
+     inkscape:document-units="mm"
+     inkscape:current-layer="layer1"
+     showgrid="false"
+     inkscape:window-width="1514"
+     inkscape:window-height="1376"
+     inkscape:window-x="1046"
+     inkscape:window-y="27"
+     inkscape:window-maximized="0"
+     fit-margin-top="0"
+     fit-margin-left="0"
+     fit-margin-right="0"
+     fit-margin-bottom="0" />
+  <metadata
+     id="metadata5">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about="">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
+        <dc:title></dc:title>
+      </cc:Work>
+    </rdf:RDF>
+  </metadata>
+  <g
+     inkscape:label="Layer 1"
+     inkscape:groupmode="layer"
+     id="layer1"
+     transform="translate(26.323559,-14.790568)">
+    <rect
+       style="fill:#999999;fill-opacity:1;stroke:#999999;stroke-width:0.62916809;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect836"
+       width="48.988979"
+       height="29.48851"
+       x="4.9472256"
+       y="17.075632"
+       ry="0" />
+    <g
+       id="g905"
+       transform="matrix(0.26082945,0,0,0.26082945,-26.950235,-0.99631462)">
+      <rect
+         y="67.568451"
+         x="12.473214"
+         height="60.854164"
+         width="102.43154"
+         id="rect834"
+         style="fill:#008000;fill-opacity:1;stroke:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <path
+         inkscape:transform-center-y="-3.581986e-06"
+         inkscape:transform-center-x="-3.3106064"
+         d="m 73.620805,97.995537 -9.931819,5.734143 -9.931819,5.73413 0,-11.468274 0,-11.468276 9.931819,5.734139 z"
+         inkscape:randomized="0"
+         inkscape:rounded="0"
+         inkscape:flatsided="false"
+         sodipodi:arg2="1.0471976"
+         sodipodi:arg1="0"
+         sodipodi:r2="6.6212125"
+         sodipodi:r1="13.242425"
+         sodipodi:cy="97.995537"
+         sodipodi:cx="60.37838"
+         sodipodi:sides="3"
+         id="path840"
+         style="fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.22854495;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+         sodipodi:type="star" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813352px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="-10.357052"
+       y="34.176075"
+       id="text844"><tspan
+         sodipodi:role="line"
+         id="tspan842"
+         x="-10.357052"
+         y="34.176075"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112">Video Buffer (YUV)</tspan><tspan
+         sodipodi:role="line"
+         x="-10.357052"
+         y="36.706482"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846">DRM PRIMARY PLANE</tspan></text>
+    <rect
+       style="fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:0.5216589;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect834-3"
+       width="26.717165"
+       height="15.872559"
+       x="16.083126"
+       y="23.883608" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813352px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="28.437061"
+       y="49.158085"
+       id="text844-6"><tspan
+         sodipodi:role="line"
+         x="28.437061"
+         y="49.158085"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846-5">Desktop Buffer (ARGB)</tspan><tspan
+         sodipodi:role="line"
+         x="28.437061"
+         y="51.688492"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan886">DRM OVERLAY PLANE</tspan></text>
+    <g
+       id="g2874"
+       transform="matrix(1.0858687,0,0,1.0858687,-4.5597909,-2.06277)">
+      <rect
+         ry="0"
+         y="17.624969"
+         x="71.504173"
+         height="27.156607"
+         width="45.115009"
+         id="rect836-9"
+         style="fill:#999999;fill-opacity:1;stroke:#999999;stroke-width:0.57941455;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0" />
+      <g
+         id="g905-5"
+         transform="matrix(0.24020349,0,0,0.24020349,78.763353,7.664402)">
+        <rect
+           style="fill:#008000;fill-opacity:1;stroke:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+           id="rect834-6"
+           width="102.43154"
+           height="60.854164"
+           x="12.473214"
+           y="67.568451" />
+        <path
+           sodipodi:type="star"
+           style="fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.22854495;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0"
+           id="path840-2"
+           sodipodi:sides="3"
+           sodipodi:cx="60.37838"
+           sodipodi:cy="97.995537"
+           sodipodi:r1="13.242425"
+           sodipodi:r2="6.6212125"
+           sodipodi:arg1="0"
+           sodipodi:arg2="1.0471976"
+           inkscape:flatsided="false"
+           inkscape:rounded="0"
+           inkscape:randomized="0"
+           d="m 73.620805,97.995537 -9.931819,5.734143 -9.931819,5.73413 0,-11.468274 0,-11.468276 9.931819,5.734139 z"
+           inkscape:transform-center-x="-3.3106064"
+           inkscape:transform-center-y="-3.581986e-06" />
+      </g>
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813352px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="97.551666"
+       y="50.221046"
+       id="text844-2"><tspan
+         sodipodi:role="line"
+         x="97.551666"
+         y="50.221046"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846-0">CRTC Output</tspan></text>
+    <rect
+       style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.42211887;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:1.26635657, 0.42211886;stroke-dashoffset:0"
+       id="rect969"
+       width="81.806648"
+       height="37.934238"
+       x="-26.112499"
+       y="15.001627" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:0.82813352px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.06901112"
+       x="64.474419"
+       y="31.883568"
+       id="text844-2-9"><tspan
+         sodipodi:role="line"
+         x="64.474419"
+         y="31.883568"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan846-0-3">Hardware</tspan><tspan
+         sodipodi:role="line"
+         x="64.474419"
+         y="34.413975"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:2.02432632px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.06901112"
+         id="tspan2868">Composition</tspan></text>
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.48997903;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#TriangleOutL)"
+       d="m 57.401149,24.81643 h 9.760144"
+       id="path989"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.48997903;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#TriangleOutL-6)"
+       d="m 57.401149,41.794278 h 9.760144"
+       id="path989-6"
+       inkscape:connector-curvature="0" />
+  </g>
+</svg>
-- 
2.25.1

