Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F02E127F
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Oct 2019 08:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5C36E969;
	Wed, 23 Oct 2019 06:51:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760047.outbound.protection.outlook.com [40.107.76.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F6A6E969
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Oct 2019 06:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYg3ckEhyp+xo+XHzLIRuHSa5szPbNGBiTG93h8RLS0ikw8ovbvCy4PgS89IzDtcwQT/47sBCrlMEDX0kMlFR8q/J53E8SJ7SXUAMLZ2rKYzPimh9QjahQyb9HjskL0FlIEqJRgEX/MeyVZ5t68ZkYUlBpVqQl4TV9KKOUXPexGcfThYC8NRjd9DRzImC4uQeEji0qxoOOmqqX2NED3MdybAo6CL7or6aH8giP0j59BCLB12ing3bORZHV10bPJsY+7BJK99UX4A71Mt+1j8QtoXiLxDwHQA1LqnJSrSsO106aEFYjv+g7CPTenKk15bWdX3s0cb48y486iTB4TEdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7syVxQhNK9p2Kw7H+k+pbnrSXRI8z3eZxJyTOh07zNc=;
 b=Ds8MQFiFDxKFvrWVJPOt4k0pZDXW41GvlpeMSm5IR2rwowIVq8J8a9Jf7ff7YEbOG7U/QVvDSCEG9Uk6kf/XlEdLxkfx3i0PWLVMDYTlPgjh15SxElT+Ps+0dSXOpwuunoe5184SwD9d0zR7CXzoToYkihXfyoGS7GSKONWtd+utpfkfvU3+I8QSyXNJNNatZ++PvkVYakFEz4YB6FMfbII349o/R1GF3dyI+EFF8pIYAC4BIkA36XZS2Nv6xrdVJZh6+YgTMAWGxKeuNvDfnJHaw/AhNGoNmurLqMe4sCSdXiz/Ysq9nYPa2DGAJ4sMKPlKI/FlAboRfice9IRKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0018.namprd12.prod.outlook.com (2603:10b6:610:57::28)
 by MN2PR12MB3101.namprd12.prod.outlook.com (2603:10b6:208:c4::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20; Wed, 23 Oct
 2019 06:51:33 +0000
Received: from CO1NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by CH2PR12CA0018.outlook.office365.com
 (2603:10b6:610:57::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Wed, 23 Oct 2019 06:51:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT037.mail.protection.outlook.com (10.152.80.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Wed, 23 Oct 2019 06:51:32 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 23 Oct
 2019 01:51:31 -0500
Received: from gc-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 23 Oct 2019 01:51:30 -0500
From: chen gong <curry.gong@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix SDMA hang when performing VKexample test
Date: Wed, 23 Oct 2019 14:51:27 +0800
Message-ID: <1571813487-31589-1-git-send-email-curry.gong@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(428003)(199004)(189003)(53416004)(47776003)(2906002)(336012)(16586007)(86362001)(186003)(48376002)(126002)(36756003)(4326008)(305945005)(476003)(2616005)(316002)(2351001)(5660300002)(426003)(70206006)(7696005)(70586007)(6916009)(50226002)(81166006)(81156014)(8936002)(6666004)(356004)(478600001)(8676002)(486006)(4744005)(26005)(51416003)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3101; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0876e2fe-cb2c-4b57-a43d-08d7578570a1
X-MS-TrafficTypeDiagnostic: MN2PR12MB3101:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3101FAB328518A24B98E5D1A9D6B0@MN2PR12MB3101.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 019919A9E4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 750zRdIbjAonXstTxrdNe1rlvJ+7RWtm30HesxxYVBYsFxM2yI9VTFgPWenb0TZryE+SgLhMQfIuEFOiJOnN6M0FGBLJDr++Wj/oIxOhbJ481Xqyzn9CKIL/1pPJC7VXXT/+GsCxRFaQKtP66SUTcVvO1LNCl57TOXuNekhwSZmJRmFUBD/urKMKMD/B7+o7pVdxcKVhWYcLg474KFMzzzB5YHABUOH345e5x/YK1gKhDWj+ZWJl9NLcxaLQExCgjxbWjsB4eSNpYpXQUcN0UhhGaPrenDn0TPn/EM09cWJPQ4qyHOoRoibK8Q6RBZcMFeTF5FtOmi3HOOF1fybtjd0aN65sFL+dTdb3gf8UaYqanvdzBwl+N+aCFWA6oekw93D9AnUqn3t1GMSevuSe3tnCJRzsi3SrM+SwTKyAuDiOWf2fevIhfKgC+ZmWdqPQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2019 06:51:32.6489 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0876e2fe-cb2c-4b57-a43d-08d7578570a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7syVxQhNK9p2Kw7H+k+pbnrSXRI8z3eZxJyTOh07zNc=;
 b=gMXqHJI/sj2HSOKNNco7t2KKzcIGKI6uOGC1s/7miy92S3lZPF36sb/0+r1w/lb9n1P1Cgp56Cmb/ifGT3WpTt+W0o8z29WZqosTZsevVrm3hd4QM/SWgO+/Fv+AumzQLzCNAVN07hZS6dQ8D2xOqBVT6JqrEHXeuDFaIUAPdls=
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
Cc: chen gong <curry.gong@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VktleGFtcGxlIHRlc3QgaGFuZyBkdXJpbmcgT2NjbHVzaW9uL1NETUEvVmFyaWEgcnVucy4KQ2xl
YXIgWE5BQ0tfV0FURVJNSyBpbiByZWcgU0RNQTBfVVRDTDFfV0FURVJNSyB0byBmaXggdGhpcyBp
c3N1ZS4KClNpZ25lZC1vZmYtYnk6IGNoZW4gZ29uZyA8Y3VycnkuZ29uZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5j
CmluZGV4IDYzYTM3OTIuLjQ1YmQ1MzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NkbWFfdjRfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFf
djRfMC5jCkBAIC0yNTQsNiArMjU0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdf
Z29sZGVuIGdvbGRlbl9zZXR0aW5nc19zZG1hXzRfM1tdID0gewogCVNPQzE1X1JFR19HT0xERU5f
VkFMVUUoU0RNQTAsIDAsIG1tU0RNQTBfUkxDMF9SQl9XUFRSX1BPTExfQ05UTCwgMHhmZmZmZmZm
NywgMHgwMDQwMzAwMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShTRE1BMCwgMCwgbW1TRE1B
MF9STEMxX1JCX1dQVFJfUE9MTF9DTlRMLCAweGZmZmZmZmY3LCAweDAwNDAzMDAwKSwKIAlTT0Mx
NV9SRUdfR09MREVOX1ZBTFVFKFNETUEwLCAwLCBtbVNETUEwX1VUQ0wxX1BBR0UsIDB4MDAwMDAz
ZmYsIDB4MDAwMDAzYzApLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoU0RNQTAsIDAsIG1tU0RN
QTBfVVRDTDFfV0FURVJNSywgMHhmYzAwMDAwMCwgMHgwMDAwMDAwMCkKIH07CiAKIHN0YXRpYyB1
MzIgc2RtYV92NF8wX2dldF9yZWdfb2Zmc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
