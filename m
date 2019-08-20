Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629309682C
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 19:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD77B89F8E;
	Tue, 20 Aug 2019 17:59:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750081.outbound.protection.outlook.com [40.107.75.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB6889F8E
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 17:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5/PWowTP9ez+kw7cH9ecEJ0P5uXcX4650n5/nS4yj2bHCa0GgB6QtdpOMe2W/Zo5VF+9UUelSKjSoyJcnWJUOC43uWi0hL4j8iiyadjNGtqrI3oNApL6ajS3HBstIFycAaywkx2h4okn7/AVxnxevHQrnIYBpZTVrMfoJP9gqD+fD/woshQt7OzE8fw0IB8xAR/k+EOoq5bVCg5E0K4T8fxA7+QhTsTL18Nt7JO/9TBNc4GDNeOaJLJ7nMJ54HqUXbgTDcBE7lVYH3rDUuQ6dF48yU76aKPcheqy6L8PeEeFFf4LLAHhHT5vwycHkp/kn9ppeQTtES1+y9T//SrGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIMdsm1ECYL6hioZrKurrr6EnVs2eK7FmkoLc8yLlDo=;
 b=RozEd+lKTsbo/oJWtGeCdhuPziDjGno3CTIkYFFq6pC2MF4/l4xXKIQVIfF+JHj6/uT0jYDhklxyRs8DLnh8WbcnGcTvArYd2JGyOqmeNILsQjvl2JMc893wGsARr06PhXctTFb4aUau3QOg1PtumaIQab712vFKr//7U+Qhb7Gdxjv6166pFAW2EuzQL/e/kMa4p+nv5cQJQPYOyDEun1DfuOidxfP30G15o5uDPX9mTXq5JAL5z0qCMktqc2mSHdfJ+3ceuR5tUEmKw7wR9z8LSHG45l9VMB56CZlRWvupYtEv/jowYqpbHb3gMBUlIQI1+Fs8iG1qx+2Y5zFwjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0049.namprd12.prod.outlook.com (2603:10b6:300:103::11)
 by DM5PR12MB1532.namprd12.prod.outlook.com (2603:10b6:4:6::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 17:59:38 +0000
Received: from DM3NAM03FT038.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MWHPR12CA0049.outlook.office365.com
 (2603:10b6:300:103::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 17:59:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT038.mail.protection.outlook.com (10.152.83.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 17:59:38 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 20 Aug 2019
 12:59:37 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amd/display: Check return code for CRC
 drm_crtc_vblank_get
Date: Tue, 20 Aug 2019 13:59:29 -0400
Message-ID: <20190820175932.7884-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(16586007)(81166006)(81156014)(316002)(70586007)(5660300002)(53936002)(26005)(186003)(8676002)(14444005)(4326008)(305945005)(476003)(2616005)(50226002)(44832011)(2351001)(126002)(6666004)(1076003)(486006)(2906002)(53416004)(478600001)(8936002)(356004)(336012)(426003)(36756003)(48376002)(6916009)(51416003)(7696005)(86362001)(54906003)(70206006)(47776003)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1532; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b4e5107-5d45-4340-88e1-08d725982af6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1532; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1532:
X-Microsoft-Antispam-PRVS: <DM5PR12MB153273231A213DCE0B709768ECAB0@DM5PR12MB1532.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 013568035E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VQ46CFInlO7ZceEd8ELDe0yx13i7nSTrwduBLDnpiAZ7TSPiQUi0NwRfWTV4oYD/n34jtsoc4b936ZsYFPvscE308QDnrU0aHVxkYHNWmEhC97j3X3jWLKjlw/Uvjsj6RBgqyAeu8uTIqDLZUS1P+vUAjndu1uAYlCofNoSzARlJnv+KkkH37wT3QqV2zK9WePM6DvDdaIBagu9rfUrlE+nCQS251qjGq2f6Q0YV/bln8vC/z5NIbxdfhDQryEvnItaynSTrjAaQfCbLs/KBoOJOGlusMVq2l9rkkqvnX/CYmwA5I7b5vrxeK9L82kYK5P3ilrpkgmN1udPZLJlS4kgQrJGzR41zKuV2wSVZzatrPCidgwqBx1vGeFu89jXZUf0qWVwFqOkDNZe5lAK0IPJS2cY2OKYpwT4uV6FF9aU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 17:59:38.1190 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4e5107-5d45-4340-88e1-08d725982af6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1532
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIMdsm1ECYL6hioZrKurrr6EnVs2eK7FmkoLc8yLlDo=;
 b=QEAGKH/vP0hVrXImmxd9W+4LMdtN8AJrS0CaUqABsUU7eSYCw7zQJJAgNLMwHjrrWoT7mNvznbJt8YEUDHvbf1/Gzr3c3lYd18TsxkSDnY3lUvor01w4j1rEVqIAg0g0lVkrIEq1CAJ5MP0K3g/o5cTXlel7dSy0YcUppPorIK0=
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

W1doeV0KVGhlIGNhbGwgdG8gZHJtX2NydGNfdmJsYW5rX2dldCBjYW4gZmFpbCBpZiB2Ymxhbmsg
aXMgZGlzYWJsZWQgYW5kCndlIHRyeSB0byBpbmNyZW1lbnQgdGhlIHJlZmVyZW5jZS4KClNpbmNl
IGRybV9jcnRjX3ZibGFua19nZXQgaW50ZXJuYWxseSBkcm9wcyB0aGUgcmVmZXJlbmNlIHdoZW4g
aXQgZmFpbHMKaXQgbWVhbnMgdGhlIHN1YnNlcXVlbnQgZHJtX2NydGNfdmJsYW5rX3B1dCguLi4p
IHdoZW4gY2xvc2luZyB0aGUgZmlsZQpkcm9wcyBhIHplcm8gcmVmZXJlbmNlLgoKVGhpcyB3YXMg
Zm91bmQgdmlhIGlndEBrbXNfcGxhbmVAcGl4ZWwtZm9ybWF0LXBpcGUtQS1wbGFuZXMuCgpbSG93
XQpDaGVjayB0aGUgcmV0dXJuIGNvZGUgYW5kIHJldHVybiBpdCBvbiBmYWlsdXJlLgoKV2Ugd291
bGRuJ3QgaGF2ZSBiZWVuIGFibGUgdG8gZW5hYmxlIENSQyByZWFkaW5nIGFueXdheSBzaW5jZSB2
YmxhbmsKd2Fzbid0IGVuYWJsZWQuCgpDYzogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0Bh
bWQuY29tPgpDYzogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+
CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTmljaG9sYXMg
S2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2NyYy5jIHwgNiArKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jcmMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2NyYy5jCmlu
ZGV4IGIwMTI1NmE0NjkyZS4uZjY3NTYyNmVmNTZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jcmMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jcmMuYwpAQCAtMTA1LDYgKzEw
NSw3IEBAIGludCBhbWRncHVfZG1fY3J0Y19zZXRfY3JjX3NvdXJjZShzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsIGNvbnN0IGNoYXIgKnNyY19uYW1lKQogCXN0cnVjdCBkcm1fZHBfYXV4ICphdXggPSBO
VUxMOwogCWJvb2wgZW5hYmxlID0gZmFsc2U7CiAJYm9vbCBlbmFibGVkID0gZmFsc2U7CisJaW50
IHJldDsKIAogCWVudW0gYW1kZ3B1X2RtX3BpcGVfY3JjX3NvdXJjZSBzb3VyY2UgPSBkbV9wYXJz
ZV9jcmNfc291cmNlKHNyY19uYW1lKTsKIApAQCAtMTc1LDcgKzE3NiwxMCBAQCBpbnQgYW1kZ3B1
X2RtX2NydGNfc2V0X2NyY19zb3VyY2Uoc3RydWN0IGRybV9jcnRjICpjcnRjLCBjb25zdCBjaGFy
ICpzcmNfbmFtZSkKIAkgKi8KIAllbmFibGVkID0gYW1kZ3B1X2RtX2lzX3ZhbGlkX2NyY19zb3Vy
Y2UoY3J0Y19zdGF0ZS0+Y3JjX3NyYyk7CiAJaWYgKCFlbmFibGVkICYmIGVuYWJsZSkgewotCQlk
cm1fY3J0Y192YmxhbmtfZ2V0KGNydGMpOworCQlyZXQgPSBkcm1fY3J0Y192YmxhbmtfZ2V0KGNy
dGMpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwogCQlpZiAoZG1faXNfY3JjX3NvdXJj
ZV9kcHJ4KHNvdXJjZSkpIHsKIAkJCWlmIChkcm1fZHBfc3RhcnRfY3JjKGF1eCwgY3J0YykpIHsK
IAkJCQlEUk1fREVCVUdfRFJJVkVSKCJkcCBzdGFydCBjcmMgZmFpbGVkXG4iKTsKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
