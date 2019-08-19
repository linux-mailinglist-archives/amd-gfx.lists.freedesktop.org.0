Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A395926E7
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5896A6E15B;
	Mon, 19 Aug 2019 14:35:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680046.outbound.protection.outlook.com [40.107.68.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B176E6E154
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gmz7bXNottvs0brtcpGDXpfERSbuJrPt9Z9HX1qCekpVNtMssXlW+yA3sHUvt5H3R7UbFfLQ4k7ChzyNFVWwYU+ll0zeHi4Xe2o/661ullZocXTzPAjae8R2nch5q8PJnb3vwvlbNvthEuucmYcLy3YpizdnXtY+4PoR7on3Aa7t7LErza69oHBMdHIyjtGkVdknpp1HUC9AbZt/UiYa0ZMQ3fkdlQbYG2aCeoBnroXmEcEu8sM8GA6Tag3t/j9tKHgGrnwe4aM4iXb7QagXWHKNnDDpPCuldJb2u4DVCWz126fqMLG3QOt0lDGXea/UyyqNfLPuVDuE/4PWjkF+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yrCFJh19URVPoTFuJxUJTOsnBY0alBM73Nwf1k2F9M=;
 b=QI3ELMXv60sxZ/ZeZl8zBwYW466L1CZFvtH6+bfNY/hukwaAsGJxcuDUYlCvGiBz+HMBtzF99MLO6ifnSDUe8nT/Jj0Q3mu9SGWddV19AOhC3qyZr2QmeaxfJK1i96i8GyNFEqfbnBE2jnJKIh2aPwhqxKn2ev64ybktPR+bDveGhv03bYFwMhKgeiDbyACEl2MQngra42eGm5VcEuJ9G5CCo4or0RcdLQ89CxaGs7wL57AWM66ErmJAI9hQYoaJV9PVhztgEzxqmp7pMyn8h1KHkquQptBD4ft8+nZ74dKDGpL0Z5scgYqkcn3oRH+77oGz9f6NhzIRTUS7vmSbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0003.namprd12.prod.outlook.com (2603:10b6:4:1::13) by
 DM6PR12MB2713.namprd12.prod.outlook.com (2603:10b6:5:49::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 14:35:48 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by DM5PR12CA0003.outlook.office365.com
 (2603:10b6:4:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:48 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:41 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/36] drm/amd/display: Implement voltage limitation stub
Date: Mon, 19 Aug 2019 10:34:48 -0400
Message-ID: <20190819143515.21653-10-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(7696005)(36756003)(6916009)(53936002)(336012)(2351001)(1076003)(50226002)(81156014)(70206006)(8676002)(53416004)(5660300002)(2906002)(8936002)(51416003)(186003)(14444005)(76176011)(70586007)(81166006)(4326008)(305945005)(356004)(47776003)(478600001)(316002)(16586007)(48376002)(86362001)(426003)(50466002)(126002)(476003)(2616005)(446003)(11346002)(486006)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2713; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeae93ed-4e43-461f-6f33-08d724b286e1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2713; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2713:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2713B6E228A59926732959B7F9A80@DM6PR12MB2713.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HZX4qYdBdmUsT0zYuSbr8v6BpL1I5gqDfI5O1fe7cmDbYyGWTS8P7rLSDUHQzRk/YCjPBoKeHClExK/jdmE5qBJ6nEAuqSUIjhYjWfOavdCicXY72lxp5rJhL/K3o7noIzeoRSSIll1IbBcpUdBmaqkW97bQiOnjbAWvkyavRLfrgoiGN5D/Y8eUhHFS5B1P7eZGC2iT3m+y5oZ5Ov/DM9kkUYZCh02M/wxyprRRLBuge465Askdx8D+vtaTqfaA6ZaGtwf6cFyrZm5Q+ZQffhN0U0W1BHVyXqOW4zp7+VwmJCSQY6MjPgL7Vn8asUvzETOMDFxwGb0fPa9nQPibjDOMznG1am77bTMVSwInMHFDGzqw0HK7PASbtsJDatvcMPQgyJ5FDwtRZH3uKSkpCb9hIg9byXvdt2WlXWYUuME=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:48.0342 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeae93ed-4e43-461f-6f33-08d724b286e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yrCFJh19URVPoTFuJxUJTOsnBY0alBM73Nwf1k2F9M=;
 b=PixW638Z9aVX98zbznUzfccYdZTivr9Zper2CukDLnyLwCy/LwkktajP3BwWliSRsF9CUmqWD/wuR7FwYr52Nw9KBnoOquUGj8Kv/1o0TXTqm1jNVHYdsIVmhf4asblep3MRAM4RW3QKrhWbvq7zlU2eyF3nfv2+FmwtLv4ipfM=
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
Cc: Joseph Gravenor <joseph.gravenor@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zZXBoIEdyYXZlbm9yIDxqb3NlcGguZ3JhdmVub3JAYW1kLmNvbT4KCmFkZCBuZXcg
ZnVuY3Rpb24gdG8gZ2V0IHRoZSB2b2x0YWdlIGF0IHRoZSBlbmQgb2YKZGNuX3ZhbGlkYXRlX2Jh
bmR3aWR0aCwgdG8gY2hlY2sgYWdhaW5zdCB0aGUKaGlnaGVzdCB2b2x0YWdlIHdlIGFsbG93LgoK
Q3JlYXRlZCBhIHN0dWIgdG8gYWxsb3cgZm9yIG9wdGltaXphdGlvbnMKClNpZ25lZC1vZmYtYnk6
IEpvc2VwaCBHcmF2ZW5vciA8am9zZXBoLmdyYXZlbm9yQGFtZC5jb20+ClJldmlld2VkLWJ5OiBF
cmljIFlhbmcgPGVyaWMueWFuZzJAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hh
IDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpBY2tlZC1ieTogU3VuIHBlbmcgTGkgPFN1bnBl
bmcuTGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3Mv
ZGNuX2NhbGNzLmMgfCAxMCArKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NhbGNzL2Rjbl9jYWxjcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NhbGNzL2Rjbl9jYWxjcy5jCmluZGV4IDA2MWM2ZTNhMzA4OC4uMzgzZjRmOGRiOGY0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNuX2NhbGNzLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rjbl9jYWxjcy5jCkBA
IC03MDUsNiArNzA1LDEzIEBAIHN0YXRpYyB2b2lkIGhhY2tfYm91bmRpbmdfYm94KHN0cnVjdCBk
Y25fYndfaW50ZXJuYWxfdmFycyAqdiwKIAkJaGFja19mb3JjZV9waXBlX3NwbGl0KHYsIGNvbnRl
eHQtPnN0cmVhbXNbMF0tPnRpbWluZy5waXhfY2xrXzEwMGh6KTsKIH0KIAorCit1bnNpZ25lZCBp
bnQgZ2V0X2hpZ2hlc3RfYWxsb3dlZF92b2x0YWdlX2xldmVsKHVpbnQzMl90IGh3X2ludGVybmFs
X3JldikKK3sKKwkvKiB3ZSBhcmUgb2sgd2l0aCBhbGwgbGV2ZWxzICovCisJcmV0dXJuIDQ7Cit9
CisKIGJvb2wgZGNuX3ZhbGlkYXRlX2JhbmR3aWR0aCgKIAkJc3RydWN0IGRjICpkYywKIAkJc3Ry
dWN0IGRjX3N0YXRlICpjb250ZXh0LApAQCAtNzMyLDYgKzczOSw3IEBAIGJvb2wgZGNuX3ZhbGlk
YXRlX2JhbmR3aWR0aCgKIAogCW1lbXNldCh2LCAwLCBzaXplb2YoKnYpKTsKIAlrZXJuZWxfZnB1
X2JlZ2luKCk7CisKIAl2LT5zcl9leGl0X3RpbWUgPSBkYy0+ZGNuX3NvYy0+c3JfZXhpdF90aW1l
OwogCXYtPnNyX2VudGVyX3BsdXNfZXhpdF90aW1lID0gZGMtPmRjbl9zb2MtPnNyX2VudGVyX3Bs
dXNfZXhpdF90aW1lOwogCXYtPnVyZ2VudF9sYXRlbmN5ID0gZGMtPmRjbl9zb2MtPnVyZ2VudF9s
YXRlbmN5OwpAQCAtMTI2OCw3ICsxMjc2LDcgQEAgYm9vbCBkY25fdmFsaWRhdGVfYmFuZHdpZHRo
KAogCVBFUkZPUk1BTkNFX1RSQUNFX0VORCgpOwogCUJXX1ZBTF9UUkFDRV9GSU5JU0goKTsKIAot
CWlmIChid19saW1pdF9wYXNzICYmIHYtPnZvbHRhZ2VfbGV2ZWwgIT0gNSkKKwlpZiAoYndfbGlt
aXRfcGFzcyAmJiB2LT52b2x0YWdlX2xldmVsIDw9IGdldF9oaWdoZXN0X2FsbG93ZWRfdm9sdGFn
ZV9sZXZlbChkYy0+Y3R4LT5hc2ljX2lkLmh3X2ludGVybmFsX3JldikpCiAJCXJldHVybiB0cnVl
OwogCWVsc2UKIAkJcmV0dXJuIGZhbHNlOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
