Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4922E7DABA
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 13:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D787E6E563;
	Thu,  1 Aug 2019 11:55:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690075.outbound.protection.outlook.com [40.107.69.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C756E560
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 11:55:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQ1//of0ChyEgRhvoRc8al4IQ09UPfToH1AradYcj5ykNo41EL1EeCyzdybspFS+SrVnKE3OYahlLqt2H3WGX8PMATuRO85DTkOAlP3R0RhAUJukGPqI/dZ98nw2uz6HFssRkG0FPguxBI/Kpnfiv/sMTheB0UqB/j/zkW87YnN8Vh6A6cdrNP5FNN8Sd1Cf1GIzwgAjxH8rteZsgZHrgLoAx3zo2ogKWI8zCma/ma/Jz5MDoIxxCWlO4JA4lLGm1PDiQ0f6Iga1+QKW/VL1xqxJ6U+i21N4rtDd3NUOtUYueXlSCG8J06k1kZoezjq/mN55C8mHlIIypWqE2FoO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHgnBOsvst9DlmDagkEUzGgqAMBbVLx790VtZ+kL+qI=;
 b=fuFgcR7BPtKQvP+jVhvaZKTalNTZ45N9EaYw/q0FJOHTPvMZcC3TxGScqKVJP/5PMkEVAb58GRew/Ga6tKv9ebPAOtfbLht0XfImWKk0MJSEuNNawHaaLyz5YZNkDLXQkYIYU0AbaWaxQJW0VHZXP0Fkeqab/d3q3v6zhk0FsjokYCANvVpUPkoc1ObN0ED4IuQh5LsRQC8WKGPP1Gf3NypL4sxDlabKBQ8KEbD+Peo5urYdL98Aa9W/rs3jg9f6HkCSLikGXo5b+7wnX9sJrHh3zGqTztYfe7bJwJFlGiiDwnMpJ4R9bDzV8XW52yyqPa6PvLKfoONtMR7QCDsOLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0001.namprd12.prod.outlook.com (2603:10b6:5:1c0::14)
 by SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:2a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.13; Thu, 1 Aug
 2019 11:55:46 +0000
Received: from CO1NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM6PR12CA0001.outlook.office365.com
 (2603:10b6:5:1c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12 via Frontend
 Transport; Thu, 1 Aug 2019 11:55:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT036.mail.protection.outlook.com (10.152.80.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 11:55:45 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 06:55:44 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 4/5] drm/amdgpu: only uncorrectable error needs gpu reset
Date: Thu, 1 Aug 2019 19:54:53 +0800
Message-ID: <20190801115454.21867-5-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801115454.21867-1-tao.zhou1@amd.com>
References: <20190801115454.21867-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(68736007)(486006)(53416004)(126002)(11346002)(446003)(476003)(2616005)(305945005)(4744005)(4326008)(2201001)(53936002)(14444005)(1076003)(110136005)(6666004)(16586007)(356004)(26005)(8936002)(51416003)(7696005)(81156014)(8676002)(81166006)(186003)(336012)(426003)(50226002)(6636002)(478600001)(76176011)(70206006)(70586007)(50466002)(48376002)(36756003)(86362001)(5660300002)(47776003)(2906002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2542; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0053b65b-921a-4d4a-2e92-08d716773020
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:SN1PR12MB2542; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB2542:
X-Microsoft-Antispam-PRVS: <SN1PR12MB25425FC3CA6D9622B60C8318B0DE0@SN1PR12MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: MKdh3t03dYj+rBwfNIMq9fFoN0LN0jac5vH1a5rL0XkzZY0Buw31wNJFwYSIzUE7XIcYvLxrUQw2gw7mZqYB8bovYt6uzFf3FifcLGxNP3vTYWVWQ8Tqw87sNJoRWksP1UHf6Ry5fvGKXVh+PYHbdCLrZnxOhDrnoaEzaCMtylLuJ3kDeOgX7Pi2ezU958VBM9drevDrCbNXwV5mwEesG+ja2AJwul1mARIEtmp0Fp8MZlv0VfWqn1rXdc5ZR/YJGtMG6mkib23Wrqr3RBi2eO3MgaEhEhhXAmKaiFfAmhp5Eq2GgMyKtk61sd6MDxtAhejKetWl/bslbutsRdIPcQpDstmYRDC+VwZRzv22cAvE0Cw2v3Mq+inv2x6Ez0dkv5nKpDPn78GRHT13ztjHQXj/grmrgMgqLU21dvd1mok=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 11:55:45.8527 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0053b65b-921a-4d4a-2e92-08d716773020
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHgnBOsvst9DlmDagkEUzGgqAMBbVLx790VtZ+kL+qI=;
 b=s7yf8TbZBjWEWddZGgQMWnpLumTz5qzhFmRX6nYi80WHuVZGIhv/aDB1SshCSGIQykZrZipZNc2uAKXBI19bADX9gOlRSkjhq7uopTVldfwyLTJWJ+uDlDElTx8n1W5piYrabaCXkbznUPOUg1HSCaEtkgQOwR+5zj2IHf4a0YA=
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

U2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jCmluZGV4IDA1Y2JkOTBkOWI2Yy4uYjZlZGFkOGJiMzFjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTI1MCw3ICsyNTAsMTEgQEAgc3RhdGljIGludCBn
bWNfdjlfMF9wcm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAog
CSAqLwogCWlmIChhZGV2LT51bWMuZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzKQogCQlh
ZGV2LT51bWMuZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzKGFkZXYsIGVycl9kYXRhKTsK
LQlhbWRncHVfcmFzX3Jlc2V0X2dwdShhZGV2LCAwKTsKKwkKKwkvKiBvbmx5IHVuY29ycmVjdGFi
bGUgZXJyb3IgbmVlZHMgZ3B1IHJlc2V0ICovCisJaWYgKGVycl9kYXRhLT51ZV9jb3VudCkKKwkJ
YW1kZ3B1X3Jhc19yZXNldF9ncHUoYWRldiwgMCk7CisKIAlyZXR1cm4gQU1ER1BVX1JBU19VRTsK
IH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
