Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3B546EF5A
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Dec 2021 18:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C8C10E259;
	Thu,  9 Dec 2021 16:54:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1015D10E120;
 Thu,  9 Dec 2021 14:21:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMHTVwnfMVwtjzMo7GGgAEhtr6zflU9orz9VlJYr2HvZl0PFKaneJZRpG0ZcpnktAkptBSrBJnBXYX23iArm1JTTHPM8iF5IhymtJWUiUjgwMzinC6J2pNVPQTextBvATZBkIWtKN70QBA/sPBbnK7K5BwDirRxsurkAhdyMEIGFrcLNu1FzfThY4tdGthf3ZG20GESn1izNFMQopJbk+hBvf07KQzKcqCr8kb28djXtiVx1rz1D/Rzk9type+4SHFlklRRQ8eaY0M7+sHl25uf7f540VRgtDM7mijfgfzqK6kJNz9tvzq1NGLNjFaT9n/5+hpwdENnTXI+tEC5ooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7mXo/pbuMzSncxMXVuY90BL+fDdox4ZR4si2VYoGGE=;
 b=H+VPItc0j4Ey4qcNRGjAnbPTvBP9JQFQb2housYVgD39aB6HTw3d/FfAtIl8KT/gGa1HZ+sM7FgRlMbJooBcMhnOCfjsyR0QDLZODU0vcVT9ql1KIHiJB9ITl3XT0dHMbh/7SNHGTlTn2SRfYaSRv/AHoEcVRrm2s1MULimE5i7TgUI8Xhq3hWkX5SeoFsVTed9zoNvEKLrx+t3SfVsOCLttlV+L/1G8uXXjHqVVRtWUGrrWdMJOHnKhbXBklPbr+I52amOktnu+fO7EcVoG3WMp5L3V55kTzBdWkotYjxoKQOr/Gu9iKdDJyoJMzoEPyiLFbEHh7RUt+HpkS0Wn4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7mXo/pbuMzSncxMXVuY90BL+fDdox4ZR4si2VYoGGE=;
 b=XgVnN8xcZ08FFd9G9qW0GMvRPJbUbFslJrmIUiFbwYZ6bzeszy7YoYrJTTDBcDuvoymPxiB2bCEHch9bECfVeM4vDcv19p8TlJkW9z55QR296oy0g1EjMNCBv9Uz3hrCDsb9O5BnlXgMo+MC+nyjalX7uEr7t1HqDMQVTBRTFFA=
Received: from MWHPR1401CA0020.namprd14.prod.outlook.com
 (2603:10b6:301:4b::30) by BYAPR12MB3157.namprd12.prod.outlook.com
 (2603:10b6:a03:130::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 14:21:11 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4b:cafe::51) by MWHPR1401CA0020.outlook.office365.com
 (2603:10b6:301:4b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Thu, 9 Dec 2021 14:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 14:21:10 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 9 Dec
 2021 08:21:07 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v4 5/6] Documentation/gpu: Add basic overview of DC pipeline
