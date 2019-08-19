Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8E6926F0
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DF96E165;
	Mon, 19 Aug 2019 14:35:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720040.outbound.protection.outlook.com [40.107.72.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEBE6E15D
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leRnewu0MMXUbUSdmKF0OZm/oL9j1aVjwYPViJEbsBqLbEJhYvuMznEMLyRnIl+WoW2ilcKaxcFtYHqtHZQeC+9OXHFCaqc/jw/LndnOMSz3LjNBguj6LlFTTzdCCCUEghs0D+uTJJs7qxO/p8mMC9etKJ6CaMnbpuL8zwbPn49zEen1WFHJvnbIMZaSU3hq2xCtu3U6TmWIwAthU5Bda63GHdr/dDEZUMtImoeIGvEKz1W7GYmGm78+2mMnJI9n9I6kvOPYD4Ct6krGcoNRCAgBtZKoBzvQTZTf0fFJRaXhVLLHMajF1ySANp+DHy3mJcdspBejech8/hIss8mdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSiqWdiWK7oT+BDTR/Tsi54rHBV1N9EMxyQ7O9xwx38=;
 b=CIFODqSjUKd6xijB3VYrAAn/dLJotnbhXglGHzf3Hv6fQBIUnxWK0hm42HQHm1cQRzTGBVopGhky2GMfZh0gOlJ83DjocPfVZWdF3BOFzmCCDGVb4XWVYXRpbgkzFiJUcFYrrUSffVzfqa3emG3C0eMs8xofoS2wi/neqb9Xg6SUTjPYYjhm1orVBZFZ5a6FUxnhRT928olQKni+MDd93vDPf570jLtr2T6IXOGCd6D1HcgLL/vwQLCUYaYcDtmqJmOwhM7xLQhbRZNozI1bvBb01LxRV48K7+kkgbw20Nq8UxHjEqo8uly8XMJTh8vPU2mq2XhFkzcSFMN2vZqnrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0032.namprd12.prod.outlook.com (2603:10b6:405:70::18)
 by BN6PR12MB1266.namprd12.prod.outlook.com (2603:10b6:404:14::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Mon, 19 Aug
 2019 14:35:52 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN6PR12CA0032.outlook.office365.com
 (2603:10b6:405:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:51 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:43 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/36] drm/amd/display: cleaned up coding error in init_hw
Date: Mon, 19 Aug 2019 10:34:52 -0400
Message-ID: <20190819143515.21653-14-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(428003)(199004)(189003)(50226002)(26005)(47776003)(36756003)(476003)(2351001)(53936002)(53416004)(478600001)(4326008)(50466002)(1076003)(8676002)(81166006)(81156014)(316002)(16586007)(305945005)(8936002)(48376002)(51416003)(76176011)(7696005)(486006)(6916009)(86362001)(6666004)(426003)(446003)(336012)(5660300002)(2616005)(186003)(70586007)(70206006)(126002)(2906002)(356004)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1266; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fa4bd1b-0572-49bb-b596-08d724b2890d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1266; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1266:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1266B50B9BCA72458E3C147EF9A80@BN6PR12MB1266.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6rciGZmRgXH0B80s/g17cEKcD8iJJaPja6fHX+12zlQMnzpQZ/mL057xX6GC8+1DfXtvpYp1rLRtYI1eOXpu2abg9nvJNi3aeC3S1SRDVgH0zHbTj6pY2fdu7QyZvqZW+jtlqxdcrDQh0VdJjqZ8AX0FSMSw9pDKMNLkTNd2eRcfm6yURu7b9j659M1I0TOEYcoK0e1H7vBDj4jWoDBo6T3C0ktehzhGFWs1YCpFI0SjvfzuhoCS8PQ9SZi0V6BEQ0u1WFsOTYX+T67cOXT54mab/0jtTrPpxFaTq7iui2P+Flz0QQ1bb/n3KP+4wAhpxhsRowQYcLZtGpcXkGZsO5G2fpCYpHLantlU+MHgDr1KvMemcAZdBKlRbADfJn0MYeGpwe7MoF9sg9l0/FBSxJUVG5mtNpI7nY2thwsKa0M=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:51.6678 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa4bd1b-0572-49bb-b596-08d724b2890d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSiqWdiWK7oT+BDTR/Tsi54rHBV1N9EMxyQ7O9xwx38=;
 b=PWZcMObQlo8ajks/xj/Ce+AFGrKQqn0jrpQa01ioGqSZY9Ebe7FF3sKcJfuiPojw5SD3NgW7DP4kh03sfqder9FXareVTYOSSfkXouOOap0UCXQRqRdlq27gek4zZlLcJI9Op0PrsRQwR/fhdFv/dTWFYt6a6LOV7iP9pKJcRXo=
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
Cc: Martin Leung <martin.leung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFydGluIExldW5nIDxtYXJ0aW4ubGV1bmdAYW1kLmNvbT4KClt3aHldCmR1cmluZyBh
IHJlZmFjdG9yIGEgcmVkdW5kYW50IGNvZGUgdGhhdCBoYXMgdW5rbm93biBiZWhhdmlvdXIgd2Fz
IGFkZGVkLgoKW2hvd10KcmVtb3ZlZCBvbGQgYmFkIGNvZGUKCkZpeGVzOiAgN2IwYjZlZTk4MmFi
MDE4ZWNjZTcwZjY2MWU2NzZkMDU5YmZlODI3MAoJZHJtL2FtZC9kaXNwbGF5OiBNYWtlIGluaXRf
aHcgYW5kIGluaXRfcGlwZXMgZ2VuZXJpYyBmb3Igc2VhbWxlc3MgYm9vdAoKU2lnbmVkLW9mZi1i
eTogTWFydGluIExldW5nIDxtYXJ0aW4ubGV1bmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhv
bnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEg
PEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMgfCAxMSAtLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwppbmRleCAwZTU1ZGYzZGI1
M2MuLmQ5Y2UwNmIxZDljMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwpAQCAtMTI2NywxOSArMTI2Nyw4
IEBAIHN0YXRpYyB2b2lkIGRjbjEwX2luaXRfaHcoc3RydWN0IGRjICpkYykKIAkgKi8KIAlpZiAo
ZGNiLT5mdW5jcy0+aXNfYWNjZWxlcmF0ZWRfbW9kZShkY2IpIHx8IGRjLT5jb25maWcucG93ZXJf
ZG93bl9kaXNwbGF5X29uX2Jvb3QpIHsKIAkJZGMtPmh3c3MuaW5pdF9waXBlcyhkYywgZGMtPmN1
cnJlbnRfc3RhdGUpOwotCQlmb3IgKGkgPSAwOyBpIDwgcmVzX3Bvb2wtPnBpcGVfY291bnQ7IGkr
KykgewotCQkJc3RydWN0IGh1YnAgKmh1YnAgPSByZXNfcG9vbC0+aHVicHNbaV07Ci0JCQlzdHJ1
Y3QgZHBwICpkcHAgPSByZXNfcG9vbC0+ZHBwc1tpXTsKLQotCQkJaHVicC0+ZnVuY3MtPmh1YnBf
aW5pdChodWJwKTsKLQkJCXJlc19wb29sLT5vcHBzW2ldLT5tcGNfdHJlZV9wYXJhbXMub3BwX2lk
ID0gcmVzX3Bvb2wtPm9wcHNbaV0tPmluc3Q7Ci0JCQlkYy0+aHdzcy5wbGFuZV9hdG9taWNfcG93
ZXJfZG93bihkYywgZHBwLCBodWJwKTsKLQkJfQotCi0JCWFwcGx5X0RFR1ZJRENOMTBfMjUzX3dh
KGRjKTsKIAl9CiAKLQogCWZvciAoaSA9IDA7IGkgPCByZXNfcG9vbC0+YXVkaW9fY291bnQ7IGkr
KykgewogCQlzdHJ1Y3QgYXVkaW8gKmF1ZGlvID0gcmVzX3Bvb2wtPmF1ZGlvc1tpXTsKIAotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
