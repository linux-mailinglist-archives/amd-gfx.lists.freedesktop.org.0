Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A254A8769C
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 11:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E40D6ED5E;
	Fri,  9 Aug 2019 09:51:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790083.outbound.protection.outlook.com [40.107.79.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505286ED5E
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 09:51:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKyZRJS9AuyFCXwBNmU9vNXyreAZzVMigBCnjV7vXGmkuBMV4RDZkDcsQdOg/jOxECpsEEYCp6/K6vyRB0a6uPvfmjlzk9e7thPGgVvAKc3gR6Ci5qbUcvZ5T+4CXe97iceQz7atr8+PZls9C8+r//TWfpOYaD6SZIKA75FBL32i0F9nwrU+U8mLqRFaCuteycI3kiId9m6AHUaEqbBQn1/0oKFt9Qg/V8SayvXKUj1XbM/GL83KADexhUVHNeJDIuPk1/ZyCFr16nVaUoFHPIUzo1zZUmjV4E9MKf3NEXxx5iuCyUjG+7pIy2hzK+zA+GICrpfr5wGSxPYuqbMhQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNGZ6XYJzyzhkbRxNk1VzJA/qWbK3kWNWynERafVd9o=;
 b=BM6a1exGfGCvlVRuo0WKO8cJSQRy+loeOGjdsOqYTNZf1iNjUpbCEXH7MeEGjjCEmMtMSQKxRz3D+wKSWk1K6GTeNOwq4d/rF7i5WfxW3SS89os5zZYnvZ6MTs3bgBOawoLKeK+uaOzozLHvy7OlDcYB5sqw22w9qfcQU/1t4fXFosLIcrp+5cWepeZ6ga5LdEEDdczb/hDyTxaxBaS64Eq9kc9n7/SM8RHrLMBSaWRRSGWYdblCo56OQMNX8cbWs5Nk/z2L6PZDoMeGCC7WbPA81B5+/ilcQDCWHUBqIw3L388cxKatlNj1LNAO2ZwLP/RUPgAxJ70e0Z3i7xPbiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0096.namprd12.prod.outlook.com (2603:10b6:802:21::31)
 by DM5PR12MB1275.namprd12.prod.outlook.com (2603:10b6:3:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.20; Fri, 9 Aug
 2019 09:50:58 +0000
Received: from DM3NAM03FT065.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by SN1PR12CA0096.outlook.office365.com
 (2603:10b6:802:21::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Fri, 9 Aug 2019 09:50:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT065.mail.protection.outlook.com (10.152.82.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 09:50:57 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 9 Aug 2019
 04:50:56 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <hawking.zhang@amd.com>, <Chris.Freehill@amd.com>, <Kent.Russell@amd.com>
Subject: [PATCH] drm/amdgpu: remove ras block's feature status info in sysfs
Date: Fri, 9 Aug 2019 17:50:47 +0800
Message-ID: <20190809095047.12372-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(189003)(199004)(50466002)(486006)(336012)(476003)(70206006)(6636002)(6666004)(356004)(126002)(53416004)(48376002)(70586007)(426003)(8936002)(50226002)(2616005)(1076003)(2906002)(4326008)(8676002)(305945005)(26005)(81156014)(316002)(5660300002)(110136005)(36756003)(81166006)(47776003)(53936002)(7696005)(51416003)(2201001)(478600001)(186003)(86362001)(16586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1275; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de48923a-5332-4c02-3888-08d71caf1434
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1275; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1275:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1275E138C94965EF510543F7B0D60@DM5PR12MB1275.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bX3FlFMj5PszX6INKifh1PneY/0rngBQqvD47c0ydjAk5HxaHVVjYr9SYDeThAZaxVhVTbkhv10Eh/ze+B77o9gvNnsVS3EyCe2D3UvrTcrontD9X4SI9AWNftHDrxyXiBWyqB64xIzPlWgjoSRmsjj3rdRdctYOI9fdjqLP5J3EvlysIdtYFt1b33aFW613IVtRtlVg9TLrSchIvA4SSa4KDhga36VfWitAZU7oNSNwKl1m2EDa4t94DdKBP1dBFVIAmI7LMBoQ4RemopcUGz7A5l9Ay1DpJncuXChtRld3pLFPNV6picxzvlQ+lfcdalQOWVutAtUg4fGA+zGseLIlVQclijpztFJTCi4H0hFyVTP6sHdZDVp+lxpL8umsvs1x0RuW2oCnSbuW/1oImYKMa7TQnBq5lzoTMhLt6ic=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 09:50:57.8694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de48923a-5332-4c02-3888-08d71caf1434
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1275
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNGZ6XYJzyzhkbRxNk1VzJA/qWbK3kWNWynERafVd9o=;
 b=nQG2eJA59KLErDTuBg8nvpNsCZ1rgLAaHqEUKgCtcFsdaPq+2u7yR3duD8aHp+WMFO79e1nj22M+4H54y/gbtyJ1s5Q6r6OO6UGuk1vGiU39lySg71VCoXATck0t9pfsoJY4Ss4BjxJa/9LJcZe2KhKFJkH5QQz8NTQiy15oLvc=
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

ZmVhdHVyZSBtYXNrIGluZm8gaXMgZW5vdWdoIGZvciByb2NtIHRvb2wsCiJjYXQgL3N5cy9jbGFz
cy9kcm0vY2FyZDAvZGV2aWNlL3Jhcy9mZWF0dXJlcyIgd2lsbCBnZXQgdGhlCmluZm8gbGlrZSB0
aGlzOgoKZmVhdHVyZSBtYXNrOiAweDNmZmIKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8u
emhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMgfCAxOSArLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YwppbmRleCBiZTU5MTAyNTI2YTEuLjUwYzEzYjAyZDIzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtNzkxLDI1ICs3OTEsOCBAQCBzdGF0aWMgc3NpemVfdCBh
bWRncHVfcmFzX3N5c2ZzX2ZlYXR1cmVzX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LAogewogCXN0
cnVjdCBhbWRncHVfcmFzICpjb24gPQogCQljb250YWluZXJfb2YoYXR0ciwgc3RydWN0IGFtZGdw
dV9yYXMsIGZlYXR1cmVzX2F0dHIpOwotCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7Ci0Jc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkZGV2LT5kZXZf
cHJpdmF0ZTsKLQlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiBoZWFkOwotCWludCByYXNfYmxvY2tfY291
bnQgPSBBTURHUFVfUkFTX0JMT0NLX0NPVU5UOwotCWludCBpLCBlbmFibGVkOwotCXNzaXplX3Qg
czsKLQotCXMgPSBzY25wcmludGYoYnVmLCBQQUdFX1NJWkUsICJmZWF0dXJlIG1hc2s6IDB4JXhc
biIsIGNvbi0+ZmVhdHVyZXMpOwotCi0JZm9yIChpID0gMDsgaSA8IHJhc19ibG9ja19jb3VudDsg
aSsrKSB7Ci0JCWhlYWQuYmxvY2sgPSBpOwotCQllbmFibGVkID0gYW1kZ3B1X3Jhc19pc19mZWF0
dXJlX2VuYWJsZWQoYWRldiwgJmhlYWQpOwotCi0JCXMgKz0gc2NucHJpbnRmKCZidWZbc10sIFBB
R0VfU0laRSAtIHMsCi0JCQkJIiVzIHJhcyBmZWF0dXJlIG1hc2s6ICVzXG4iLAotCQkJCXJhc19i
bG9ja19zdHIoaSksIGVuYWJsZWQ/Im9uIjoib2ZmIik7Ci0JfQogCi0JcmV0dXJuIHM7CisJcmV0
dXJuIHNjbnByaW50ZihidWYsIFBBR0VfU0laRSwgImZlYXR1cmUgbWFzazogMHgleFxuIiwgY29u
LT5mZWF0dXJlcyk7CiB9CiAKIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19zeXNmc19jcmVhdGVfZmVh
dHVyZV9ub2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
