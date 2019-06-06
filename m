Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C485437F16
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FA4891CB;
	Thu,  6 Jun 2019 20:55:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710061.outbound.protection.outlook.com [40.107.71.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA8E8991E
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:30 +0000 (UTC)
Received: from CY4PR12CA0034.namprd12.prod.outlook.com (2603:10b6:903:129::20)
 by MWHPR1201MB0064.namprd12.prod.outlook.com (2603:10b6:301:58::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.14; Thu, 6 Jun
 2019 20:55:29 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR12CA0034.outlook.office365.com
 (2603:10b6:903:129::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:28 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:11 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/24] drm/amd/display: S3 Resume time increase after
 decoupling DPMS from fast boot
Date: Thu, 6 Jun 2019 16:54:58 -0400
Message-ID: <20190606205501.16505-22-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(16586007)(2351001)(6916009)(70206006)(1076003)(5660300002)(50466002)(70586007)(305945005)(86362001)(48376002)(2906002)(47776003)(6666004)(356004)(4326008)(8936002)(478600001)(50226002)(53936002)(53416004)(316002)(72206003)(36756003)(8676002)(81156014)(81166006)(126002)(77096007)(11346002)(186003)(486006)(26005)(2616005)(446003)(51416003)(7696005)(68736007)(426003)(476003)(76176011)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0064; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b72fc057-0588-4dff-1875-08d6eac14eaf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB0064; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0064:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0064D2D5E297B017E5AF8817F9170@MWHPR1201MB0064.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: L85KcItS8+ENejPc/6+akqgTzuOPTHe7PfRw6lgSM2AiQxNTawZ1MqZw1aUVw3fOKn+sMoJfDRXNvE19JJLzCxj4D9vqNbmrQrNOHNlXKPlpCjOwjHxzLYmH3lH8AEeBQJ3tVP6AjNdsTLBwFGN/A9OS2tmkj0vVqvcBPpbn7JL57jMkOXCd1KVPweDNr72XV7zDiM1TnYwWvl2geG09Xxff24c56kwhaB4MAmc9oYtjjlhmtxzl0x+1opJjqbbi2IH+AVqioB98/O1OaJC0JB/u/2qT04KDgSKZhX6V24gd879o5in9OGYsuDTHR6Y4PSu10Kvcqxe/XhRMF0l0yjjMhL/30Lsjm4C8qVxN38GDlWgIk3hv1SehtZ8+Tj1+Sgv9GEAGfjKceTKxdY92bDVTJ1VQsR+3aPNKK6f8XuQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:28.7073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b72fc057-0588-4dff-1875-08d6eac14eaf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0064
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/J52uJMBTCHtKTczn3ZBd6onPY08Z0Vg6AdN41B9pfs=;
 b=ypASW1D4r0rImGwDVUL06f+d3lKcApqmFfX0Z+U82Omfh8tH0k2IgAOjOFuGvMsqVj7XmZMqRunKlp5s09RM/mmesypDqiJq++G/NmlIEzqx1UgHX2K2pJQcJ1uJos759utGTwHXTTRBbJwEKR+7rWuQTn1dd0BcNe5IKepuzCo=
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
Cc: SivapiriyanKumarasamy <sivapiriyan.kumarasamy@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2l2YXBpcml5YW5LdW1hcmFzYW15IDxzaXZhcGlyaXlhbi5rdW1hcmFzYW15QGFtZC5j
b20+CgpbV2h5XQpXZSBpbmNvcnJlY3RseSBiZWdhbiBwb3dlcmluZyBkb3duIHRoZSBkaXNwbGF5
IGF0IGJvb3QvcmVzdW1lIHdoZW5ldmVyCmZhc3QgYm9vdCB3YXMgbm90IHBvc3NpYmxlLiBUaGlz
IHNob3VsZCBub3QgYmUgZG9uZSBpbiB0aGUgY2FzZSB3aGVyZSB0aGVyZQpleGlzdHMgYSBzdHJl
YW0gZm9yIHRoZSBlRFAgc2luY2UgdGhpcyBpbXBsaWVzIHRoYXQgd2Ugd2FudCB0byB0dXJuIGl0
IG9uLgoKW0hvd10KQWRkIGNoZWNrIGZvciBlRFAgc3RyZWFtIHRvIGRlY2lkZSB3aGV0aGVyIHRv
IHBvd2VyIG9mZiBlZHAuCgpTaWduZWQtb2ZmLWJ5OiBTaXZhcGlyaXlhbkt1bWFyYXNhbXkgPHNp
dmFwaXJpeWFuLmt1bWFyYXNhbXlAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkgS29vIDxB
bnRob255Lktvb0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnBy
ZWV0Lkxha2hhQGFtZC5jb20+CkFja2VkLWJ5OiBSZXphIEFtaW5pIDxSZXphLkFtaW5pQGFtZC5j
b20+Ci0tLQogLi4uL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYyAgIHwg
MzUgKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYwppbmRleCAzMDQyNzQxYjE2NWEu
LjJhN2FjNDUyZDQ1OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMKQEAgLTE1MDcsNiArMTUwNywx
OCBAQCBzdGF0aWMgdm9pZCBkaXNhYmxlX3ZnYV9hbmRfcG93ZXJfZ2F0ZV9hbGxfY29udHJvbGxl
cnMoCiAJfQogfQogCisKK3N0YXRpYyBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpnZXRfZWRwX3N0
cmVhbShzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQpCit7CisJaW50IGk7CisKKwlmb3IgKGkgPSAw
OyBpIDwgY29udGV4dC0+c3RyZWFtX2NvdW50OyBpKyspIHsKKwkJaWYgKGNvbnRleHQtPnN0cmVh
bXNbaV0tPnNpZ25hbCA9PSBTSUdOQUxfVFlQRV9FRFApCisJCQlyZXR1cm4gY29udGV4dC0+c3Ry
ZWFtc1tpXTsKKwl9CisJcmV0dXJuIE5VTEw7Cit9CisKIHN0YXRpYyBzdHJ1Y3QgZGNfbGluayAq
Z2V0X2VkcF9saW5rKHN0cnVjdCBkYyAqZGMpCiB7CiAJaW50IGk7CkBAIC0xNTUwLDEyICsxNTYy
LDE2IEBAIHZvaWQgZGNlMTEwX2VuYWJsZV9hY2NlbGVyYXRlZF9tb2RlKHN0cnVjdCBkYyAqZGMs
IHN0cnVjdCBkY19zdGF0ZSAqY29udGV4dCkKIAlpbnQgaTsKIAlzdHJ1Y3QgZGNfbGluayAqZWRw
X2xpbmtfd2l0aF9zaW5rID0gZ2V0X2VkcF9saW5rX3dpdGhfc2luayhkYywgY29udGV4dCk7CiAJ
c3RydWN0IGRjX2xpbmsgKmVkcF9saW5rID0gZ2V0X2VkcF9saW5rKGRjKTsKKwlzdHJ1Y3QgZGNf
c3RyZWFtX3N0YXRlICplZHBfc3RyZWFtID0gTlVMTDsKIAlib29sIGNhbl9hcHBseV9lZHBfZmFz
dF9ib290ID0gZmFsc2U7CiAJYm9vbCBjYW5fYXBwbHlfc2VhbWxlc3NfYm9vdCA9IGZhbHNlOwor
CWJvb2wga2VlcF9lZHBfdmRkX29uID0gZmFsc2U7CiAKIAlpZiAoZGMtPmh3c3MuaW5pdF9waXBl
cykKIAkJZGMtPmh3c3MuaW5pdF9waXBlcyhkYywgY29udGV4dCk7CiAKKwllZHBfc3RyZWFtID0g
Z2V0X2VkcF9zdHJlYW0oY29udGV4dCk7CisKIAkvLyBDaGVjayBmYXN0Ym9vdCBzdXBwb3J0LCBk
aXNhYmxlIG9uIERDRTggYmVjYXVzZSBvZiBibGFuayBzY3JlZW5zCiAJaWYgKGVkcF9saW5rICYm
IGRjLT5jdHgtPmRjZV92ZXJzaW9uICE9IERDRV9WRVJTSU9OXzhfMCAmJgogCQkgICAgZGMtPmN0
eC0+ZGNlX3ZlcnNpb24gIT0gRENFX1ZFUlNJT05fOF8xICYmCkBAIC0xNTYzLDE1ICsxNTc5LDE2
IEBAIHZvaWQgZGNlMTEwX2VuYWJsZV9hY2NlbGVyYXRlZF9tb2RlKHN0cnVjdCBkYyAqZGMsIHN0
cnVjdCBkY19zdGF0ZSAqY29udGV4dCkKIAogCQkvLyBlbmFibGUgZmFzdGJvb3QgaWYgYmFja2Vu
ZCBpcyBlbmFibGVkIG9uIGVEUAogCQlpZiAoZWRwX2xpbmstPmxpbmtfZW5jLT5mdW5jcy0+aXNf
ZGlnX2VuYWJsZWQoZWRwX2xpbmstPmxpbmtfZW5jKSkgewotCQkJLyogRmluZCBlRFAgc3RyZWFt
IGFuZCBzZXQgb3B0aW1pemF0aW9uIGZsYWcgKi8KLQkJCWZvciAoaSA9IDA7IGkgPCBjb250ZXh0
LT5zdHJlYW1fY291bnQ7IGkrKykgewotCQkJCWlmIChjb250ZXh0LT5zdHJlYW1zW2ldLT5zaWdu
YWwgPT0gU0lHTkFMX1RZUEVfRURQKSB7Ci0JCQkJCWNvbnRleHQtPnN0cmVhbXNbaV0tPmFwcGx5
X2VkcF9mYXN0X2Jvb3Rfb3B0aW1pemF0aW9uID0gdHJ1ZTsKLQkJCQkJY2FuX2FwcGx5X2VkcF9m
YXN0X2Jvb3QgPSB0cnVlOwotCQkJCQlicmVhazsKLQkJCQl9CisJCQkvKiBTZXQgb3B0aW1pemF0
aW9uIGZsYWcgb24gZURQIHN0cmVhbSovCisJCQlpZiAoZWRwX3N0cmVhbSkgeworCQkJCWVkcF9z
dHJlYW0tPmFwcGx5X2VkcF9mYXN0X2Jvb3Rfb3B0aW1pemF0aW9uID0gdHJ1ZTsKKwkJCQljYW5f
YXBwbHlfZWRwX2Zhc3RfYm9vdCA9IHRydWU7CiAJCQl9CiAJCX0KKworCQkvLyBXZSBhcmUgdHJ5
aW5nIHRvIGVuYWJsZSBlRFAsIGRvbid0IHBvd2VyIGRvd24gVkRECisJCWlmIChlZHBfc3RyZWFt
KQorCQkJa2VlcF9lZHBfdmRkX29uID0gdHJ1ZTsKIAl9CiAKIAkvLyBDaGVjayBzZWFtbGVzcyBi
b290IHN1cHBvcnQKQEAgLTE1ODYsMTQgKzE2MDMsMTQgQEAgdm9pZCBkY2UxMTBfZW5hYmxlX2Fj
Y2VsZXJhdGVkX21vZGUoc3RydWN0IGRjICpkYywgc3RydWN0IGRjX3N0YXRlICpjb250ZXh0KQog
CSAqIGl0IHNob3VsZCBnZXQgdHVybmVkIG9mZgogCSAqLwogCWlmICghY2FuX2FwcGx5X2VkcF9m
YXN0X2Jvb3QgJiYgIWNhbl9hcHBseV9zZWFtbGVzc19ib290KSB7Ci0JCWlmIChlZHBfbGlua193
aXRoX3NpbmspIHsKKwkJaWYgKGVkcF9saW5rX3dpdGhfc2luayAmJiAha2VlcF9lZHBfdmRkX29u
KSB7CiAJCQkvKnR1cm4gb2ZmIGJhY2tsaWdodCBiZWZvcmUgRFBfYmxhbmsgYW5kIGVuY29kZXIg
cG93ZXJlZCBkb3duKi8KIAkJCWRjLT5od3NzLmVkcF9iYWNrbGlnaHRfY29udHJvbChlZHBfbGlu
a193aXRoX3NpbmssIGZhbHNlKTsKIAkJfQogCQkvKnJlc3VtZSBmcm9tIFMzLCBubyB2YmlvcyBw
b3N0aW5nLCBubyBuZWVkIHRvIHBvd2VyIGRvd24gYWdhaW4qLwogCQlwb3dlcl9kb3duX2FsbF9o
d19ibG9ja3MoZGMpOwogCQlkaXNhYmxlX3ZnYV9hbmRfcG93ZXJfZ2F0ZV9hbGxfY29udHJvbGxl
cnMoZGMpOwotCQlpZiAoZWRwX2xpbmtfd2l0aF9zaW5rKQorCQlpZiAoZWRwX2xpbmtfd2l0aF9z
aW5rICYmICFrZWVwX2VkcF92ZGRfb24pCiAJCQlkYy0+aHdzcy5lZHBfcG93ZXJfY29udHJvbChl
ZHBfbGlua193aXRoX3NpbmssIGZhbHNlKTsKIAl9CiAJYmlvc19zZXRfc2NyYXRjaF9hY2NfbW9k
ZV9jaGFuZ2UoZGMtPmN0eC0+ZGNfYmlvcyk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
