Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F0C10173
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6E58921D;
	Tue, 30 Apr 2019 21:09:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690074.outbound.protection.outlook.com [40.107.69.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804A78921D
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:49 +0000 (UTC)
Received: from SN1PR12CA0073.namprd12.prod.outlook.com (2603:10b6:802:20::44)
 by MN2PR12MB3757.namprd12.prod.outlook.com (2603:10b6:208:163::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Tue, 30 Apr
 2019 21:09:47 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by SN1PR12CA0073.outlook.office365.com
 (2603:10b6:802:20::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:47 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:44 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/20] drm/amd/display: Add DRM color properties for primary
 planes
Date: Tue, 30 Apr 2019 17:09:01 -0400
Message-ID: <20190430210938.32335-4-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(346002)(376002)(396003)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(50226002)(68736007)(81166006)(81156014)(8936002)(53936002)(4326008)(305945005)(6916009)(8676002)(7696005)(70586007)(36756003)(51416003)(53416004)(70206006)(1076003)(2906002)(50466002)(2351001)(76176011)(5660300002)(356004)(6666004)(426003)(486006)(336012)(446003)(11346002)(126002)(86362001)(2616005)(77096007)(47776003)(186003)(72206003)(316002)(48376002)(478600001)(16586007)(26005)(476003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3757; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96546763-9d00-48b6-155f-08d6cdb02d15
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MN2PR12MB3757; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3757:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3757F8B8167D3FF80FA75296F93A0@MN2PR12MB3757.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: OgKT+QdCN0v6SWC9fkh9g/GR6PaLl8W6z8zAnAcLGWgusH4VSUMNy3UP3ppL8NRPqNYtzTh25QvXl83sjk3xlWwwTwrly8RD2ctuCDLkLz4KdLIE1oUIvfO0CdlVcoPqNXsVfhHu5cqbFsn3k2g+1N3RCTy/ExMM+U3wplOANq+CMz9lI4YdcfrilmYz52FyXYDnv0UhKbvy0MBFMKo/XiAItomjDs7+2WkOJezUReLB2ti9C3TSV8bWec5jzRWntBagw5+Hid5ak3R7XR0zB22EOS792q9AlguGCSvfGDO/kmiRIzZ5shgFF6qaH3jLsP+cB79sYMEpZYlvFsr7OVfrr1OcvRvmEkm7x3Q/FHSrviFnOHZXHztk2jCOHNsQBQfIDuP267NEAgsKgb8Q8PGGiEq4iycyKHrq/JVvv8E=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:47.1926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96546763-9d00-48b6-155f-08d6cdb02d15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3757
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XR4tm5BB1o+3+0MQbkGK+u+0pqbxRqwzckr6Necf70=;
 b=3ytmVCMkcqlmgCVVibi/14dBKNk1vqN3FLo4Cepo1U5G/SB6Ma1rKdCy5sbE6fVcW/+cQuJcg19fcSyD2VtSQho9XaRASxN0LbpH3wqh9IcoIRSIvQScmZvz+Z/FUAOCFK4o0OtMdTk2wjS0XggXjw/+6fRmIW/PMwJyXZaGthg=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KV2UgbmVlZCBEQydzIGNvbG9yIHNwYWNlIHRvIG1hdGNoIHRoZSBjb2xvciBlbmNvZGlu
ZyBhbmQgY29sb3Igc3BhY2UKc3BlY2lmaWVkIGJ5IHVzZXJzcGFjZSB0byBjb3JyZWN0bHkgcmVu
ZGVyIFlVViBzdXJmYWNlcy4KCltIb3ddCkFkZCB0aGUgRFJNIGNvbG9yIHByb3BlcnRpZXMgd2hl
biB0aGUgREMgcGxhbmUgc3VwcG9ydHMgTlYxMi4KCkNoYW5nZS1JZDogSWUzZWI5ODAwYTlhNzk1
NGQwNWY2OTFiMjc3ZTdjYTVhMjUxNjRkNWQKU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1
c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgpSZXZpZXdlZC1ieTogU3VuIHBlbmcg
TGkgPFN1bnBlbmcuTGlAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3
YW5wcmVldCBMYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggNmU5MjIwOTlmNjE2Li45YTFlZjNkZjcxN2UgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpA
QCAtNDI4MSw2ICs0MjgxLDE4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX3BsYW5lX2luaXQoc3Ry
dWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAogCQlkcm1fcGxhbmVfY3JlYXRlX2JsZW5k
X21vZGVfcHJvcGVydHkocGxhbmUsIGJsZW5kX2NhcHMpOwogCX0KIAorCWlmIChwbGFuZS0+dHlw
ZSA9PSBEUk1fUExBTkVfVFlQRV9QUklNQVJZICYmCisJICAgIHBsYW5lX2NhcCAmJiBwbGFuZV9j
YXAtPnN1cHBvcnRzX252MTIpIHsKKwkJLyogVGhpcyBvbmx5IGFmZmVjdHMgWVVWIGZvcm1hdHMu
ICovCisJCWRybV9wbGFuZV9jcmVhdGVfY29sb3JfcHJvcGVydGllcygKKwkJCXBsYW5lLAorCQkJ
QklUKERSTV9DT0xPUl9ZQ0JDUl9CVDYwMSkgfAorCQkJQklUKERSTV9DT0xPUl9ZQ0JDUl9CVDcw
OSksCisJCQlCSVQoRFJNX0NPTE9SX1lDQkNSX0xJTUlURURfUkFOR0UpIHwKKwkJCUJJVChEUk1f
Q09MT1JfWUNCQ1JfRlVMTF9SQU5HRSksCisJCQlEUk1fQ09MT1JfWUNCQ1JfQlQ3MDksIERSTV9D
T0xPUl9ZQ0JDUl9MSU1JVEVEX1JBTkdFKTsKKwl9CisKIAlkcm1fcGxhbmVfaGVscGVyX2FkZChw
bGFuZSwgJmRtX3BsYW5lX2hlbHBlcl9mdW5jcyk7CiAKIAkvKiBDcmVhdGUgKHJlc2V0KSB0aGUg
cGxhbmUgc3RhdGUgKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
