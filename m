Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB14840FECF
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Sep 2021 19:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1DC6E03B;
	Fri, 17 Sep 2021 17:47:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8316E039
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Sep 2021 17:47:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkCxIlwjLjFMAslYyPasA0Bo9Wx/4yGzvANiYnKCU0ZNjrY8LFuh/LR+nHPh6TbCri+GZb20ZgiHHa1JdqMwfI+f1y+B2kFK5wB0BlIcj4raATBRNOfwbSV975X4HTuPkuDAtvOZpasjou5bBgO5w7r275ZO+v6ZM5Gl1USricy6IEhKPtk1iqboDG+WoPyS8E3yysa/zeMPu0r9BTKFI38Jg8mS4BDOoFI0xRtrJ6ykfOH6FdbItvaYtpeqNraXsQgqPsOM48uqzH2zKe7QVZtUnj82LclZVT+5E4boYPp1Fqkrn27jjivRh/6JZ8Xv3oDO7/l1zV09009kLpXZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ZLjmmIODfDlyEwhBGU2tutb34MUO8/t1aqmLrvJ8oaE=;
 b=lEJK3C8kJ4VMPmPRGZEJ5omTZudw3Wup9WJgiUtdCAiNM7oPVYMoE73C9nBHDN7Hcr0KgD3pxlbGcmYU1KudSsoeXQTtez3C6QtahU2qN+DyU+lUU7fuVCGOIyLpFrrwu5WWcUdelW40ABgHiBQScLGeWPjhfvIuTaQmqFHQ4SRcEEGlpfZ3XfpShIZTphSG76XQL2HMYlPEU7BDGexW9Hy5psNZLbNsTFKDqUBl84YvmnOuG3Lr15+VDCMtnWfLNtB6+VDvwRgeDRG3p0PoCqImYKm7lLC301aphui7eS+oOj6zqoV5UfjojjPNB0eI5E+l9Nn7Qtx0iJBNFWGTkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLjmmIODfDlyEwhBGU2tutb34MUO8/t1aqmLrvJ8oaE=;
 b=NV16xbl18iWq1AsBjWOeOhJSL0ft8mJ8ZuWmKXKkJahU2min3+B4Q/+6db4VxvEYUEOYq7ROxcdkdukSEOPLxrYzxYS2hrDk4C6by+veBNTpsi6wV/mzyqKwyVHmClMoEHaoxGJu+Bz2DUrbT5xytF4ed5e6Yj/IgwmUC4394HE=
Received: from BN8PR07CA0015.namprd07.prod.outlook.com (2603:10b6:408:ac::28)
 by DM6PR12MB3929.namprd12.prod.outlook.com (2603:10b6:5:148::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 17 Sep
 2021 17:47:40 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::ea) by BN8PR07CA0015.outlook.office365.com
 (2603:10b6:408:ac::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 17:47:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 17:47:40 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 17 Sep
 2021 12:47:38 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Bhawanpreet.Lakha@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <Aurabindo.Pillai@amd.com>, <qingqing.zhuo@amd.com>, <mikita.lipski@amd.com>, 
 <roman.li@amd.com>, <Anson.Jacob@amd.com>, <wayne.lin@amd.com>,
 <stylon.wang@amd.com>, <solomon.chiu@amd.com>, Anthony Koo
 <Anthony.Koo@amd.com>
Subject: [PATCH 02/18] drm/amd/display: [FW Promotion] Release 0.0.83
Date: Fri, 17 Sep 2021 13:47:00 -0400
Message-ID: <20210917174716.3011466-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917174716.3011466-1-Rodrigo.Siqueira@amd.com>
References: <20210917174716.3011466-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a64ac88d-b883-454e-e335-08d97a033e7a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3929:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3929705F258F984523CE06C998DD9@DM6PR12MB3929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a+DLqxipKvjPaGaOS1wqzpAUJUEygxsqDNtV32vuRiSE+xSeLe+SqLj1DCv7FP7G4BeELjZhJqboGxRPutewhuwQtDKKtH7pzkpb7FR4FZjS0iCf2FiJLkm5uyyR6ojyo8Hm5IfGR86NQMCAzZf9mreQ2mM3B+HYJL+L6d9nE+6Tic2I1IwQvD5GvZk5ih/+PBzgkgIVWlNBMYaf6ip7wKjkRXRoGhkZ7SIzuAJ14Gzt5tFr/1elz1LstNAydgWrij/rQVXuK7NgwzgPdotkoCnrfV1ggf8642K3slK+O7LoDymk00uWWxS9g3k2g3Cgrsq1+ZLb1hQ8RgXLZIsFBtqzuHgNkC6scHqzsqek58oMp6oVat3NoWlQpcJbNy54jTX5BmKaD5xYkcwVX8k2DSS5VqnT4xdf0jJfL+qtaoh352PL1oKwRZIW+UvFhCb+crtdjyDvu+xFgGcSOVB4icVjqOSyDU5cDEvKp1zEBbJgfYKwA8LhxgaEoabOh/NAuxdmAxGEgoUjZUjFMEuhpK2EhMsHdj2W4+wXr4ve/7grxNDUp0ZCMSjIi0wtEHiQGJcWvA7gQTEOS3f6JjgCheAKkxGzpJjALJVrDaX4Y3Pc9xdsLRECTV88NMzLk5N1qaOsefYqyJMENT4NaJZScGc8FNTKjYxDR2aUnR/TbfkT+mo75leytfi799cKTuVGqHXbSuoMbUttpNVkBTpPFKw5SKSxLm9MKAj1dxXHLHo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(54906003)(336012)(426003)(82310400003)(316002)(36860700001)(36756003)(86362001)(81166007)(356005)(2616005)(70586007)(16526019)(2906002)(8936002)(4744005)(47076005)(1076003)(26005)(6916009)(70206006)(4326008)(6666004)(8676002)(83380400001)(186003)(508600001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 17:47:40.0937 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a64ac88d-b883-454e-e335-08d97a033e7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3929
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

From: Anthony Koo <Anthony.Koo@amd.com>

Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Anthony Koo <Anthony.Koo@amd.com>
---
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index 2c4ec3cac70e..1edc5bb4d668 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -47,10 +47,10 @@
 
 /* Firmware versioning. */
 #ifdef DMUB_EXPOSE_VERSION
-#define DMUB_FW_VERSION_GIT_HASH 0x3f002dea8
+#define DMUB_FW_VERSION_GIT_HASH 0xb24cbe3d
 #define DMUB_FW_VERSION_MAJOR 0
 #define DMUB_FW_VERSION_MINOR 0
-#define DMUB_FW_VERSION_REVISION 82
+#define DMUB_FW_VERSION_REVISION 83
 #define DMUB_FW_VERSION_TEST 0
 #define DMUB_FW_VERSION_VBIOS 0
 #define DMUB_FW_VERSION_HOTFIX 0
-- 
2.25.1