Date: Thu, 9 Dec 2021 09:20:46 -0500
Message-ID: <20211209142047.728572-6-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
References: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9d30b75-ff8d-40fa-e96a-08d9bb1f2641
X-MS-TrafficTypeDiagnostic: BYAPR12MB3157:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB315752BF8192D9CC8DCAD98C98709@BYAPR12MB3157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:13;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B14/tD2FFLytr0lB8snO5hUPYgKgjaz2fXWqSgVQVncom3/3zcskYvmzNpwb?=
 =?us-ascii?Q?N1TBmXuLL47Zssx3zDhU3QDNiCryRzhG2yIRIcc67Qlz3E2wW74Cx/hZ+EFi?=
 =?us-ascii?Q?Luw5dM/yeiLclYY8qpXesmqMzDUyFIsL+PpiP9xS9S3UXVnEfw51QmlM5Lus?=
 =?us-ascii?Q?VQTCULDwj58gY82v034KxymydrjE33kjsHywXdbkodCFLH8DXiSbxqu0hvOt?=
 =?us-ascii?Q?FOBM1BIHfIQdT4WAGOqq39ijB0sWBASt+I4bf+2OVC1yxj8uO+0rDoNARW48?=
 =?us-ascii?Q?a1zo+kKFJh46CT1zUy8WKErGxgvhclf6XRuqZImXnlK/WJPFE8qlp3/Fk7PG?=
 =?us-ascii?Q?q+WRKgDO9FI45d0wdFSXpGLUGDshetL9XnDXDqqRU9QvRGW3lbX5tCx6uyHb?=
 =?us-ascii?Q?BBGNUZ2QqzP9lGHkMbu1WEgj/a2J7XZz2UdAwnoSkZHw+1kkGB+ubEkLmm67?=
 =?us-ascii?Q?C5EmBLbPLd6lEUKvrSUKA3f/GbnQbu7r4YR+U/+ddPQUEt1QR4a8QU0bApKo?=
 =?us-ascii?Q?ZSKLMSS2YZXTeSOHVd0QeAk/W9JRhfO1dIm5rsuJofwwjULm9hGSTUn9bSKK?=
 =?us-ascii?Q?+IEIHG7LwtWUD7B7+z6+Vve7Wa5wVvl8zKbLg7VQ1Yot4hbedH3sSuD29vtG?=
 =?us-ascii?Q?g3mmcS/64cVmlrUbt6+rVSgEQvTxCPHdkMtxNgStCFLXFGOOvXLjPj1Cz1Jj?=
 =?us-ascii?Q?Gpy72Y6V8Z3HLXkjsDEDG0GhWGPnOLBp+sfQzGzr/20HiPIIR/PuPZS48WHt?=
 =?us-ascii?Q?noot3J8aZO/ccNXTWbeVq1ni64Tx8gzeqcgErtDmkwfZieeslrkaNCrqs22v?=
 =?us-ascii?Q?8cF1QM37Zz8o5i8bZplGpEnPM7SJfVxvH0lWdcB2X6faMPFbEAjc4m2W7CMs?=
 =?us-ascii?Q?Cfr3pJYHBtFAZbfy6TuOkNuHMywdC//haN0X0gqEg9bF4dn7CVwKaJp9zR8G?=
 =?us-ascii?Q?F+3CfRb2lw3BBjpHYW4rwA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(83380400001)(19273905006)(316002)(5660300002)(4326008)(47076005)(921005)(1076003)(54906003)(2906002)(30864003)(36860700001)(8676002)(26005)(36756003)(110136005)(508600001)(81166007)(336012)(8936002)(70586007)(86362001)(70206006)(356005)(186003)(16526019)(2616005)(426003)(82310400004)(7416002)(40460700001)(6666004)(36900700001)(559001)(579004)(563064011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 14:21:10.8307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d30b75-ff8d-40fa-e96a-08d9bb1f2641
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3157
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
Cc: linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bhawanpreet.lakha@amd.com, Christian Koenig <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This commit describes how DCN works by providing high-level diagrams
with an explanation of each component. In particular, it details the
Global Sync signals.

Change since V2:
 - Add a comment about MMHUBBUB.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/amdgpu/display/config_example.svg     |  414 ++++++
 .../amdgpu/display/dc_pipeline_overview.svg   | 1125 +++++++++++++++++
 .../gpu/amdgpu/display/dcn-overview.rst       |  171 +++
 .../gpu/amdgpu/display/global_sync_vblank.svg |  485 +++++++
 Documentation/gpu/amdgpu/display/index.rst    |   23 +-
 5 files changed, 2206 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/display/config_example.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dc_pipeline_overview.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dcn-overview.rst
 create mode 100644 Documentation/gpu/amdgpu/display/global_sync_vblank.svg

diff --git a/Documentation/gpu/amdgpu/display/config_example.svg b/Documentation/gpu/amdgpu/display/config_example.svg
new file mode 100644
index 000000000000..cdac9858601c
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/config_example.svg
@@ -0,0 +1,414 @@
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
+   width="144.63406mm"
+   height="66.596054mm"
+   viewBox="0 0 144.15195 66.596054"
+   version="1.1"
+   id="svg8"
+   inkscape:version="0.92.5 (2060ec1f9f, 2020-04-08)"
+   sodipodi:docname="config_example.svg">
+  <defs
+     id="defs2">
+    <marker
+       inkscape:stockid="Arrow1Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Mend"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path4547"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.4,0,0,-0.4,-4,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Mend-3"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4547-6"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.4,0,0,-0.4,-4,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Mend-3-5"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4547-6-3"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.4,0,0,-0.4,-4,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Mend-3-5-0"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4547-6-3-6"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.4,0,0,-0.4,-4,0)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Mend-3-5-7"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path4547-6-3-3"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.4,0,0,-0.4,-4,0)" />
+    </marker>
+  </defs>
+  <sodipodi:namedview
+     id="base"
+     pagecolor="#ffffff"
+     bordercolor="#666666"
+     borderopacity="1.0"
+     inkscape:pageopacity="0.0"
+     inkscape:pageshadow="2"
+     inkscape:zoom="0.98994949"
+     inkscape:cx="518.91791"
+     inkscape:cy="172.50112"
+     inkscape:document-units="mm"
+     inkscape:current-layer="layer1"
+     showgrid="true"
+     viewbox-width="209.3"
+     inkscape:window-width="3840"
+     inkscape:window-height="1136"
+     inkscape:window-x="0"
+     inkscape:window-y="27"
+     inkscape:window-maximized="1"
+     fit-margin-top="0"
+     fit-margin-left="0"
+     fit-margin-right="0"
+     fit-margin-bottom="0">
+    <inkscape:grid
+       type="xygrid"
+       id="grid817"
+       originx="4.390216"
+       originy="-208.88856" />
+  </sodipodi:namedview>
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
+     transform="translate(4.4048992,-21.515392)">
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.26458335px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       d="m 20.816662,35.062492 h 23.8125 v -5.291667 h 5.291667 v 5.291667 h 10.583334 v -5.291667 h 5.291667 v 5.291667 h 2.645833 v -5.291667 h 5.291667 v 5.291667 h 66.14583"
+       id="path4522"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.26458335px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       d="m 20.816662,48.291659 h 7.9375 v -5.291667 h 5.291667 v 5.291667 h 58.208335 v -5.291667 h 5.291666 v 5.291667 h 42.33333"
+       id="path4524"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.26458335px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       d="m 20.816662,61.520826 h 26.458334 v -5.291667 h 44.979168 v 5.291667 h 47.624996"
+       id="path4526"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.26458335px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       d="M 20.816662,72.104159 H 139.87916"
+       id="path4528"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.26458335px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       d="M 20.816662,77.395826 H 139.87916"
+       id="path4530"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.26458335px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       d="M 20.816662,82.687493 H 139.87916"
+       id="path4532"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.26458335px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       d="M 20.816662,87.97916 H 139.87916"
+       id="path4534"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.52916668, 0.52916668;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow1Mend)"
+       d="m 47.274996,29.770826 c 3.836215,14.933158 3.472151,27.586643 0.264583,41.010418"
+       id="path4536"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.52916669, 0.52916669;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow1Mend-3)"
+       d="m 63.149996,29.770826 c 3.836214,14.933158 5.059652,27.586642 1.852084,41.010418"
+       id="path4536-7"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.5291667, 0.5291667;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow1Mend-3-5)"
+       d="m 71.087496,29.770825 c 3.836214,14.933158 5.059652,27.586643 1.852084,41.010419"
+       id="path4536-7-5"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.58333397px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="59.359009"
+       y="24.195677"
+       id="text6572"><tspan
+         sodipodi:role="line"
+         x="59.359009"
+         y="24.195677"
+         style="font-size:3.52777791px;line-height:5.39999962;text-align:center;text-anchor:middle;stroke-width:0.26458335"
+         id="tspan6574">Configurations</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.58333397px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="46.825508"
+       y="28.542402"
+       id="text6572-6"><tspan
+         sodipodi:role="line"
+         x="46.825508"
+         y="28.542402"
+         style="font-size:3.52777815px;line-height:5.39999962;text-align:center;text-anchor:middle;fill:#008000;stroke-width:0.26458335"
+         id="tspan6574-2">A</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.58333397px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="62.8895"
+       y="28.825886"
+       id="text6572-6-2"><tspan
+         sodipodi:role="line"
+         x="62.8895"
+         y="28.825886"
+         style="font-size:3.52777839px;line-height:5.39999962;text-align:center;text-anchor:middle;fill:#0000ff;stroke-width:0.26458335"
+         id="tspan6574-2-7">B</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.58333397px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="70.827003"
+       y="29.109362"
+       id="text6572-6-2-3"><tspan
+         sodipodi:role="line"
+         x="70.827003"
+         y="29.109362"
+         style="font-size:3.52777863px;line-height:5.39999962;text-align:center;text-anchor:middle;fill:#c87137;stroke-width:0.26458335"
+         id="tspan6574-2-7-6">C</tspan></text>
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.52916671, 0.52916671;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow1Mend-3-5-0)"
+       d="m 92.254164,42.999993 c 9.142136,12.745655 4.411987,28.608461 0.529167,38.364584"
+       id="path4536-7-5-2"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 47.274996,72.104159 v 5.291667"
+       id="path8053"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 64.472913,72.10416 v 5.291667"
+       id="path8053-6"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 72.410413,72.10416 v 5.291667"
+       id="path8053-6-1"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 92.254164,82.687494 v 5.291667"
+       id="path8053-6-1-8"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.58333397px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="55.802444"
+       y="76.167412"
+       id="text6572-6-7"><tspan
+         sodipodi:role="line"
+         x="55.802444"
+         y="76.167412"
+         style="font-size:3.52777839px;line-height:5.39999962;text-align:center;text-anchor:middle;fill:#008000;stroke-width:0.26458335"
+         id="tspan6574-2-9">A</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.58333397px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="68.559143"
+       y="75.883926"
+       id="text6572-6-2-2"><tspan
+         sodipodi:role="line"
+         x="68.559143"
+         y="75.883926"
+         style="font-size:3.52777863px;line-height:5.39999962;text-align:center;text-anchor:middle;fill:#0000ff;stroke-width:0.26458335"
+         id="tspan6574-2-7-0">B</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.58333397px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="84.812119"
+       y="75.883911"
+       id="text6572-6-2-3-2"><tspan
+         sodipodi:role="line"
+         x="84.812119"
+         y="75.883911"
+         style="font-size:3.52777863px;line-height:5.39999962;text-align:center;text-anchor:middle;fill:#c87137;stroke-width:0.26458335"
+         id="tspan6574-2-7-6-3">C</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.58333397px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="98.513756"
+       y="86.845222"
+       id="text6572-6-2-3-2-7"><tspan
+         sodipodi:role="line"
+         x="98.513756"
+         y="86.845222"
+         style="font-size:3.52777863px;line-height:5.39999962;text-align:center;text-anchor:middle;fill:#c87137;stroke-width:0.26458335"
+         id="tspan6574-2-7-6-3-5">C</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.58333397px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="35.452015"
+       y="75.694931"
+       id="text6572-9"><tspan
+         sodipodi:role="line"
+         x="35.452015"
+         y="75.694931"
+         style="font-size:3.52777815px;line-height:5.39999962;text-align:center;text-anchor:middle;stroke-width:0.26458335"
+         id="tspan6574-22">Old config</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.58333397px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="55.484753"
+       y="86.656235"
+       id="text6572-9-8"><tspan
+         sodipodi:role="line"
+         x="55.484753"
+         y="86.656235"
+         style="font-size:3.52777839px;line-height:5.39999962;text-align:center;text-anchor:middle;stroke-width:0.26458335"
+         id="tspan6574-22-9">Old config</tspan></text>
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.52916671, 0.52916671;stroke-dashoffset:0;stroke-opacity:1;marker-end:url(#Arrow1Mend-3-5-7)"
+       d="m 92.254164,42.999993 c 4.233333,4.7625 2.645833,13.229167 0.79375,17.197917"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.58333397px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="3.7020128"
+       y="33.550579"
+       id="text6572-1"><tspan
+         sodipodi:role="line"
+         x="3.7020128"
+         y="42.914349"
+         style="font-size:3.52777815px;line-height:5.39999962;text-align:center;text-anchor:middle;stroke-width:0.26458335"
+         id="tspan15310" /></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17500019px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="13.366468"
+       y="46.590767"
+       id="text15316"><tspan
+         sodipodi:role="line"
+         x="13.366468"
+         y="46.590767"
+         style="text-align:center;text-anchor:middle;stroke-width:0.26458335"
+         id="tspan15318">VUpdate</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17500043px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="14.45245"
+       y="29.676321"
+       id="text15316-3"><tspan
+         sodipodi:role="line"
+         id="tspan15314-1"
+         x="14.45245"
+         y="29.676321"
+         style="text-align:center;text-anchor:middle;stroke-width:0.26458335">Update</tspan><tspan
+         sodipodi:role="line"
+         x="14.45245"
+         y="33.645073"
+         style="text-align:center;text-anchor:middle;stroke-width:0.26458335"
+         id="tspan15318-9">Lock</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17500043px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="7.5676007"
+       y="56.985115"
+       id="text15316-4"><tspan
+         sodipodi:role="line"
+         x="7.5676007"
+         y="56.985115"
+         style="text-align:center;text-anchor:middle;stroke-width:0.26458335"
+         id="tspan15318-7">Register update</tspan><tspan
+         sodipodi:role="line"
+         x="7.5676007"
+         y="60.953865"
+         style="text-align:center;text-anchor:middle;stroke-width:0.26458335"
+         id="tspan15361">Pending Status</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17500043px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="16.074829"
+       y="76.167404"
+       id="text15316-8"><tspan
+         sodipodi:role="line"
+         x="16.074829"
+         y="76.167404"
+         style="text-align:center;text-anchor:middle;stroke-width:0.26458335"
+         id="tspan15318-4">Buf 0</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17500067px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458335"
+       x="16.156994"
+       y="86.089279"
+       id="text15316-8-5"><tspan
+         sodipodi:role="line"
+         x="16.156994"
+         y="86.089279"
+         style="text-align:center;text-anchor:middle;stroke-width:0.26458335"
+         id="tspan15318-4-0">Buf 1</tspan></text>
+  </g>
+</svg>
diff --git a/Documentation/gpu/amdgpu/display/dc_pipeline_overview.svg b/Documentation/gpu/amdgpu/display/dc_pipeline_overview.svg
new file mode 100644
index 000000000000..9adecebfe65b
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/dc_pipeline_overview.svg
@@ -0,0 +1,1125 @@
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
+   width="1296.7491"
+   height="741.97845"
+   viewBox="0 0 343.0982 196.31514"
+   version="1.1"
+   id="svg8"
+   inkscape:version="0.92.5 (2060ec1f9f, 2020-04-08)"
+   sodipodi:docname="dc_pipeline_overview.svg">
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
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:1.00000003pt;stroke-opacity:1"
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
+     inkscape:zoom="2.8"
+     inkscape:cx="603.80172"
+     inkscape:cy="404.14319"
+     inkscape:document-units="mm"
+     inkscape:current-layer="layer1"
+     showgrid="false"
+     inkscape:window-width="3840"
+     inkscape:window-height="2096"
+     inkscape:window-x="0"
+     inkscape:window-y="27"
+     inkscape:window-maximized="1"
+     showguides="false"
+     fit-margin-top="0"
+     fit-margin-left="0"
+     fit-margin-right="0"
+     fit-margin-bottom="0"
+     units="px"
+     inkscape:snap-global="false" />
+  <metadata
+     id="metadata5">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about="">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
+        <dc:title />
+      </cc:Work>
+    </rdf:RDF>
+  </metadata>
+  <g
+     inkscape:label="Layer 1"
+     inkscape:groupmode="layer"
+     id="layer1"
+     transform="translate(419.79645,20.103767)">
+    <path
+       style="fill:#008000;stroke:#008000;stroke-width:0.59275198;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-8-3-2-7)"
+       d="m -340.37552,57.5332 h -14.81024"
+       id="path1171-7-1-3-0"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:#008000;stroke:#008000;stroke-width:0.59715915;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-8-3-4)"
+       d="m -293.23443,57.5332 h -15.03129"
+       id="path1171-7-1-32"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:#008000;stroke:#008000;stroke-width:0.59275198;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-8-0)"
+       d="M -246.45946,57.5332 H -261.2697"
+       id="path1171-7-6"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:#008000;stroke:#008000;stroke-width:0.59275198;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-6)"
+       d="m -151.28623,57.5332 h -14.81024"
+       id="path1171-0"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.98222464;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-8-3-2-6)"
+       d="m -310.11621,-10.988713 h -35.41856"
+       id="path1171-7-1-3-5"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cc" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:1.33745635;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-8-3-2-1)"
+       d="M -174.42569,48.441117 V -10.963061 L -277.26548,-11.45916"
+       id="path1171-7-1-3-4"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="ccc" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.95872593;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-8-3)"
+       d="m -262.79442,87.935594 h 14.32069"
+       id="path1171-7-1"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.97006679;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-8)"
+       d="m -309.80088,87.935594 h 14.44587"
+       id="path1171-7"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.96187615;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend)"
+       d="m -356.45657,87.935594 h 14.20296"
+       id="path1171"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.96061862;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-8-3-2)"
+       d="m -167.44556,87.935594 h 14.16584"
+       id="path1171-7-1-3"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#008000;stroke-width:0.87091714;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-8-0-7)"
+       d="M -193.82812,48.312503 V 14.168502 l -84.03577,-0.467726"
+       id="path1171-7-6-4"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="ccc" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:4.91112339, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -133.33998,42.989657 v 5.457081"
+       id="path7149-3-7"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:4.91112339, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -298.69506,162.44998 v 13.31197"
+       id="path7149"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#008080;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.81852057, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -242.80131,107.00907 v 9.60171"
+       id="path7040-5-4-7-5-6-9"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#008080;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.81852057, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -300.34873,107.17445 v 9.6017"
+       id="path7040-5-4-7-5-6"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#008080;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.81852057, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -359.26293,106.99745 v 9.60171"
+       id="path7040-5-4-7-5"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#008080;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.81852057, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="M -369.74543,25.114933 V 37.991587"
+       id="path7040-5-4-7-6"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#008080;stroke-width:0.91136348;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.91136346, 0.91136346;stroke-dashoffset:0;stroke-opacity:1"
+       d="M -135.17034,93.582486 V 107.10642 H -403.93077 V 37.882965 h 109.60575 V 25.225991"
+       id="path7038"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cccccc" />
+    <path
+       style="fill:none;stroke:#008080;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.81852057, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="M -231.106,94.010086 V 106.96943"
+       id="path7040"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#008080;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.81852057, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="M -278.50224,93.844719 V 106.80406"
+       id="path7040-5"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#008080;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.81852057, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="M -325.89848,93.701083 V 106.99115"
+       id="path7040-5-4"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#008080;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.81852057, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="M -373.29471,93.899037 V 107.27179"
+       id="path7040-5-4-7"
+       inkscape:connector-curvature="0" />
+    <g
+       id="g934"
+       transform="matrix(0.61872421,0,0,0.61872421,-154.16506,-3.5724799)">
+      <rect
+         ry="2.1052283e-06"
+         y="84.280701"
+         x="-376.383"
+         height="72.786827"
+         width="49.352299"
+         id="rect834"
+         style="fill:none;stroke:#000000;stroke-width:1.16258347;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+      <text
+         id="text838"
+         y="95.916664"
+         x="-371.17261"
+         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           style="stroke-width:0.26458332"
+           y="95.916664"
+           x="-371.17261"
+           id="tspan836"
+           sodipodi:role="line">DCHUB</tspan></text>
+      <text
+         id="text846"
+         y="121.99702"
+         x="-352.74997"
+         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="121.99702"
+           x="-352.74997"
+           id="tspan844"
+           sodipodi:role="line">HUBP</tspan><tspan
+           id="tspan863"
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="135.22618"
+           x="-352.74997"
+           sodipodi:role="line">(n)</tspan></text>
+    </g>
+    <g
+       id="g942"
+       transform="matrix(0.61872421,0,0,0.61872421,-158.40385,-3.2216813)">
+      <text
+         id="text838-5"
+         y="116.65257"
+         x="-269.45752"
+         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="116.65257"
+           x="-269.45752"
+           id="tspan836-3"
+           sodipodi:role="line">DPP</tspan><tspan
+           id="tspan936"
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="129.88174"
+           x="-269.45752"
+           sodipodi:role="line">(n)</tspan></text>
+      <rect
+         ry="2.1052283e-06"
+         y="83.71373"
+         x="-293.7952"
+         height="72.786827"
+         width="49.352303"
+         id="rect834-5"
+         style="fill:none;stroke:#000000;stroke-width:1.16258347;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <g
+       id="g1158"
+       transform="matrix(0.61872421,0,0,0.61872421,-154.34048,-6.2618995)">
+      <text
+         id="text838-5-2"
+         y="128.87331"
+         x="-200.18195"
+         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           id="tspan936-1"
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="128.87331"
+           x="-200.18195"
+           sodipodi:role="line">MPC</tspan></text>
+      <rect
+         ry="2.1052283e-06"
+         y="88.627419"
+         x="-224.62555"
+         height="72.786827"
+         width="49.352303"
+         id="rect834-5-2"
+         style="fill:none;stroke:#000000;stroke-width:1.16258347;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <g
+       id="g1153"
+       transform="matrix(0.61872421,0,0,0.61872421,-108.51628,-6.4957668)">
+      <text
+         id="text838-5-2-7"
+         y="129.2513"
+         x="-120.96272"
+         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           id="tspan936-1-0"
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="129.2513"
+           x="-120.96272"
+           sodipodi:role="line">OPTC</tspan></text>
+      <rect
+         ry="2.1052283e-06"
+         y="89.005402"
+         x="-145.62854"
+         height="72.786827"
+         width="49.352306"
+         id="rect834-5-2-9"
+         style="fill:none;stroke:#000000;stroke-width:1.16258347;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <g
+       id="g1148"
+       transform="matrix(0.61872421,0,0,0.61872421,-105.25474,-7.6650796)">
+      <text
+         id="text838-5-2-7-3"
+         y="131.14117"
+         x="-48.981136"
+         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           id="tspan936-1-0-6"
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="131.14117"
+           x="-48.981136"
+           sodipodi:role="line">DIO</tspan></text>
+      <rect
+         ry="2.1052283e-06"
+         y="90.895279"
+         x="-73.435081"
+         height="72.786827"
+         width="49.352306"
+         id="rect834-5-2-9-0"
+         style="fill:none;stroke:#000000;stroke-width:1.16258347;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <g
+       id="g1133"
+       transform="matrix(0.61872421,0,0,0.61872421,-181.52704,-7.6650796)">
+      <text
+         id="text838-5-2-6"
+         y="241.13223"
+         x="-286.96921"
+         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           id="tspan936-1-2"
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="241.13223"
+           x="-286.96921"
+           sodipodi:role="line">DCCG</tspan></text>
+      <rect
+         ry="2.1052283e-06"
+         y="200.88634"
+         x="-311.56009"
+         height="72.786827"
+         width="49.352306"
+         id="rect834-5-2-6"
+         style="fill:none;stroke:#000000;stroke-width:1.16258347;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <g
+       id="g1138"
+       transform="matrix(0.61872421,0,0,0.61872421,-181.52704,-7.6650796)">
+      <text
+         id="text838-5-2-6-1"
+         y="241.81844"
+         x="-190.55942"
+         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           id="tspan936-1-2-8"
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="241.81844"
+           x="-190.55942"
+           sodipodi:role="line">DMU</tspan></text>
+      <rect
+         ry="2.1052283e-06"
+         y="201.6423"
+         x="-215.17615"
+         height="72.786827"
+         width="49.352306"
+         id="rect834-5-2-6-7"
+         style="fill:none;stroke:#000000;stroke-width:1.16258347;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:6.54816437px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.1637041"
+       x="-297.75696"
+       y="109.44505"
+       id="text1063"><tspan
+         sodipodi:role="line"
+         id="tspan1061"
+         x="-297.75696"
+         y="115.23865"
+         style="stroke-width:0.1637041" /></text>
+    <g
+       id="g1143"
+       transform="matrix(0.61872421,0,0,0.61872421,-181.52704,-8.9747125)">
+      <text
+         id="text838-5-2-6-1-9"
+         y="243.02728"
+         x="-99.967323"
+         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           id="tspan936-1-2-8-2"
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="243.02728"
+           x="-99.967323"
+           sodipodi:role="line">AZ</tspan></text>
+      <rect
+         ry="2.1052283e-06"
+         y="202.77623"
+         x="-124.83984"
+         height="72.786827"
+         width="49.352306"
+         id="rect834-5-2-6-7-0"
+         style="fill:none;stroke:#000000;stroke-width:1.16258347;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <g
+       id="g1169"
+       transform="matrix(0.61872421,0,0,0.61872421,-154.16506,1.4555785)">
+      <text
+         id="text838-5-2-6-2"
+         y="5.9612885"
+         x="-348.74365"
+         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           id="tspan936-1-2-3"
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="5.9612885"
+           x="-348.74365"
+           sodipodi:role="line">MMHUBBUB</tspan></text>
+      <rect
+         ry="2.1010696e-06"
+         y="-34.142948"
+         x="-384.64743"
+         height="72.643044"
+         width="72.096924"
+         id="rect834-5-2-6-75"
+         style="fill:none;stroke:#000000;stroke-width:1.40378118;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <g
+       id="g1164"
+       transform="matrix(0.61872421,0,0,0.61872421,-154.16506,-7.6650796)">
+      <text
+         id="text838-5-2-6-9"
+         y="13.465075"
+         x="-227.30836"
+         style="font-style:normal;font-weight:normal;font-size:10.58333302px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+         xml:space="preserve"><tspan
+           id="tspan936-1-2-2"
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="13.465075"
+           x="-227.30836"
+           sodipodi:role="line">DWB</tspan><tspan
+           id="tspan1128"
+           style="text-align:center;text-anchor:middle;stroke-width:0.26458332"
+           y="26.694241"
+           x="-227.30836"
+           sodipodi:role="line">(n)</tspan></text>
+      <rect
+         ry="2.1052283e-06"
+         y="-19.473768"
+         x="-251.83983"
+         height="72.786827"
+         width="49.352306"
+         id="rect834-5-2-6-2"
+         style="fill:none;stroke:#000000;stroke-width:1.16258347;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.91371936;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:5.48231601, 0.91371934;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -358.95963,161.63019 v 14.12431 h 250.20395 V 43.149938 H -361.845 V 25.478973"
+       id="path7147"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="cccccc" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:4.91112339, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -242.92533,161.58513 v 14.05612"
+       id="path7149-3"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:4.91112339, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -184.37695,42.955607 v 5.457082"
+       id="path7149-3-7-4"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:4.91112339, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -277.36283,43.141644 v 5.457082"
+       id="path7149-3-7-5"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:4.91112339, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="M -325.48437,42.976278 V 48.43336"
+       id="path7149-3-7-2"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:4.91112339, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -361.86492,43.141644 v 5.457083"
+       id="path7149-3-7-54"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:#008000;stroke:#008000;stroke-width:0.46329758;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-6-3)"
+       d="m -147.58542,-8.2978166 h -9.04766"
+       id="path1171-0-7"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.98222464;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-8-3-2-8)"
+       d="m -157.13421,-1.6500501 h 8.66407"
+       id="path1171-7-1-3-8"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.74503672;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:4.47022031, 0.74503672;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -148.50314,4.9845652 h -7.91265"
+       id="path7149-3-7-8"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#008080;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.81852057, 0.81852057;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -157.59442,11.623513 h 10.26991"
+       id="path7040-4"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:6.54816437px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.1637041"
+       x="-142.72867"
+       y="-6.9685979"
+       id="text12079"><tspan
+         sodipodi:role="line"
+         id="tspan12077"
+         x="-142.72867"
+         y="-6.9685979"
+         style="font-size:4.80198765px;stroke-width:0.1637041">Global sync</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:6.54816437px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.1637041"
+       x="-142.93031"
+       y="0.13578746"
+       id="text12079-3"><tspan
+         sodipodi:role="line"
+         id="tspan12077-1"
+         x="-142.93031"
+         y="0.13578746"
+         style="font-size:4.80198765px;stroke-width:0.1637041">Pixel data</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:6.54816437px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.1637041"
+       x="-142.77556"
+       y="6.3093324"
+       id="text12079-3-4"><tspan
+         sodipodi:role="line"
+         id="tspan12077-1-9"
+         x="-142.77556"
+         y="6.3093324"
+         style="font-size:4.80198765px;stroke-width:0.1637041">Sideband signal</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:6.54816437px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.1637041"
+       x="-142.72867"
+       y="12.948278"
+       id="text12079-3-4-2"><tspan
+         sodipodi:role="line"
+         id="tspan12077-1-9-0"
+         x="-142.72867"
+         y="12.948278"
+         style="font-size:4.80198765px;stroke-width:0.1637041">Config. Bus</tspan></text>
+    <path
+       style="fill:none;stroke:#aa00d4;stroke-width:1.32291663;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker8858)"
+       d="m -406.68795,73.185276 h 14.20296"
+       id="path1171-75"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-420.21503"
+       y="75.065918"
+       id="text8862"><tspan
+         sodipodi:role="line"
+         id="tspan8860"
+         x="-420.21503"
+         y="75.065918"
+         style="font-size:6.3499999px;stroke-width:0.26458332">SDP</tspan></text>
+    <path
+       style="fill:none;stroke:#00ffcc;stroke-width:1.25980031;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker8858-3)"
+       d="m -119.19923,72.243805 h 12.88004"
+       id="path1171-75-6"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-104.87327"
+       y="74.54258"
+       id="text8862-2"><tspan
+         sodipodi:role="line"
+         id="tspan8860-9"
+         x="-104.87327"
+         y="74.54258"
+         style="font-size:6.3499999px;stroke-width:0.26458332">Monitor</tspan></text>
+    <g
+       id="g6280"
+       transform="translate(-133.43389,-37.35791)">
+      <text
+         id="text838-5-2-7-6"
+         y="110.67171"
+         x="-97.4758"
+         style="font-style:normal;font-weight:normal;font-size:6.54816437px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.16370411"
+         xml:space="preserve"><tspan
+           id="tspan936-1-0-7"
+           style="text-align:center;text-anchor:middle;stroke-width:0.16370411"
+           y="110.67171"
+           x="-97.4758"
+           sodipodi:role="line">OPP</tspan></text>
+      <rect
+         ry="1.3025557e-06"
+         y="85.770599"
+         x="-112.73714"
+         height="45.034973"
+         width="30.535467"
+         id="rect834-5-2-9-5"
+         style="fill:none;stroke:#000000;stroke-width:0.71931857;stroke-linecap:round;stroke-linejoin:bevel;stroke-miterlimit:4;stroke-dasharray:none" />
+    </g>
+    <path
+       style="fill:#008000;stroke:#008000;stroke-width:0.59275198;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-8-0-2)"
+       d="m -199.6735,57.600919 h -14.81024"
+       id="path1171-7-6-1"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.95872593;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Arrow2Mend-8-3-3)"
+       d="m -214.95012,88.003315 h 14.32069"
+       id="path1171-7-1-2"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#008080;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.81852058, 0.81852058;stroke-dashoffset:0;stroke-opacity:1"
+       d="M -182.99565,94.057598 V 107.01694"
+       id="path7040-7"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.81852055;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:4.91112344, 0.81852058;stroke-dashoffset:0;stroke-opacity:1"
+       d="m -231.7616,43.563759 v 5.457082"
+       id="path7149-3-7-4-0"
+       inkscape:connector-curvature="0" />
+    <g
+       aria-label="["
+       transform="matrix(0,-1,0.74237844,0,14.567595,39.540924)"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       id="text6872">
+      <path
+         d="m -65.936923,-548.78511 h 8.816294 v 2.79112 h -6.82247 v 176.34952 h 6.82247 v 2.41314 h -8.816294 z"
+         style="font-size:50.79999924px;stroke-width:0.26458332"
+         id="path6874"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="ccccccccc" />
+    </g>
+    <g
+       aria-label="["
+       transform="rotate(-90,182.49521,-144.01791)"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       id="text6872-3">
+      <path
+         d="m -63.825546,-623.34091 h 7.228794 v 2.26195 h -5.764137 l 0,127.08032 h 5.764137 v 1.88397 h -7.228794 z"
+         style="font-size:50.79999924px;stroke-width:0.26458332"
+         id="path6874-6"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="ccccccccc" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-359.80389"
+       y="99.104233"
+       id="text6929"><tspan
+         sodipodi:role="line"
+         id="tspan6927"
+         x="-359.80389"
+         y="99.104233"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:5.64444447px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';stroke-width:0.26458332">dc_plane</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-223.56163"
+       y="99.142021"
+       id="text6933"><tspan
+         sodipodi:role="line"
+         id="tspan6931"
+         x="-223.56163"
+         y="99.142021"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:5.64444447px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';stroke-width:0.26458332">dc_stream</tspan></text>
+    <g
+       aria-label="["
+       transform="matrix(0,1,1,0,153.30551,96.566025)"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       id="text6872-35">
+      <path
+         d="m -65.936923,-545.95029 h 8.816294 v 2.79112 h -6.898066 v 271.78851 h 6.898066 v 2.41314 h -8.816294 z"
+         style="font-size:50.79999924px;stroke-width:0.26458332"
+         id="path6874-62"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="ccccccccc" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-267.43958"
+       y="28.5028"
+       id="text6933-9"><tspan
+         sodipodi:role="line"
+         id="tspan6931-1"
+         x="-267.43958"
+         y="28.5028"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:5.64444447px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';stroke-width:0.26458332">dc_state</tspan></text>
+    <g
+       aria-label="["
+       transform="matrix(0,0.98158883,-1.0187565,0,0,-7.4835468)"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:6.62759447px;line-height:1.25;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.5522995"
+       id="text6973">
+      <path
+         d="m 23.679381,144.30265 h 3.028123 v 1.29445 h -1.820839 v 7.91629 h 1.820839 v 1.29445 h -3.028123 z"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:11.78239059px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';stroke-width:0.5522995"
+         id="path6975"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="ccccccccc" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-142.71655"
+       y="18.955769"
+       id="text6980"><tspan
+         sodipodi:role="line"
+         id="tspan6978"
+         x="-142.71655"
+         y="18.955769"
+         style="font-size:4.58611107px;stroke-width:0.26458332">Code struct</tspan></text>
+    <g
+       aria-label="["
+       transform="rotate(-90,94.826273,-58.762727)"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       id="text6872-35-2">
+      <path
+         d="m -66.881863,-308.95922 h 7.115401 l 0,1.69499 h -5.197173 v 42.03568 h 5.197173 v 1.78948 h -7.115401 z"
+         style="font-size:50.79999924px;stroke-width:0.26458332"
+         id="path6874-62-7"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="ccccccccc" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-134.09625"
+       y="99.354439"
+       id="text6933-9-0"><tspan
+         sodipodi:role="line"
+         id="tspan6931-1-9"
+         x="-134.09625"
+         y="99.354439"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:5.64444447px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';stroke-width:0.26458332">dc_link</tspan></text>
+    <g
+       aria-label="}"
+       transform="rotate(90,-145.27371,-140.09832)"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#3771c8;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       id="text1003">
+      <path
+         d="m 102.58571,58.211269 h 0.86816 c 1.15755,0 3.11267,-0.177767 3.45994,-0.5333 0.35553,-0.355534 1.28925,-1.124479 1.28925,-2.306836 V -61.475482 c 0,-1.289844 0.18603,-2.228288 0.5581,-2.815332 0.37207,-0.587044 0.26105,-0.992187 1.17882,-1.215429 -0.91777,-0.206706 -0.80675,-0.603581 -1.17882,-1.190625 -0.37207,-0.587045 -0.5581,-1.529623 -0.5581,-2.827735 v -3.075781 c 0,-1.174088 -0.93372,-1.938899 -1.28925,-2.294433 -0.34727,-0.363802 -2.30239,-0.545703 -3.45994,-0.545703 h -0.86816 v -1.773536 h 0.78134 c 2.05879,0 4.63403,0.305924 5.32029,0.917774 0.69453,0.60358 1.0418,1.81901 1.0418,3.646289 v 2.976562 c 0,1.231966 0.22324,2.087728 0.66973,2.567285 0.44648,0.471289 5.80035,0.706934 6.97444,0.706934 h 0.76894 v 1.773535 h -0.76894 c -1.17409,0 -6.52796,0.239778 -6.97444,0.719336 -0.44649,0.479557 -0.66973,1.343587 -0.66973,2.59209 V 55.420742 c 0,1.827279 -0.34727,3.046842 -1.0418,3.658691 -0.68626,0.611849 -3.2615,0.917774 -5.32029,0.917774 h -0.78134 z"
+         style="font-size:25.39999962px;fill:#3771c8;stroke-width:0.26458332"
+         id="path1005"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="cscsscccsscsccscsscsccscsscscc" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-200.59984"
+       y="129.60852"
+       id="text1010"><tspan
+         sodipodi:role="line"
+         id="tspan1008"
+         x="-200.59984"
+         y="129.60852"
+         style="font-style:italic;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:6.3499999px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold Italic';text-align:center;text-anchor:middle;stroke-width:0.26458332">Floating point</tspan><tspan
+         sodipodi:role="line"
+         x="-200.59984"
+         y="137.54602"
+         style="font-size:6.3499999px;text-align:center;text-anchor:middle;stroke-width:0.26458332"
+         id="tspan1059">calculation</tspan></text>
+    <g
+       aria-label="}"
+       transform="rotate(90,-94.294068,-92.593178)"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#3771c8;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       id="text1003-5">
+      <path
+         d="m 102.58571,58.211269 h 0.86816 c 1.15755,0 3.11267,-0.177767 3.45994,-0.5333 0.35553,-0.355534 1.10026,-1.124479 1.10026,-2.306836 V -44.637502 c 0,-1.289844 0.18603,-2.228288 0.5581,-2.815332 0.37207,-0.587044 0.45004,-0.992187 1.36781,-1.215429 -0.91777,-0.206706 -0.99574,-0.603581 -1.36781,-1.190625 -0.37207,-0.587045 -0.5581,-1.529623 -0.5581,-2.827735 v -19.913761 c 0,-1.174088 -0.74473,-1.938899 -1.10026,-2.294433 -0.34727,-0.363802 -2.30239,-0.545703 -3.45994,-0.545703 h -0.86816 v -1.773536 h 0.78134 c 2.05879,0 4.63403,0.305924 5.32029,0.917774 0.69453,0.60358 1.0418,1.81901 1.0418,3.646289 v 19.814542 c 0,1.231966 0.22324,2.087728 0.66973,2.567285 0.44648,0.471289 1.25677,0.706934 2.43086,0.706934 h 0.76894 v 1.773535 h -0.76894 c -1.17409,0 -1.98438,0.239778 -2.43086,0.719336 -0.44649,0.479557 -0.66973,1.343587 -0.66973,2.59209 v 99.897013 c 0,1.827279 -0.34727,3.046842 -1.0418,3.658691 -0.68626,0.611849 -3.2615,0.917774 -5.32029,0.917774 h -0.78134 z"
+         style="font-size:25.39999962px;fill:#3771c8;stroke-width:0.26458332"
+         id="path1005-3"
+         inkscape:connector-curvature="0"
+         sodipodi:nodetypes="cscsscccsscsccscsscsccscsscscc" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-137.43764"
+       y="122.46283"
+       id="text1010-5"><tspan
+         sodipodi:role="line"
+         id="tspan1008-6"
+         x="-137.43764"
+         y="122.46283"
+         style="font-size:6.3499999px;text-align:center;text-anchor:middle;stroke-width:0.26458332">bit-depth</tspan><tspan
+         sodipodi:role="line"
+         x="-137.43764"
+         y="130.40033"
+         style="font-size:6.3499999px;text-align:center;text-anchor:middle;stroke-width:0.26458332"
+         id="tspan1057">reduction/dither</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#3771c8;fill-opacity:1;stroke:none;stroke-width:0.26458332;"
+       x="21.087883"
+       y="155.64751"
+       id="text1064"
+       transform="rotate(90)"><tspan
+         sodipodi:role="line"
+         id="tspan1062"
+         x="21.087883"
+         y="155.64751"
+         style="font-size:9.87777805px;stroke-width:0.26458332;fill:#3771c8;">}</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-142.71655"
+       y="25.939869"
+       id="text6980-9"><tspan
+         sodipodi:role="line"
+         id="tspan6978-1"
+         x="-142.71655"
+         y="25.939869"
+         style="font-size:4.58611107px;stroke-width:0.26458332">Notes</tspan></text>
+  </g>
+</svg>
diff --git a/Documentation/gpu/amdgpu/display/dcn-overview.rst b/Documentation/gpu/amdgpu/display/dcn-overview.rst
new file mode 100644
index 000000000000..f98624d7828e
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/dcn-overview.rst
@@ -0,0 +1,171 @@
+=======================
+Display Core Next (DCN)
+=======================
+
+To equip our readers with the basic knowledge of how AMD Display Core Next
+(DCN) works, we need to start with an overview of the hardware pipeline. Below
+you can see a picture that provides a DCN overview, keep in mind that this is a
+generic diagram, and we have variations per ASIC.
+
+.. kernel-figure:: dc_pipeline_overview.svg
+
+Based on this diagram, we can pass through each block and briefly describe
+them:
+
+* **Display Controller Hub (DCHUB)**: This is the gateway between the Scalable
+  Data Port (SDP) and DCN. This component has multiple features, such as memory
+  arbitration, rotation, and cursor manipulation.
+
+* **Display Pipe and Plane (DPP)**: This block provides pre-blend pixel
+  processing such as color space conversion, linearization of pixel data, tone
+  mapping, and gamut mapping.
+
+* **Multiple Pipe/Plane Combined (MPC)**: This component performs blending of
+  multiple planes, using global or per-pixel alpha.
+
+* **Output Pixel Processing (OPP)**: Process and format pixels to be sent to
+  the display.
+
+* **Output Pipe Timing Combiner (OPTC)**: It generates time output to combine
+  streams or divide capabilities. CRC values are generated in this block.
+
+* **Display Output (DIO)**: Codify the output to the display connected to our
+  GPU.
+
+* **Display Writeback (DWB)**: It provides the ability to write the output of
+  the display pipe back to memory as video frames.
+
+* **Multi-Media HUB (MMHUBBUB)**: Memory controller interface for DMCUB and DWB
+  (Note that DWB is not hooked yet).
+
+* **DCN Management Unit (DMU)**: It provides registers with access control and
+  interrupts the controller to the SOC host interrupt unit. This block includes
+  the Display Micro-Controller Unit - version B (DMCUB), which is handled via
+  firmware.
+
+* **DCN Clock Generator Block (DCCG)**: It provides the clocks and resets
+  for all of the display controller clock domains.
+
+* **Azalia (AZ)**: Audio engine.
+
+The above diagram is an architecture generalization of DCN, which means that
+every ASIC has variations around this base model. Notice that the display
+pipeline is connected to the Scalable Data Port (SDP) via DCHUB; you can see
+the SDP as the element from our Data Fabric that feeds the display pipe.
+
+Always approach the DCN architecture as something flexible that can be
+configured and reconfigured in multiple ways; in other words, each block can be
+setup or ignored accordingly with userspace demands. For example, if we
+want to drive an 8k@60Hz with a DSC enabled, our DCN may require 4 DPP and 2
+OPP. It is DC's responsibility to drive the best configuration for each
+specific scenario. Orchestrate all of these components together requires a
+sophisticated communication interface which is highlighted in the diagram by
+the edges that connect each block; from the chart, each connection between
+these blocks represents:
+
+1. Pixel data interface (red): Represents the pixel data flow;
+2. Global sync signals (green): It is a set of synchronization signals composed
+   by VStartup, VUpdate, and VReady;
+3. Config interface: Responsible to configure blocks;
+4. Sideband signals: All other signals that do not fit the previous one.
+
+These signals are essential and play an important role in DCN. Nevertheless,
+the Global Sync deserves an extra level of detail described in the next
+section.
+
+All of these components are represented by a data structure named dc_state.
+From DCHUB to MPC, we have a representation called dc_plane; from MPC to OPTC,
+we have dc_stream, and the output (DIO) is handled by dc_link. Keep in mind
+that HUBP accesses a surface using a specific format read from memory, and our
+dc_plane should work to convert all pixels in the plane to something that can
+be sent to the display via dc_stream and dc_link.
+
+Front End and Back End
+----------------------
+
+Display pipeline can be broken down into two components that are usually
+referred as **Front End (FE)** and **Back End (BE)**, where FE consists of:
+
+* DCHUB (Mainly referring to a subcomponent named HUBP)
+* DPP
+* MPC
+
+On the other hand, BE consist of
+
+* OPP
+* OPTC
+* DIO (DP/HDMI stream encoder and link encoder)
+
+OPP and OPTC are two joining blocks between FE and BE. On a side note, this is
+a one-to-one mapping of the link encoder to PHY, but we can configure the DCN
+to choose which link encoder to connect to which PHY. FE's main responsibility
+is to change, blend and compose pixel data, while BE's job is to frame a
+generic pixel stream to a specific display's pixel stream.
+
+Data Flow
+---------
+
+Initially, data is passed in from VRAM through Data Fabric (DF) in native pixel
+formats. Such data format stays through till HUBP in DCHUB, where HUBP unpacks
+different pixel formats and outputs them to DPP in uniform streams through 4
+channels (1 for alpha + 3 for colors).
+
+The Converter and Cursor (CNVC) in DPP would then normalize the data
+representation and convert them to a DCN specific floating-point format (i.e.,
+different from the IEEE floating-point format). In the process, CNVC also
+applies a degamma function to transform the data from non-linear to linear
+space to relax the floating-point calculations following. Data would stay in
+this floating-point format from DPP to OPP.
+
+Starting OPP, because color transformation and blending have been completed
+(i.e alpha can be dropped), and the end sinks do not require the precision and
+dynamic range that floating points provide (i.e. all displays are in integer
+depth format), bit-depth reduction/dithering would kick in. In OPP, we would
+also apply a regamma function to introduce the gamma removed earlier back.
+Eventually, we output data in integer format at DIO.
+
+Global Sync
+-----------
+
+Many DCN registers are double buffered, most importantly the surface address.
+This allows us to update DCN hardware atomically for page flips, as well as
+for most other updates that don't require enabling or disabling of new pipes.
+
+(Note: There are many scenarios when DC will decide to reserve extra pipes
+in order to support outputs that need a very high pixel clock, or for
+power saving purposes.)
+
+These atomic register updates are driven by global sync signals in DCN. In
+order to understand how atomic updates interact with DCN hardware, and how DCN
+signals page flip and vblank events it is helpful to understand how global sync
+is programmed.
+
+Global sync consists of three signals, VSTARTUP, VUPDATE, and VREADY. These are
+calculated by the Display Mode Library - DML (drivers/gpu/drm/amd/display/dc/dml)
+based on a large number of parameters and ensure our hardware is able to feed
+the DCN pipeline without underflows or hangs in any given system configuration.
+The global sync signals always happen during VBlank, are independent from the
+VSync signal, and do not overlap each other.
+
+VUPDATE is the only signal that is of interest to the rest of the driver stack
+or userspace clients as it signals the point at which hardware latches to
+atomically programmed (i.e. double buffered) registers. Even though it is
+independent of the VSync signal we use VUPDATE to signal the VSync event as it
+provides the best indication of how atomic commits and hardware interact.
+
+Since DCN hardware is double-buffered the DC driver is able to program the
+hardware at any point during the frame.
+
+The below picture illustrates the global sync signals:
+
+.. kernel-figure:: global_sync_vblank.svg
+
+These signals affect core DCN behavior. Programming them incorrectly will lead
+to a number of negative consequences, most of them quite catastrophic.
+
+The following picture shows how global sync allows for a mailbox style of
+updates, i.e. it allows for multiple re-configurations between VUpdate
+events where only the last configuration programmed before the VUpdate signal
+becomes effective.
+
+.. kernel-figure:: config_example.svg
diff --git a/Documentation/gpu/amdgpu/display/global_sync_vblank.svg b/Documentation/gpu/amdgpu/display/global_sync_vblank.svg
new file mode 100644
index 000000000000..48f5dc4fd5d3
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/global_sync_vblank.svg
@@ -0,0 +1,485 @@
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
+   width="232.24133mm"
+   height="96.174995mm"
+   viewBox="0 0 232.24133 96.174995"
+   version="1.1"
+   id="svg8"
+   inkscape:version="0.92.5 (2060ec1f9f, 2020-04-08)"
+   sodipodi:docname="global_sync_vblank.svg">
+  <defs
+     id="defs2">
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path862"
+         style="fill:#800080;fill-opacity:1;fill-rule:evenodd;stroke:#800080;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
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
+         id="path868"
+         style="fill:#ff00ff;fill-opacity:1;fill-rule:evenodd;stroke:#ff00ff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="matrix(-0.3,0,0,-0.3,0.69,0)"
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
+         id="path856"
+         style="fill:#ff00ff;fill-opacity:1;fill-rule:evenodd;stroke:#ff00ff;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="matrix(-1.1,0,0,-1.1,-1.1,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Lend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker1719"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1717"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#ff00ff;fill-opacity:1;fill-rule:evenodd;stroke:#ff00ff;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.8,0,0,-0.8,-10,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Lend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="marker1661"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path1659"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#ff00ff;fill-opacity:1;fill-rule:evenodd;stroke:#ff00ff;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.8,0,0,-0.8,-10,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:isstock="true"
+       style="overflow:visible"
+       id="marker1311"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow1Lend"
+       inkscape:collect="always">
+      <path
+         transform="matrix(-0.8,0,0,-0.8,-10,0)"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:1.00000003pt;stroke-opacity:1"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         id="path1309"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:isstock="true"
+       style="overflow:visible"
+       id="marker1253"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow1Lstart">
+      <path
+         transform="matrix(0.8,0,0,0.8,10,0)"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:1.00000003pt;stroke-opacity:1"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         id="path1251"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Lend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Lend"
+       style="overflow:visible"
+       inkscape:isstock="true"
+       inkscape:collect="always">
+      <path
+         id="path838"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.8,0,0,-0.8,-10,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow1Lstart"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow1Lstart"
+       style="overflow:visible"
+       inkscape:isstock="true"
+       inkscape:collect="always">
+      <path
+         id="path835"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#ff0000;fill-opacity:1;fill-rule:evenodd;stroke:#ff0000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(0.8,0,0,0.8,10,0)"
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
+         id="path850"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.00000003pt;stroke-opacity:1"
+         transform="matrix(-0.2,0,0,-0.2,-1.2,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Sstart"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Sstart"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         id="path865"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="matrix(0.3,0,0,0.3,-0.69,0)"
+         inkscape:connector-curvature="0" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-2"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path862-3"
+         style="fill:#800080;fill-opacity:1;fill-rule:evenodd;stroke:#800080;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         transform="scale(-0.6)" />
+    </marker>
+    <marker
+       inkscape:stockid="Arrow2Mend"
+       orient="auto"
+       refY="0"
+       refX="0"
+       id="Arrow2Mend-2-5"
+       style="overflow:visible"
+       inkscape:isstock="true">
+      <path
+         inkscape:connector-curvature="0"
+         id="path862-3-9"
+         style="fill:#800080;fill-opacity:1;fill-rule:evenodd;stroke:#800080;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
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
+     inkscape:zoom="1.979899"
+     inkscape:cx="747.52324"
+     inkscape:cy="319.84503"
+     inkscape:document-units="mm"
+     inkscape:current-layer="layer1"
+     showgrid="true"
+     inkscape:window-width="3840"
+     inkscape:window-height="2096"
+     inkscape:window-x="0"
+     inkscape:window-y="27"
+     inkscape:window-maximized="1"
+     fit-margin-top="0"
+     fit-margin-left="0"
+     fit-margin-right="0"
+     fit-margin-bottom="0">
+    <inkscape:grid
+       type="xygrid"
+       id="grid815"
+       originx="15.282997"
+       originy="-184.54792" />
+  </sodipodi:namedview>
+  <metadata
+     id="metadata5">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about="">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
+        <dc:title />
+      </cc:Work>
+    </rdf:RDF>
+  </metadata>
+  <g
+     inkscape:label="Layer 1"
+     inkscape:groupmode="layer"
+     id="layer1"
+     transform="translate(15.282998,-16.277083)">
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="M 15.875,27.125001 V 16.541666 H 26.458333 V 27.125001 H 177.27084 V 16.541666 h 10.58333 v 10.583335 h 29.10416"
+       id="path817"
+       inkscape:connector-curvature="0"
+       sodipodi:nodetypes="ccccccccc" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="M 15.875,37.708334 H 44.979166 V 48.291667 H 100.54167 V 37.708334 H 206.375 v 10.583333 h 10.58333"
+       id="path819"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 15.875,66.8125 h 97.89583 V 56.229167 h 7.9375 V 66.8125 h 92.60417"
+       id="path821"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 15.875,85.333334 c 0,0 132.29166,0 132.29166,0 V 74.75 h 15.875 v 10.583334 h 47.625"
+       id="path823"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="M 15.875,101.20833 H 187.85416 V 90.625 h 10.58334 v 10.58333 h 10.58333"
+       id="path825"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.52916667, 0.52916667;stroke-dashoffset:0;stroke-opacity:1"
+       d="M 100.54167,48.291667 V 111.79167"
+       id="path827"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.52916667, 0.52916667;stroke-dashoffset:0;stroke-opacity:1"
+       d="m 113.77083,66.8125 v 44.97917"
+       id="path829"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:0.52916667, 0.52916667;stroke-dashoffset:0;stroke-opacity:1"
+       d="M 206.375,48.291667 V 109.14583"
+       id="path831"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.26458332px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#Arrow1Lstart);marker-end:url(#Arrow1Lend)"
+       d="m 100.54167,106.5 h 13.22916"
+       id="path833"
+       inkscape:connector-curvature="0" />
+    <path
+       style="fill:none;stroke:#ff0000;stroke-width:0.26458332px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-start:url(#marker1253);marker-end:url(#marker1311)"
+       d="M 113.77083,106.5 H 206.375"
+       id="path1243"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="105.83333"
+       y="111.79166"
+       id="text1405"><tspan
+         sodipodi:role="line"
+         id="tspan1403"
+         x="105.83333"
+         y="111.79166"
+         style="stroke-width:0.26458332">To</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="145.52083"
+       y="111.79166"
+       id="text1409"><tspan
+         sodipodi:role="line"
+         id="tspan1407"
+         x="145.52083"
+         y="111.79166"
+         style="stroke-width:0.26458332">VStartup Period</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="156.01123"
+       y="78.71875"
+       id="text1413"><tspan
+         sodipodi:role="line"
+         x="156.01123"
+         y="78.71875"
+         style="font-weight:bold;text-align:center;text-anchor:middle;stroke-width:0.26458332"
+         id="tspan1415">VUpdate</tspan><tspan
+         sodipodi:role="line"
+         x="156.01123"
+         y="82.6875"
+         style="font-weight:bold;text-align:center;text-anchor:middle;stroke-width:0.26458332"
+         id="tspan1440">Width</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="173.77611"
+       y="92.703873"
+       id="text1413-3"><tspan
+         sodipodi:role="line"
+         id="tspan1411-6"
+         x="173.77611"
+         y="92.703873"
+         style="font-weight:bold;text-align:center;text-anchor:middle;stroke-width:0.26458332">VReady</tspan><tspan
+         sodipodi:role="line"
+         x="173.77611"
+         y="96.672623"
+         style="font-weight:bold;text-align:center;text-anchor:middle;stroke-width:0.26458332"
+         id="tspan1415-7">Offset</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="135.78951"
+       y="70.78125"
+       id="text1413-5"><tspan
+         sodipodi:role="line"
+         x="135.78951"
+         y="70.78125"
+         style="font-weight:bold;text-align:center;text-anchor:middle;stroke-width:0.26458332"
+         id="tspan1440-5">VUpdate</tspan><tspan
+         sodipodi:role="line"
+         x="135.78951"
+         y="74.75"
+         style="font-weight:bold;text-align:center;text-anchor:middle;stroke-width:0.26458332"
+         id="tspan1465">Offset</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="137.39433"
+       y="48.291664"
+       id="text1479"><tspan
+         sodipodi:role="line"
+         id="tspan1477"
+         x="137.39433"
+         y="48.291664"
+         style="font-weight:bold;stroke-width:0.26458332">VSTARTUP_START</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-5.4806676"
+       y="22.778271"
+       id="text1479-1"><tspan
+         sodipodi:role="line"
+         id="tspan1477-2"
+         x="-5.4806676"
+         y="22.778271"
+         style="font-weight:bold;font-size:4.93888903px;stroke-width:0.26458332">VSYNC</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-9.3767252"
+       y="45.64584"
+       id="text1479-1-7"><tspan
+         sodipodi:role="line"
+         id="tspan1477-2-0"
+         x="-9.3767252"
+         y="45.64584"
+         style="font-weight:bold;font-size:5.64444447px;stroke-width:0.26458332">VBlank</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-15.310558"
+       y="64.92263"
+       id="text1479-1-7-9"><tspan
+         sodipodi:role="line"
+         id="tspan1477-2-0-3"
+         x="-15.310558"
+         y="64.92263"
+         style="font-weight:bold;font-size:5.64444447px;stroke-width:0.26458332">VStartup</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-14.17781"
+       y="85.144356"
+       id="text1479-1-7-9-6"><tspan
+         sodipodi:role="line"
+         id="tspan1477-2-0-3-0"
+         x="-14.17781"
+         y="85.144356"
+         style="font-weight:bold;font-size:5.64444447px;stroke-width:0.26458332">VUpdate</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:3.17499995px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.26458332"
+       x="-11.052421"
+       y="101.39733"
+       id="text1479-1-7-9-6-6"><tspan
+         sodipodi:role="line"
+         id="tspan1477-2-0-3-0-2"
+         x="-11.052421"
+         y="101.39733"
+         style="font-weight:bold;font-size:5.64444447px;stroke-width:0.26458332">VReady</tspan></text>
+    <g
+       id="g5189"
+       transform="translate(269.875,-14.287499)">
+      <path
+         sodipodi:nodetypes="cc"
+         inkscape:connector-curvature="0"
+         id="path5143"
+         d="m -202.40625,45.645828 3.96875,-7.9375"
+         style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
+      <path
+         sodipodi:nodetypes="cc"
+         inkscape:connector-curvature="0"
+         id="path5143-2"
+         d="m -199.76042,45.645828 3.96874,-7.937499"
+         style="fill:none;stroke:#000000;stroke-width:0.52916676;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
+    </g>
+    <g
+       id="g5189-3"
+       transform="translate(268.55209,7.9375003)">
+      <path
+         sodipodi:nodetypes="cc"
+         inkscape:connector-curvature="0"
+         id="path5143-6"
+         d="m -202.40625,45.645828 3.96875,-7.9375"
+         style="fill:none;stroke:#000000;stroke-width:0.5291667;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
+      <path
+         sodipodi:nodetypes="cc"
+         inkscape:connector-curvature="0"
+         id="path5143-2-1"
+         d="m -199.76042,45.645828 3.96874,-7.937499"
+         style="fill:none;stroke:#000000;stroke-width:0.52916676;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
+    </g>
+  </g>
+</svg>
diff --git a/Documentation/gpu/amdgpu/display/index.rst b/Documentation/gpu/amdgpu/display/index.rst
index a443866332ac..fe2ecad8df81 100644
--- a/Documentation/gpu/amdgpu/display/index.rst
+++ b/Documentation/gpu/amdgpu/display/index.rst
@@ -2,28 +2,27 @@
 drm/amd/display - Display Core (DC)
 ===================================
 
-*placeholder - general description of supported platforms, what dc is, etc.*
-
-Because it is partially shared with other operating systems, the Display Core
-Driver is divided in two pieces.
+AMD display engine is partially shared with other operating systems; for this
+reason, our Display Core Driver is divided into two pieces:
 
 1. **Display Core (DC)** contains the OS-agnostic components. Things like
    hardware programming and resource management are handled here.
 2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
    amdgpu base driver and DRM are implemented here.
 
-It doesn't help that the entire package is frequently referred to as DC. But
-with the context in mind, it should be clear.
+The display pipe is responsible for "scanning out" a rendered frame from the
+GPU memory (also called VRAM, FrameBuffer, etc.) to a display. In other words,
+it would:
 
-When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
-supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
-Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
+1. Read frame information from memory;
+2. Perform required transformation;
+3. Send pixel data to sink devices.
 
-To determine if DC is loaded, search dmesg for the following entry:
+If you want to learn more about our driver details, take a look at the below
+table of content:
 
 .. toctree::
 
    display-manager.rst
    dc-debug.rst
-
-``Display Core initialized with <version number here>``
+   dcn-overview.rst
-- 
2.25.1

