Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2442119AA
	for <lists+amd-gfx@lfdr.de>; Thu,  2 May 2019 15:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE5B894B7;
	Thu,  2 May 2019 13:03:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690056.outbound.protection.outlook.com [40.107.69.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50CF894B7
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 May 2019 13:03:29 +0000 (UTC)
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by BN8PR12MB2850.namprd12.prod.outlook.com (2603:10b6:408:9a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.12; Thu, 2 May
 2019 13:03:28 +0000
Received: from BY2NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Thu, 2 May 2019 13:03:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT021.mail.protection.outlook.com (10.152.84.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 2 May 2019 13:03:27 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 2 May 2019
 08:03:26 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Use int for signed error code checks in
 commit planes
Date: Thu, 2 May 2019 09:03:17 -0400
Message-ID: <20190502130317.5506-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(70206006)(70586007)(86362001)(1076003)(186003)(77096007)(5660300002)(26005)(36756003)(126002)(426003)(476003)(50466002)(48376002)(6666004)(356004)(316002)(305945005)(2616005)(50226002)(8676002)(51416003)(81156014)(81166006)(47776003)(2351001)(7696005)(486006)(336012)(478600001)(2906002)(44832011)(72206003)(4326008)(6916009)(8936002)(53416004)(53936002)(68736007)(16586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2850; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55ba6577-cb14-40a8-585b-08d6cefe9154
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN8PR12MB2850; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB2850:
X-Microsoft-Antispam-PRVS: <BN8PR12MB28501189685E5092ACA4C092EC340@BN8PR12MB2850.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-Forefront-PRVS: 0025434D2D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: y6MqyGtxWgDvjSTGd26p+hX24Zwgky27tjVek486XPyY38FHjBVsAjq0zochSispoVPrV1k9ABfM91ET46oVAJxOXhFvUKgJEpNVIAPxQfQCbsxMFT0xojLrGikvkb9BG1nDHDsrEP/odhxN/VlR4eoFgtSSmoJqmUzufF3Z+Ffy/GPk9UV82Nq+5BTfFkEI4CaX8BTLwnqT0kp4YoNxwH+7cuLXU9jlkr+P6G3GjA5gOTkxYg7W/M459yw6KdjVQB2lDTqNK5WGrV6vUIyBTI/vZbk2k/0oLoxptYA5OnL/kWnO9/XAo49xZJb9cTQ4QZus9uL0CPnvUiKIYHZFHoI4YloNtlpMQMly26Mm7TcxRB/U0Jbxbzs6hAQwovkJoVY6m6s8ie8CJRh1TEL+6XL6yVCTnQkFo2XG9MPB464=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2019 13:03:27.2801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ba6577-cb14-40a8-585b-08d6cefe9154
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2850
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPGevGYp8r9djWh6PRINYa53qa3pC3eV0yfLKJJB2SI=;
 b=tYwvfd2TXDpSWyYz3TME+4y6s5oXDFRlUYWQQWkmrlfKilajeQ4RPMvXCZiXUMGI+fWq4Va3yMitboAj+qPUU84Iph4DHMegazu2580KLQtf+k8j9LG44D+2IPcRzNLHt7JzaPiZZzvKjomXn6vZVrdAQH+ZFhvWiPaF1wR+pw8=
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

W1doeV0KClRoZSB0eXBlIG9mICdyJyBpcyB1aW50MzJfdCBhbmQgdGhlIHJldHVybiBjb2RlcyBm
b3IgYm90aDoKCi0gcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXRfdGltZW91dF9yY3UKLSBhbWRncHVf
Ym9fcmVzZXJ2ZQoKLi4uYXJlIHNpZ25lZC4gV2hpbGUgaXQgd29ya3MgZm9yIHRoZSBsYXR0ZXIg
c2luY2UgdGhlIGNoZWNrIGlzCmRvbmUgb24gIT0gMCBpdCBkb2Vzbid0IHdvcmsgZm9yIHRoZSBm
b3JtZXIgc2luY2Ugd2UgY2hlY2sgPD0gMC4KCltIb3ddCgpNYWtlICdyJyBhbiBpbnQgaW4gY29t
bWl0IHBsYW5lcyBzbyB3ZSdyZSBub3QgZG9pbmcgYW55IHVuc2lnbmVkL3NpZ25lZApjb252ZXJz
aW9uIGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLgoKUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIg
PGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1
c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggYmVjZDhjYjNhYWI2Li43
MjJmODYzY2U0YTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYwpAQCAtNTMzMiw3ICs1MzMyLDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1
X2RtX2NvbW1pdF9wbGFuZXMoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQkJCSAg
ICBzdHJ1Y3QgZHJtX2NydGMgKnBjcnRjLAogCQkJCSAgICBib29sIHdhaXRfZm9yX3ZibGFuaykK
IHsKLQl1aW50MzJfdCBpLCByOworCXVpbnQzMl90IGk7CiAJdWludDY0X3QgdGltZXN0YW1wX25z
OwogCXN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lOwogCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9s
ZF9wbGFuZV9zdGF0ZSwgKm5ld19wbGFuZV9zdGF0ZTsKQEAgLTUzNDIsNyArNTM0Miw3IEBAIHN0
YXRpYyB2b2lkIGFtZGdwdV9kbV9jb21taXRfcGxhbmVzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRl
ICpzdGF0ZSwKIAlzdHJ1Y3QgZG1fY3J0Y19zdGF0ZSAqYWNydGNfc3RhdGUgPSB0b19kbV9jcnRj
X3N0YXRlKG5ld19wY3J0Y19zdGF0ZSk7CiAJc3RydWN0IGRtX2NydGNfc3RhdGUgKmRtX29sZF9j
cnRjX3N0YXRlID0KIAkJCXRvX2RtX2NydGNfc3RhdGUoZHJtX2F0b21pY19nZXRfb2xkX2NydGNf
c3RhdGUoc3RhdGUsIHBjcnRjKSk7Ci0JaW50IHBsYW5lc19jb3VudCA9IDAsIHZwb3MsIGhwb3M7
CisJaW50IHIsIHBsYW5lc19jb3VudCA9IDAsIHZwb3MsIGhwb3M7CiAJdW5zaWduZWQgbG9uZyBm
bGFnczsKIAlzdHJ1Y3QgYW1kZ3B1X2JvICphYm87CiAJdWludDY0X3QgdGlsaW5nX2ZsYWdzOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
