Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4767D5A6
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 08:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FE96E37F;
	Thu,  1 Aug 2019 06:43:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760071.outbound.protection.outlook.com [40.107.76.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF196E37F
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 06:43:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jl17KBVG4sb1/KJayAhUigw4SNH3x9Wpo1zctETYGJTU5gpqnCkLcXBV1PnCy0IiV3X2FN/PLo283PzzVGW/ZUFcSyZP1TVP/TLrBrCinM+/qEqDnQT3WVmt+1Yau5WndXSJHYO2p8Uv3mnR2lFeWVRHHhSCIZMfbeEUAOEQ9niOGRmV7IftVMtcsEgV8+zTROyqFB1V2EN4S4IuphkHuGt/QIcqAZCLNykfdllxyUtkKXIP4foF190hgOkmLwV8HVwERe8rep28WFyAsauBiE9F9Zuq4JqGSeLuNbHqWi44w+qTJ4iZb4+tZuzhcwqeMkDA5MRfD18W4cVchvveTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/bYdY6QWhXufXh+Wz/KWzjk4zE2QK9IpOb3B7i9TPY=;
 b=Wur2qVM3Elf+iow7lNOkjP7bBYoX5vm3VR8qllfMS21Xc/y93ERXPYb8rORnoxBp0TFFr4ZMqRL8Iaw5ISEN1uS7O7SvvzELuGO/wQfUOynT1T+4yX5BZVSep0knQYubVJrOy59t3+/r+BbwjZ2LSbsK2OkP8gmNjwk4ouZNQmbSgkKjTWfFHw6r+s8Hr6ypPj7nAs+wVBD44gYzU5e3IWquHfv3Pl75ln3CYz72mGnLEumYysHxl7i5Cv/MQpGZTIsebs3MeuC0T9BfkD3PbyZlZR8y/BZQG0BB7D7loaRb0gmk74RXdFqt+B862hdBHiB34K37vGncYwru0UQsUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR1201CA0021.namprd12.prod.outlook.com
 (2603:10b6:301:4a::31) by BL0PR12MB2529.namprd12.prod.outlook.com
 (2603:10b6:207:4e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Thu, 1 Aug
 2019 06:43:48 +0000
Received: from DM3NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by MWHPR1201CA0021.outlook.office365.com
 (2603:10b6:301:4a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.13 via Frontend
 Transport; Thu, 1 Aug 2019 06:43:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT021.mail.protection.outlook.com (10.152.82.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 06:43:47 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 01:43:44 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 1/6] drm/amdgpu: remove the clear of MCA_ADDR
Date: Thu, 1 Aug 2019 14:43:06 +0800
Message-ID: <20190801064311.7307-2-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801064311.7307-1-tao.zhou1@amd.com>
References: <20190801064311.7307-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(48376002)(53936002)(426003)(53416004)(305945005)(5660300002)(76176011)(16586007)(336012)(47776003)(6666004)(356004)(36756003)(186003)(70586007)(50466002)(51416003)(110136005)(486006)(126002)(70206006)(86362001)(6636002)(81166006)(81156014)(50226002)(8676002)(316002)(2201001)(68736007)(7696005)(2906002)(26005)(1076003)(2616005)(8936002)(11346002)(478600001)(446003)(4326008)(4744005)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2529; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56f34bc4-006d-4b7d-8f47-08d7164b9b16
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BL0PR12MB2529; 
X-MS-TrafficTypeDiagnostic: BL0PR12MB2529:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2529207827AC7CE12FD0FBBEB0DE0@BL0PR12MB2529.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Llrm+B6EUI/sAKJxocGgcdyxKHz+KObGMQpjNVs0rUvAUWu6OhKccT/KYeJOKOUoe8IK3oswqzrhbGsiQFKU74dGYK4EENyC3tych+70zS4fs/JiXUW40P08uBV1MTiKfdriOd06xJCyv8SmxyV7q8pwFxzk79wtSptmnoz/FSrYyK+bleaHkR5VfvbQVgzclNVdZ0Xp1RxM/djKljCGMybVM6LiEakI+bjbINh7M2N469go988E3xIMnLA2z3gbor5c331HeCzKXqNFA97VO1gtgX34v3bsimt0JcyHsZp+9WXkOJ2mw8P+fCSS2HNvQ9x05SyqNVqmRCeuv9Y2lriQ55CJhthMOlHfY92xCShBIF6bU+JaYAoxCvYzflh2fVWSLSdYRyMUtsLvIM6+QAMFHC38Xw5zZM5lrc7aQk8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:43:47.5478 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f34bc4-006d-4b7d-8f47-08d7164b9b16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2529
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/bYdY6QWhXufXh+Wz/KWzjk4zE2QK9IpOb3B7i9TPY=;
 b=11RgFIXxkwGx/oYGx2D6Np64+iJ29/7nyfPZtVKH0OWW4xgvRQRn1GUEeP+/D+2sqCPTpS+PZO94VVGvkb+deyZmc/9UGVmpN1sSMv5jKWv1z7/fB292AqvmvZBn6kHtpZVSb5QilgELaVOCNrzz9703kZBGsFZhqjvjE2H62VE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y2xlYXJpbmcgTUNBX1NUQVRVUyBpcyBlbm91Z2ggdG8gcmVzZXQgdGhlIHdob2xlIE1DQSwgd3Jp
dGluZyB6ZXJvIHRvCk1DQV9BRERSIGlzIHVubmVjZXNzYXJ5CgpTaWduZWQtb2ZmLWJ5OiBUYW8g
WmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dW1jX3Y2XzEuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jCmluZGV4IGJmZjFhMTJmMmNjOS4uMDM1ZTRmZWE0
NzJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKQEAgLTIyOSw4ICsyMjks
NiBAQCBzdGF0aWMgdm9pZCB1bWNfdjZfMV9xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKIAogCQkJLyogY2xlYXIgdW1jIHN0YXR1cyAqLwogCQkJV1JF
RzY0KG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0LCAweDBVTEwpOwotCQkJLyog
Y2xlYXIgZXJyb3IgYWRkcmVzcyByZWdpc3RlciAqLwotCQkJV1JFRzY0X1BDSUUoc21uTUNBX1VN
QzBfTUNVTUNfQUREUlQwICsgdW1jX3JlZ19vZmZzZXQgKiA0LCAweDBVTEwpOwogCQl9CiAJfQog
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
