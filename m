Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5344E34EE9
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 19:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EC989B0D;
	Tue,  4 Jun 2019 17:32:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F3189B0D
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 17:32:47 +0000 (UTC)
Received: from BN8PR12CA0017.namprd12.prod.outlook.com (2603:10b6:408:60::30)
 by CY4PR12MB1272.namprd12.prod.outlook.com (2603:10b6:903:3e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Tue, 4 Jun
 2019 17:32:45 +0000
Received: from DM3NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by BN8PR12CA0017.outlook.office365.com
 (2603:10b6:408:60::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.17 via Frontend
 Transport; Tue, 4 Jun 2019 17:32:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT046.mail.protection.outlook.com (10.152.83.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Tue, 4 Jun 2019 17:32:44 +0000
Received: from yttao-code-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 4 Jun 2019 12:32:43 -0500
From: Yintian Tao <yttao@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/gfx9: ensure mqd data take effect when gpu reset
Date: Wed, 5 Jun 2019 01:32:38 +0800
Message-ID: <1559669558-3663-1-git-send-email-yttao@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(396003)(39860400002)(346002)(136003)(2980300002)(428003)(199004)(189003)(476003)(68736007)(486006)(426003)(2616005)(186003)(4326008)(53416004)(70206006)(70586007)(51416003)(316002)(305945005)(126002)(16586007)(50226002)(53936002)(2351001)(7696005)(336012)(36756003)(26005)(77096007)(5660300002)(81166006)(81156014)(2906002)(356004)(6666004)(48376002)(72206003)(50466002)(47776003)(54906003)(8936002)(6916009)(14444005)(478600001)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b5000e0-64b5-4df9-290a-08d6e912a77e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB127237B26C7C70B12A9E0608E5150@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-Forefront-PRVS: 0058ABBBC7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hla5KMQIlSsEOe8D1O+RCMYd1g875sgvGN4eUAJP6KF4DVkftKVotXw59T0e8WSBnzle40VaIj+tXz1FAH7KYynJ20Rx1x+uZYEK9pr19B2xBixtZVsKI4grGhpq8OE8/NC5W3vaF1nqq4B+Qp/3yIJ6RSLDVDY373XyPjetb0HQckZLF9yVFnvBs9gxdM+zzOYtzzY/19ANaPja+pbnOv1ZIg1cLJxHBc/DUFGCxmoE1cKuiGLTbLjgD/DkaqbHLwwc6EVhrE09tHvxWH2+4/8oDTD0BaXE1oO5bEUKFsn2xkZl67S/ZhxEyd1s72oteblaT2SYtMnBdW9nCkdHKnzY/dSGMULnCfguca8priAu6RD62bfGJKlJvCH4viQx1IkX2pm6hyKUm0xC1q2hrpl3bCe9uHaQdnCkf28N3IA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2019 17:32:44.7289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5000e0-64b5-4df9-290a-08d6e912a77e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+exTAejnzALYV5FwYvpqZDa+QIgIDetZc3ptfhEKoY=;
 b=fhR7P5JCKOSfhUPTzIqvGmVZRSIiNemuoHkgnmc+4v12O5eFyve8zdy3lkN+J7ko7KZEHK4Tdf/PrwRP1S8KW+RgGEw6aTMh0ULx3l5SZLHV4BNWNZMIsxW1KsaFSVUWzbAoz0XlvlOp8J6O9gyl2dcUOFlUWe0uXfZeZHhjySQ=
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
Cc: Monk Liu <Monk.Liu@amd.com>, Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2Ugc2hvdWxkIGVuc3VyZSBtcWQgZGF0YSB0YWtlIGVmZmVjdCB3aGVuIGdwdSByZXNldC4KT3Ro
ZXJ3aXNlLCBpdCB3aWxsIHJhc2llIHJpbmcgaWIgdGVzdHMgZmFpbHVyZS4KClNpZ25lZC1vZmYt
Ynk6IFlpbnRpYW4gVGFvIDx5dHRhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBNb25rIExpdSA8
TW9uay5MaXVAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKaW5kZXggMmU5Y2FjMS4uYmVhNjQxZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCkBAIC0zMTIzLDYgKzMxMjMsOCBAQCBzdGF0aWMg
aW50IGdmeF92OV8wX2tpcV9pbml0X3F1ZXVlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAkJ
aWYgKGFkZXYtPmdmeC5tZWMubXFkX2JhY2t1cFttcWRfaWR4XSkKIAkJCW1lbWNweShtcWQsIGFk
ZXYtPmdmeC5tZWMubXFkX2JhY2t1cFttcWRfaWR4XSwgc2l6ZW9mKHN0cnVjdCB2OV9tcWRfYWxs
b2NhdGlvbikpOwogCisJCS8qIGNsZWFuIGdwdSB0YWJsZSBzdGF0dXMgKi8KKwkJYW1kZ3B1X2dt
Y19mbHVzaF9ncHVfdGxiKGFkZXYsIDAsIDApOwogCQkvKiByZXNldCByaW5nIGJ1ZmZlciAqLwog
CQlyaW5nLT53cHRyID0gMDsKIAkJYW1kZ3B1X3JpbmdfY2xlYXJfcmluZyhyaW5nKTsKQEAgLTMx
NDcsNiArMzE0OSw4IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfa2lxX2luaXRfcXVldWUoc3RydWN0
IGFtZGdwdV9yaW5nICpyaW5nKQogCQkJbWVtY3B5KGFkZXYtPmdmeC5tZWMubXFkX2JhY2t1cFtt
cWRfaWR4XSwgbXFkLCBzaXplb2Yoc3RydWN0IHY5X21xZF9hbGxvY2F0aW9uKSk7CiAJfQogCisJ
LyogbWFrZSBzdXJlIG1xZCBkYXRhIGxhbmRlZCBpbnRvIFZSQU0gKi8KKwlhbWRncHVfYXNpY19m
bHVzaF9oZHAoYWRldiwgTlVMTCk7CiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
