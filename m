Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C0B1018C
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF18789264;
	Tue, 30 Apr 2019 21:10:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690048.outbound.protection.outlook.com [40.107.69.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95094892B7
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:13 +0000 (UTC)
Received: from DM3PR12CA0107.namprd12.prod.outlook.com (2603:10b6:0:55::27) by
 SN1PR12MB2383.namprd12.prod.outlook.com (2603:10b6:802:25::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Tue, 30 Apr 2019 21:10:12 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM3PR12CA0107.outlook.office365.com
 (2603:10b6:0:55::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:11 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:55 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/20] drm/amd/display: fix acquire_first_split_pipe function
Date: Tue, 30 Apr 2019 17:09:32 -0400
Message-ID: <20190430210938.32335-35-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(136003)(376002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(126002)(6666004)(356004)(1076003)(86362001)(2906002)(2351001)(305945005)(53416004)(72206003)(6916009)(47776003)(50226002)(8676002)(8936002)(70586007)(70206006)(81166006)(81156014)(77096007)(186003)(26005)(5660300002)(426003)(50466002)(336012)(48376002)(486006)(51416003)(7696005)(11346002)(446003)(76176011)(478600001)(4326008)(476003)(16586007)(53936002)(36756003)(68736007)(2616005)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2383; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6b134cf-3361-4e03-6449-08d6cdb03ba8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:SN1PR12MB2383; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB2383:
X-Microsoft-Antispam-PRVS: <SN1PR12MB23839BA58C3B3CD2E993365BF93A0@SN1PR12MB2383.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 79Sbbv2LpLa8rNwGlvMzfsXlZDWsLQo/Bmij47xbcXx+C8C1gWZy5hUPmPeryNntB3z/sJV7IEBGt/5/K/fPnRg2O5wXIUFOM/1heQzubT4oP9bR5fPQ0uUeEmVFSSILSCoPYFkHcZxOQ4bNAqxi0LjRrjMz1NL3br7RAEPXM38vM3fP+x7UoAg9cBhLfoJZwROdNvRQSfdYrmIcJicopI0aFf17zO6t/Mz3AW7j22t2u8Qt07+NPKtEKSZ9PZ7C0o7Waq4qbiHtSJoRyiLQL6w9Ye4K6TeXP3+YRGh3w80iwFJ20Ri6ii+FVOLpwkHm7bgBOYqzzqDj5EP73AKmX72xGl317odMysf5xinjKFWuAoODMN96E1tYKRQ9Ol9w12TWUKsQKnSUUHmtkBEajBXBDvU0g1xvGD6JAo0N174=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:11.6421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b134cf-3361-4e03-6449-08d6cdb03ba8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2383
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADz/hIJM7QLHBKF5GKRn1CqntGY2l3cJ8yyX5evassE=;
 b=DAV++g5tmqfaQ/zYGyfpokYl8ujx0AdtO8HQYPG6mTULPpcvYXUBUSsYMz0KAYK6DrYlX4yrWguEdHZRmQ0SIkS+MlNDFlXifc0SJ3ogodgZRZLoZnWKmEbjHOfyymz/RiEMJswrZq/sUMA+bHbloXjuoE6Kca/GRiOHoONIydU=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClRo
aXMgZnVuY3Rpb24gbmVlZHMgdG8gcmUtY2FsY3VsYXRlIHRoZSBzY2FsaW5nIG9uIHRoZSBwaXBl
CnRoYXQgbG9zZXMgaXQncyBoYWxmLgoKQ2hhbmdlLUlkOiBJNDQ4NTgzZWIxM2YxN2Y4NjgzNzdh
YWIyYjFhNWQ2OGJlYjQzOTg5ZgpTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERt
eXRyby5MYWt0eXVzaGtpbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogRXJpYyBCZXJuc3RlaW4gPEVy
aWMuQmVybnN0ZWluQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2Fu
cHJlZXQgTGFraGFAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX3Jlc291cmNlLmMgfCAzOSArKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKaW5kZXggMjA5NjYzMjU4NTJmLi40
N2I5OTQ1OGQzMTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfcmVzb3VyY2UuYwpAQCAtMTE4NCwyNCArMTE4NCwyNyBAQCBzdGF0aWMgaW50IGFjcXVp
cmVfZmlyc3Rfc3BsaXRfcGlwZSgKIAlpbnQgaTsKIAogCWZvciAoaSA9IDA7IGkgPCBwb29sLT5w
aXBlX2NvdW50OyBpKyspIHsKLQkJc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCA9ICZyZXNfY3R4
LT5waXBlX2N0eFtpXTsKLQotCQlpZiAocGlwZV9jdHgtPnRvcF9waXBlICYmCi0JCQkJcGlwZV9j
dHgtPnRvcF9waXBlLT5wbGFuZV9zdGF0ZSA9PSBwaXBlX2N0eC0+cGxhbmVfc3RhdGUpIHsKLQkJ
CXBpcGVfY3R4LT50b3BfcGlwZS0+Ym90dG9tX3BpcGUgPSBwaXBlX2N0eC0+Ym90dG9tX3BpcGU7
Ci0JCQlpZiAocGlwZV9jdHgtPmJvdHRvbV9waXBlKQotCQkJCXBpcGVfY3R4LT5ib3R0b21fcGlw
ZS0+dG9wX3BpcGUgPSBwaXBlX2N0eC0+dG9wX3BpcGU7Ci0KLQkJCW1lbXNldChwaXBlX2N0eCwg
MCwgc2l6ZW9mKCpwaXBlX2N0eCkpOwotCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMudGcgPSBwb29s
LT50aW1pbmdfZ2VuZXJhdG9yc1tpXTsKLQkJCXBpcGVfY3R4LT5wbGFuZV9yZXMuaHVicCA9IHBv
b2wtPmh1YnBzW2ldOwotCQkJcGlwZV9jdHgtPnBsYW5lX3Jlcy5pcHAgPSBwb29sLT5pcHBzW2ld
OwotCQkJcGlwZV9jdHgtPnBsYW5lX3Jlcy5kcHAgPSBwb29sLT5kcHBzW2ldOwotCQkJcGlwZV9j
dHgtPnN0cmVhbV9yZXMub3BwID0gcG9vbC0+b3Bwc1tpXTsKLQkJCXBpcGVfY3R4LT5wbGFuZV9y
ZXMubXBjY19pbnN0ID0gcG9vbC0+ZHBwc1tpXS0+aW5zdDsKLQkJCXBpcGVfY3R4LT5waXBlX2lk
eCA9IGk7Ci0KLQkJCXBpcGVfY3R4LT5zdHJlYW0gPSBzdHJlYW07CisJCXN0cnVjdCBwaXBlX2N0
eCAqc3BsaXRfcGlwZSA9ICZyZXNfY3R4LT5waXBlX2N0eFtpXTsKKworCQlpZiAoc3BsaXRfcGlw
ZS0+dG9wX3BpcGUgJiYgIWRjX3Jlc19pc19vZG1faGVhZF9waXBlKHNwbGl0X3BpcGUpICYmCisJ
CQkJc3BsaXRfcGlwZS0+dG9wX3BpcGUtPnBsYW5lX3N0YXRlID09IHNwbGl0X3BpcGUtPnBsYW5l
X3N0YXRlKSB7CisJCQlzcGxpdF9waXBlLT50b3BfcGlwZS0+Ym90dG9tX3BpcGUgPSBzcGxpdF9w
aXBlLT5ib3R0b21fcGlwZTsKKwkJCWlmIChzcGxpdF9waXBlLT5ib3R0b21fcGlwZSkKKwkJCQlz
cGxpdF9waXBlLT5ib3R0b21fcGlwZS0+dG9wX3BpcGUgPSBzcGxpdF9waXBlLT50b3BfcGlwZTsK
KworCQkJaWYgKHNwbGl0X3BpcGUtPnRvcF9waXBlLT5wbGFuZV9zdGF0ZSkKKwkJCQlyZXNvdXJj
ZV9idWlsZF9zY2FsaW5nX3BhcmFtcyhzcGxpdF9waXBlLT50b3BfcGlwZSk7CisKKwkJCW1lbXNl
dChzcGxpdF9waXBlLCAwLCBzaXplb2YoKnNwbGl0X3BpcGUpKTsKKwkJCXNwbGl0X3BpcGUtPnN0
cmVhbV9yZXMudGcgPSBwb29sLT50aW1pbmdfZ2VuZXJhdG9yc1tpXTsKKwkJCXNwbGl0X3BpcGUt
PnBsYW5lX3Jlcy5odWJwID0gcG9vbC0+aHVicHNbaV07CisJCQlzcGxpdF9waXBlLT5wbGFuZV9y
ZXMuaXBwID0gcG9vbC0+aXBwc1tpXTsKKwkJCXNwbGl0X3BpcGUtPnBsYW5lX3Jlcy5kcHAgPSBw
b29sLT5kcHBzW2ldOworCQkJc3BsaXRfcGlwZS0+c3RyZWFtX3Jlcy5vcHAgPSBwb29sLT5vcHBz
W2ldOworCQkJc3BsaXRfcGlwZS0+cGxhbmVfcmVzLm1wY2NfaW5zdCA9IHBvb2wtPmRwcHNbaV0t
Pmluc3Q7CisJCQlzcGxpdF9waXBlLT5waXBlX2lkeCA9IGk7CisKKwkJCXNwbGl0X3BpcGUtPnN0
cmVhbSA9IHN0cmVhbTsKIAkJCXJldHVybiBpOwogCQl9CiAJfQotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
