Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F7B9682F
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 19:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C6189FCC;
	Tue, 20 Aug 2019 17:59:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730076.outbound.protection.outlook.com [40.107.73.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4501C89F8E
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 17:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLw8941uxHXh6oI9Cy3++tKlXdkN3+Y2Or8D5o+Q/y9h2bxLfJVQ4XCsObkdIcDau0MBIgDg2KLUd23+rdF/+3dpzX8WQs+sgtBGzynmkMVTBgiXWFAOroUvvu6Yz8aeqdIVki8YE8Os6U0GbMaw+yer1gslCa0ZvA1jxQgqEYn6lqvP97QZYfUvtcmmQNWTy2UdjBAm9n5iCh2J717TMXHrNM/no0B1zIsc6x7uRsO4m0ye7oy807G2CdiNGb58o3yiaodad9ac54G+AKpaPf5DYSP62s5GoCMN9m6+mMurAq3Q+CvXzoV1MstCdZwsaCJPL4K5dOlhUHEwuFL51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCuHoDAHiZqA02TAl89mxiMkBzXBP0AqyqSHzbPoMz0=;
 b=M95YhSsOJtReX+/KMACaByLFtA7Eb9qyNEnZYtbO0yVjksVAkmbx+u+XIYpTFWNUFSrTEpFHB0D0xdl0VQxXYXngAqKzhDv6Dapl4gYOier6xnSlkw+IlWMj4ujw8CfdPSYpST03gD9kKnV2HgEdQMZeVt5774gWK0UNjK/bCLfrbGVeO1kT9KjF/+7tk5MhreV0r5iVXOkY4qFxSAqT4ljzNj0Cfp4s61fQgvLMabFPCXiXv1Nv05NBHWLDppxoDOxLQk7co8bWHp20RP5hSm0leT2fza8NWpXRROglgxMlUQRyn1m/vXdEE1BRUyVaFxxB7d3XWJRl9CpTVeriWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0004.namprd12.prod.outlook.com (2603:10b6:408:60::17)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:70::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Tue, 20 Aug
 2019 17:59:40 +0000
Received: from DM3NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by BN8PR12CA0004.outlook.office365.com
 (2603:10b6:408:60::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 17:59:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT061.mail.protection.outlook.com (10.152.83.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 17:59:40 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 20 Aug 2019
 12:59:39 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amd/display: Use connector list for finding DPRX CRC
 aux
Date: Tue, 20 Aug 2019 13:59:30 -0400
Message-ID: <20190820175932.7884-2-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820175932.7884-1-nicholas.kazlauskas@amd.com>
References: <20190820175932.7884-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(2980300002)(428003)(199004)(189003)(478600001)(2351001)(86362001)(76176011)(53936002)(44832011)(2906002)(4326008)(81156014)(26005)(186003)(305945005)(53416004)(426003)(47776003)(476003)(486006)(36756003)(446003)(11346002)(126002)(6916009)(8936002)(336012)(356004)(316002)(2616005)(6666004)(50466002)(70586007)(16586007)(8676002)(50226002)(70206006)(1076003)(5660300002)(7696005)(48376002)(51416003)(54906003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2718; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 543c18a2-72f8-42c0-13ce-08d725982c27
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:SN6PR12MB2718; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27189001EFA3F237BCCA37FFECAB0@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 9A5gLezGZNoGWAzAmZvG2KE7La3P3KvKbmx+Ax28U75jwYbwf3oRihL1DIFu0VlvMFuQ4DKgUIXnsf7i8YSRrTzoEQXikT0my0PU+DQUXD0bUxVOPdF346JY6p+pqzGlbllDqAgAmF1MBdEdjC0Lv6QJ+rNDDbfNdR9IF1JhAnopCYc4redfxHrB0vC8oMKYFBNYP3MiSKcaPwZMsiZTCI+ZQPt+HXSbJOatmJFAFo0Fh3mYhJc/un8rCJSIeacqHJ1aj1GORo5QM9IR8+dzq3BWx+k/QhxO1heBTnZMOK5HtvC76QKi8qk0OJjUtS5RCWMvo4iUvxxDMQsavrxuRv3CexidItXdQmnVuXRC7Sw5Y98Tia6GNq3f+1k2iOxEdniLrnqhup3eugcN0mfw6KZCmRIK6DP6W7ULRw3nnmE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 17:59:40.1048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 543c18a2-72f8-42c0-13ce-08d725982c27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCuHoDAHiZqA02TAl89mxiMkBzXBP0AqyqSHzbPoMz0=;
 b=Lg29ZgvGFemZaGcNXHXqOA4sphCVnGvFmdKI16TSgeo4OCMzAHAiZLbUbl0FTVzVEjzYd6QQP3wsN33ZE9Xz1giRoeMCUsTJokGmBkw4w0G9/UaWCo8UzXqCVN1ZfXQIOPPQC9KgM6acC6CBhYWxEX6DNx+HX6iF0fFpwFnlXls=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KVGhpcyBjaGFuZ2UgaXMgYSByZWZhY3RvciBpbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5n
IGxvY2tpbmcgYW5kIHJlbW92aW5nCnRoZSByZXF1aXJlbWVudCBmb3IgYSBzdHJlYW0gc3RhdGUg
b24gdGhlIENSVEMgZm9yIGVuYWJsaW5nIENSQyBjYXB0dXJlCnRvIGZpeCBpZ3RAa21zX3BsYW5l
X211bHRpcGxlQCogd2FybmluZ3MuCgpbSG93XQpXZSBjYW4gZ2V0IHRoZSBhdXggYnkgZmluZGlu
ZyB0aGUgbWF0Y2hpbmcgY29ubmVjdG9yIGZvciB0aGUgQ1JUQwp3aXRoIHRoZSBhc3N1bXB0aW9u
IHRoYXQgd2UncmUgbm90IGRvaW5nIGNsb25pbmcuCgpDYzogRGF2aWQgRnJhbmNpcyA8RGF2aWQu
RnJhbmNpc0BhbWQuY29tPgpDYzogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hh
QGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
TmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgotLS0KIC4u
Li9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jcmMuYyB8IDE5ICsrKysrKysr
KysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX2NyYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fY3JjLmMKaW5kZXggZjY3NTYyNmVmNTZiLi5jNTdmZjg4MjFmZTIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2NyYy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2Ny
Yy5jCkBAIC0xMDEsNyArMTAxLDYgQEAgaW50IGFtZGdwdV9kbV9jcnRjX3NldF9jcmNfc291cmNl
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgY29uc3QgY2hhciAqc3JjX25hbWUpCiAJc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSBjcnRjLT5kZXYtPmRldl9wcml2YXRlOwogCXN0cnVjdCBkbV9j
cnRjX3N0YXRlICpjcnRjX3N0YXRlID0gdG9fZG1fY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7CiAJ
c3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtX3N0YXRlID0gY3J0Y19zdGF0ZS0+c3RyZWFt
OwotCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubjsKIAlzdHJ1Y3QgZHJtX2RwX2F1
eCAqYXV4ID0gTlVMTDsKIAlib29sIGVuYWJsZSA9IGZhbHNlOwogCWJvb2wgZW5hYmxlZCA9IGZh
bHNlOwpAQCAtMTM3LDkgKzEzNiwyMSBAQCBpbnQgYW1kZ3B1X2RtX2NydGNfc2V0X2NyY19zb3Vy
Y2Uoc3RydWN0IGRybV9jcnRjICpjcnRjLCBjb25zdCBjaGFyICpzcmNfbmFtZSkKIAkgKiBEUFJY
IERJVEhFUiAgfCBYWFhYICAgICAgICB8IEVuYWJsZSBEUFJYIENSQywgbmVlZCAnYXV4Jywgc2V0
IGRpdGhlcgogCSAqLwogCWlmIChkbV9pc19jcmNfc291cmNlX2Rwcngoc291cmNlKSB8fAotCQko
c291cmNlID09IEFNREdQVV9ETV9QSVBFX0NSQ19TT1VSQ0VfTk9ORSAmJgotCQkgZG1faXNfY3Jj
X3NvdXJjZV9kcHJ4KGNydGNfc3RhdGUtPmNyY19zcmMpKSkgewotCQlhY29ubiA9IHN0cmVhbV9z
dGF0ZS0+bGluay0+cHJpdjsKKwkgICAgKHNvdXJjZSA9PSBBTURHUFVfRE1fUElQRV9DUkNfU09V
UkNFX05PTkUgJiYKKwkgICAgIGRtX2lzX2NyY19zb3VyY2VfZHByeChjcnRjX3N0YXRlLT5jcmNf
c3JjKSkpIHsKKwkJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uID0gTlVMTDsKKwkJ
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsKKwkJc3RydWN0IGRybV9jb25uZWN0b3Jf
bGlzdF9pdGVyIGNvbm5faXRlcjsKKworCQlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9iZWdpbihj
cnRjLT5kZXYsICZjb25uX2l0ZXIpOworCQlkcm1fZm9yX2VhY2hfY29ubmVjdG9yX2l0ZXIgKGNv
bm5lY3RvciwgJmNvbm5faXRlcikgeworCQkJaWYgKCFjb25uZWN0b3ItPnN0YXRlIHx8IGNvbm5l
Y3Rvci0+c3RhdGUtPmNydGMgIT0gY3J0YykKKwkJCQljb250aW51ZTsKKworCQkJYWNvbm4gPSB0
b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7CisJCQlicmVhazsKKwkJfQorCQlkcm1f
Y29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJmNvbm5faXRlcik7CiAKIAkJaWYgKCFhY29ubikgewog
CQkJRFJNX0RFQlVHX0RSSVZFUigiTm8gYW1kIGNvbm5lY3RvciBtYXRjaGluZyBDUlRDLSVkXG4i
LCBjcnRjLT5pbmRleCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
