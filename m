Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58F5851F0C
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Feb 2024 22:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA2810E5CA;
	Mon, 12 Feb 2024 21:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oY20aOv8";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3867010E186;
 Mon, 12 Feb 2024 21:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiF6igY6Nv3Xy6sKJHHny6oJ4k3EvH95Sd6wBgbtgwHSvgjs1SSeA/43iB/z/g3MhRL7JwFfPBNJKh88xLkp67DKgxJrI10geHRDbw8SgaxpFUwT+FD+U8zkbKhbEXI/rYEYj8ry7RiSpqNFw721R+uwrO6H6LqS05PwuvXzFxoNXOCTQWZd7eT6TuVxpij3taBORalIe347gi0vTYUpg9XjlaaXqjTrGj6YzMD/bCUX5FOU8fZr+zo25v3ruh2S5qhtIOdrbs6xB2Ne7NCXzusWVj4gvU0ZVdiZqzOAg7us0+ksyOnVOmMaxOw4ij7KyA938z2kcDIqt8MBzW3MxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iaw174XqstUFlubmP8makauL3rvlcv95/STdbCiUNss=;
 b=Vu1VXOhV3Bf4ovIzkZe3kD1T/POGW4WOd7XeKUaB3gB7h2xzU9EvEv7ZMqHOyGDeLiRRXxwsuR9M1zX1PcDI3XCLFgLfuqmHRXfy4B84pNJH3xj0E7rp6Ck0yOiN4pctWav8OXvT690Z/eGbkacc0/8mL9qvGcgo8fdDG/oQ3EUzjTw98CbDjCsb/Q7EtnMjhtZCgrsrYy7TxloHlP4RfNvEBKqapaJGAUpL/rZosnHwE/kxCXol0xDexKjd8w7n2LcMbOTZnvMJFVXG6Ac2QJeYr3QXxW6wzV7JQpIVTlmMW/sncvqOiXzLx0KzU6MmxbZ5yiWHhPE3AZIhFxk0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iaw174XqstUFlubmP8makauL3rvlcv95/STdbCiUNss=;
 b=oY20aOv8qIZ2OHaJIkBVaTvJxzR/hvUEYH1T07unIwgb9o9x6k3Co4PTu8yEL5MtbmzFncNl2KuDb960YNOPj/5EJR/r74ldL9yfkDJV25uSFMEOWX/N49E/y80wPwh83P3MqiYuf56Ulb7LsuOQ6VdE0IZ5eGxeVoeVaEiQkTg=
Received: from CH0PR03CA0413.namprd03.prod.outlook.com (2603:10b6:610:11b::11)
 by LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24; Mon, 12 Feb
 2024 21:04:47 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::92) by CH0PR03CA0413.outlook.office365.com
 (2603:10b6:610:11b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Mon, 12 Feb 2024 21:04:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 21:04:47 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 12 Feb
 2024 15:04:45 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>, Rob Clark <robdclark@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [PATCH 3/6] drm: update drm_show_memory_stats() for dma-bufs
Date: Mon, 12 Feb 2024 16:04:25 -0500
Message-ID: <20240212210428.851952-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240212210428.851952-1-alexander.deucher@amd.com>
References: <20240212210428.851952-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd29e6e-f662-43bb-fa87-08dc2c0e3e95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iL1HzqyhM9C2GEMwsN9s2BBX+1EW4zyuqkwioxqw6Ywa9NGIIOhNqCg15r+pfv9xifERngZBFRRkaE+RHnTiLLXcRxXMVRJePFVXi6gfiS3vAon6s06D5dNslkb+DFmksyPH7XPHKgDWd5xfq/PnpJY3QlXimH5m/StFmjXFjhJST0B2hRtmCdOK2VWaYywvCNoUb1azPoWHZmyaj+5qVJGhHYp3O6RaHICbXUY3qsFUDhu2BL8SlbfB/CxJmdH3IA5qcCgyjj2CX6Uav7z815IG925hM3uCMQp2eg3RNebeBrxVkEAhFjW0EiIbBCb4jywtc3vywlPZmtdd3SB6bGgzdIZCyQuyobzUvv9usdp4/pzbkMtbx7G480tbzE9rNZ6N0uWCtwnl5sLkLtXi92kOFI6rIRcT6e3zJ+fq1c+QQTKmHtDpFrDTjNoaFVwvk6G3Qxkbpr9dvV+EaRuQLBdWY9k8PdUhFzeEPk+GiH2av2mwdeCFCbbAxugswGnj2NILHUF0VOl1QOehwToLn4lp8PFp6uMnXHo+NL2cVDBtmioavukiMH6QFJ9baOBsUbIlS2iE0KBNP2j0Rpgu/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(86362001)(5660300002)(70206006)(70586007)(8676002)(8936002)(82740400003)(4744005)(4326008)(478600001)(7696005)(2906002)(16526019)(356005)(336012)(426003)(41300700001)(2616005)(1076003)(83380400001)(81166007)(966005)(26005)(6666004)(316002)(36756003)(54906003)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 21:04:47.0323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd29e6e-f662-43bb-fa87-08dc2c0e3e95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450
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

Show buffers as shared if they are shared via dma-buf as well
(e.g., shared with v4l or some other subsystem).

v2: switch to gem helper

Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
Reviewed-by: Rob Clark <robdclark@gmail.com> (v1)
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/drm_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 8c87287c3e16..638ffa4444f5 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -913,7 +913,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 					DRM_GEM_OBJECT_PURGEABLE;
 		}
 
-		if (obj->handle_count > 1) {
+		if (drm_gem_object_is_shared_for_memory_stats(obj)) {
 			status.shared += obj->size;
 		} else {
 			status.private += obj->size;
-- 
2.42.0

