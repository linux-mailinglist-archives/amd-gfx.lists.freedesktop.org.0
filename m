Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04F621D1CB
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2020 10:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585AB6E150;
	Mon, 13 Jul 2020 08:34:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760045.outbound.protection.outlook.com [40.107.76.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66D26E150
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2020 08:34:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbbB0lhqJo8m9SscxlMo6TihshKqmMqwJ84GTQ8ZEpewVPexjmnyzl8/FkTBC0yZW4jzS1ez8kBgt0ZP9yOQwQjPLvAUB5uCbSnBGBBvON/A3owyD3IMunHUcWHGfb+RbzVyZ/r3m3Qp6u5+904LdDV8+8ZDDJmj3MLNH9P364A0yjwMWvNNj00kLLGR16RpHO0mGp9e4MfXh62IiE9BLogEMDYAX7cBYrH6Rl0SYX0ZeckcKsH+Ol1tR8xid2JhyOrPfLuoUqNHdMjZh1vR0lpVWI9+bdeX7h31W5okfg3uDNS2YajtnfqCg07MQ36RqxZswgwAbzl5yD30JSK+qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=St2WoIH1FMXhM0fLqSGLaKAKO5QNYCDfE/8job7bGJk=;
 b=YrP/SRLA/7rUfuOobjUeE3/yattuLlIMLGQdEFYUNP6sN+LgEQ9310HVU2mhXQG3JS2bdCr6pPFyNXa7GNcSvfKqTRvJYDVtn3ZjUVdGQjr1ndKLyx55y+dGDwXhPyaJ3zobgrhMrrggPehKJLpRuPu9TxYvCci+PsNVLFQyXOXcSFeUSvzSbRB9MRLucTx25zltqTIS4J8gTZUvHFfceStx9LI2smoIU6VlEGKmyKJZJXraHOC2nSG+AzcZe/IG1FferS5AtAjNU9Xo7dxZTiQZ79D5imrV5s/8NP1UW1HmI2vDO2dNDPsilHbeBxTjDp7r1Mn8paiGNLldyhdW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=St2WoIH1FMXhM0fLqSGLaKAKO5QNYCDfE/8job7bGJk=;
 b=M+w7CT3EaBWaAX2VzKew/EhKbaL81wNBqYhYUwzaSjvREVvCFzPPDSd9dt8gAaf2PLST6AZvs6Yr6x6Hpk4SCEQxk2EnX/19oyj3NZqJLhNBqvy1nU0OMkaZcOsFAX53hLCb166xvLICbnSM0YvWDg/vpNvvdjZxYoDq8uQItlo=
Received: from BN6PR03CA0079.namprd03.prod.outlook.com (2603:10b6:405:6f::17)
 by BN6PR12MB1395.namprd12.prod.outlook.com (2603:10b6:404:1f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Mon, 13 Jul
 2020 08:34:26 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:6f:cafe::73) by BN6PR03CA0079.outlook.office365.com
 (2603:10b6:405:6f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Mon, 13 Jul 2020 08:34:26 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3174.21 via Frontend Transport; Mon, 13 Jul 2020 08:34:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 13 Jul
 2020 03:34:25 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 13 Jul
 2020 03:34:25 -0500
Received: from gc-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 13 Jul 2020 03:34:24 -0500
From: chen gong <curry.gong@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/powerplay: Modify SMC message name for setting
 power profile mode
Date: Mon, 13 Jul 2020 16:34:21 +0800
Message-ID: <1594629261-18409-1-git-send-email-curry.gong@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(6666004)(2906002)(6916009)(186003)(316002)(83380400001)(26005)(336012)(70206006)(70586007)(356005)(2616005)(86362001)(82310400002)(15650500001)(5660300002)(478600001)(426003)(81166007)(8676002)(82740400003)(47076004)(4744005)(36756003)(7696005)(4326008)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d84a244b-fccd-4f7a-7e12-08d827078d0d
X-MS-TrafficTypeDiagnostic: BN6PR12MB1395:
X-Microsoft-Antispam-PRVS: <BN6PR12MB139556535F46DF73C8CC25BC9D600@BN6PR12MB1395.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3n/RN8P4pwxX/7aWjhyRAKz+qcPA5huCmQpcH7lskTLBmtSNBNSvD+vJ5B9iQQPZa6nrzShMws1vI2v40vUwj7tykkuNdyiOkbzzejiDwIiWZ/NSrnvOZH/0RJs+YLkT3iesPTyojzqarMK/jwzlif4q1CHOHVwCifswkwTop3uyaZ3vyilh00VLpQ9uJF5lSV5snCN2SJ87nJNPKBhGwwJ7iKFfQJgbQHReE4ceWcBCClvdcaqDfNVXDL9zMhBoefzdPd58NyLGc7sH6R51tBvWggaGpzH+Hsvzqus5C8fOXCpi8X8l2deqLECAoLxVcVySZqZWCETbIu1zU9wJr857Ywj+EE9w/v8tjrsRg20pWw2DeQFYQ3ciYMdq4sbRtC7IMWRkCpcwVaCid+1YXA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2020 08:34:25.7201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d84a244b-fccd-4f7a-7e12-08d827078d0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1395
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
Cc: chen gong <curry.gong@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

I consulted Cai Land(Chuntian.Cai@amd.com), he told me corresponding smc
message name to fSMC_MSG_SetWorkloadMask() is
"PPSMC_MSG_ActiveProcessNotify" in firmware code of Renoir.

Strange though it may seem, but it's a fact.

Signed-off-by: chen gong <curry.gong@amd.com>
---
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
index 5071cfb..4fcb51e 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -698,7 +698,7 @@ static int renoir_set_power_profile_mode(struct smu_context *smu, long *input, u
 		return -EINVAL;
 	}
 
-	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_SetWorkloadMask,
+	ret = smu_send_smc_msg_with_param(smu, SMU_MSG_ActiveProcessNotify,
 				    1 << workload_type,
 				    NULL);
 	if (ret) {
-- 
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
