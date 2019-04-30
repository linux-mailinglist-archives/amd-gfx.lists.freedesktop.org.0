Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D9E10199
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C225892F6;
	Tue, 30 Apr 2019 21:10:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760053.outbound.protection.outlook.com [40.107.76.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EEA89260
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:06 +0000 (UTC)
Received: from DM3PR12CA0106.namprd12.prod.outlook.com (2603:10b6:0:55::26) by
 DM5PR12MB2374.namprd12.prod.outlook.com (2603:10b6:4:b4::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 30 Apr 2019 21:10:05 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0106.outlook.office365.com
 (2603:10b6:0:55::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:05 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:53 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/20] drm/amd/display: reset retimer/redriver below 340Mhz
Date: Tue, 30 Apr 2019 17:09:26 -0400
Message-ID: <20190430210938.32335-29-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(396003)(39860400002)(136003)(346002)(2980300002)(428003)(189003)(199004)(50226002)(77096007)(16586007)(50466002)(186003)(2351001)(48376002)(68736007)(36756003)(126002)(305945005)(53416004)(2906002)(316002)(47776003)(6916009)(486006)(476003)(11346002)(446003)(8936002)(2616005)(4326008)(81166006)(7696005)(26005)(81156014)(51416003)(8676002)(76176011)(86362001)(336012)(53936002)(70586007)(72206003)(1076003)(426003)(478600001)(5660300002)(356004)(6666004)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2374; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a3d0ba0-7fe0-4267-0638-08d6cdb037bc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB2374; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2374:
X-Microsoft-Antispam-PRVS: <DM5PR12MB23749172D4B67D2C0C2F733BF93A0@DM5PR12MB2374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VWdQMdLX3vejty6MqgNwWx9NeRDOhBnCpve0e5mVbMdwA/cTRuscqYi07VFS8t85yXEHaaC9dWEFKtKR18UWzIK7rbATDqL/szI5MbpnqjLH8RGFeflLKLtVmvNBTIvYl5zRhIybAZMeULcqt4167myk7m3a4+b3r7LaZUDeC1z5ms8WuguGs5tslZSrprCAarLM7+54qi5AZtORXbuWsrkZyF5GM7k4OekNGVilX0PstKMDc94lm8maeuDcCXdTGuK2mPnLFy4LrDHhIsQoLJwFzUXc2LNo2mY5TaNaU6XpnMs/Z5PI5CD1W4wzK/AvCwe1FCgWBlyPDIu0Vvtv8R1Sr5YRGOqK5nxtHzD60kdYkaYQ+CrySmzgZv/JRILp98gTkr8PMXSTKRcOkH7VEnsUrG2TDy9G4p+IW2GuARQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:05.0699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3d0ba0-7fe0-4267-0638-08d6cdb037bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2374
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIvbEdIGABLgyCoH5gPJC3fHYRfWXrWJ0QLLJ/5Sva0=;
 b=z6Q+2o5BICq1Iqgc/DwJeK4W6m4Dn9NigzEhzs1dd/bCXd0TLaQ2cj6CrjEApDqhDosMsFMbMSh8TU0CR2QtyAPcLAHOHdcZK3Etxz74QyIxt07E84zz7CzQzcNaANdR0D1QDJiqpK5c7GlzDAxwPMdSLnvXqN2AfbCD3qYu3vw=
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
Cc: Charlene Liu <charlene.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCltEZXNjcmlwdGlvbl0K
VGhpcyBpcyBmb3IgSERNSSA2R2h6IG1vZGUgYmVmb3JlIHdlIGxvYWQgdGhlIGRyaXZlciwgYmVj
YXVzZSBWQklPUwpub3Qgc3VwcG9ydCBIRE1JICg2R2h6IG1vZGUpCgpSZXNldCB0byByZWRyaXZl
ci9yZXRpbWVyIHNldHRpbmcgZm9yIHRoZSBzZXR0aW5nIGZvciBiZWxvdyAzNDBNaHouCgpDaGFu
Z2UtSWQ6IEk5OThiMzcxZDA3NWM1NzBjY2VhNDMwNTM0NWU1ZmQ2NmQyY2JkZjJlClNpZ25lZC1v
ZmYtYnk6IENoYXJsZW5lIExpdSA8Y2hhcmxlbmUubGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBL
cnVub3NsYXYgS292YWMgPEtydW5vc2xhdi5Lb3ZhY0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2Fu
cHJlZXQgTGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIHwgMjggKysrKysrKysrKysrKysrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCmluZGV4IGIzN2Vj
YzNlZGU2MS4uOWZiZjkyNmQ1YmY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kY19saW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGluay5jCkBAIC0yNzEzLDE3ICsyNzEzLDM3IEBAIHZvaWQgY29yZV9saW5r
X2Rpc2FibGVfc3RyZWFtKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgsIGludCBvcHRpb24pCiB7
CiAJc3RydWN0IGRjICAqY29yZV9kYyA9IHBpcGVfY3R4LT5zdHJlYW0tPmN0eC0+ZGM7CiAJc3Ry
dWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtID0gcGlwZV9jdHgtPnN0cmVhbTsKKwlzdHJ1Y3Qg
ZGNfbGluayAqbGluayA9IHN0cmVhbS0+c2luay0+bGluazsKIAogCWNvcmVfZGMtPmh3c3MuYmxh
bmtfc3RyZWFtKHBpcGVfY3R4KTsKIAogCWlmIChwaXBlX2N0eC0+c3RyZWFtLT5zaWduYWwgPT0g
U0lHTkFMX1RZUEVfRElTUExBWV9QT1JUX01TVCkKIAkJZGVhbGxvY2F0ZV9tc3RfcGF5bG9hZChw
aXBlX2N0eCk7CiAKLQlpZiAoZGNfaXNfaGRtaV9zaWduYWwocGlwZV9jdHgtPnN0cmVhbS0+c2ln
bmFsKSkKLQkJZGFsX2RkY19zZXJ2aWNlX3dyaXRlX3NjZGNfZGF0YSgKLQkJCXN0cmVhbS0+bGlu
ay0+ZGRjLCAwLAotCQkJc3RyZWFtLT50aW1pbmcuZmxhZ3MuTFRFXzM0ME1DU0NfU0NSQU1CTEUp
OworCWlmIChkY19pc19oZG1pX3NpZ25hbChwaXBlX2N0eC0+c3RyZWFtLT5zaWduYWwpKSB7CisJ
CXN0cnVjdCBleHRfaGRtaV9zZXR0aW5ncyBzZXR0aW5ncyA9IHswfTsKKwkJZW51bSBlbmdpbmVf
aWQgZW5nX2lkID0gcGlwZV9jdHgtPnN0cmVhbV9yZXMuc3RyZWFtX2VuYy0+aWQ7CiAKKwkJdW5z
aWduZWQgc2hvcnQgbWFza2VkX2NoaXBfY2FwcyA9IGxpbmstPmNoaXBfY2FwcyAmCisJCQkJRVhU
X0RJU1BMQVlfUEFUSF9DQVBTX19FWFRfQ0hJUF9NQVNLOworCQkvL05lZWQgdG8gaW5mb3JtIHRo
YXQgc2luayBpcyBnb2luZyB0byB1c2UgbGVnYWN5IEhETUkgbW9kZS4KKwkJZGFsX2RkY19zZXJ2
aWNlX3dyaXRlX3NjZGNfZGF0YSgKKwkJCWxpbmstPmRkYywKKwkJCTE2NTAwMCwvL3ZiaW9zIG9u
bHkgaGFuZGxlcyAxNjVNaHouCisJCQlmYWxzZSk7CisJCWlmIChtYXNrZWRfY2hpcF9jYXBzID09
IEVYVF9ESVNQTEFZX1BBVEhfQ0FQU19fSERNSTIwX1RJU042NURQMTU5UlNCVCkgeworCQkJLyog
RFAxNTksIFJldGltZXIgc2V0dGluZ3MgKi8KKwkJCWlmIChnZXRfZXh0X2hkbWlfc2V0dGluZ3Mo
cGlwZV9jdHgsIGVuZ19pZCwgJnNldHRpbmdzKSkKKwkJCQl3cml0ZV9pMmNfcmV0aW1lcl9zZXR0
aW5nKHBpcGVfY3R4LAorCQkJCQkJZmFsc2UsIGZhbHNlLCAmc2V0dGluZ3MpOworCQkJZWxzZQor
CQkJCXdyaXRlX2kyY19kZWZhdWx0X3JldGltZXJfc2V0dGluZyhwaXBlX2N0eCwKKwkJCQkJCWZh
bHNlLCBmYWxzZSk7CisJCX0gZWxzZSBpZiAobWFza2VkX2NoaXBfY2FwcyA9PSBFWFRfRElTUExB
WV9QQVRIX0NBUFNfX0hETUkyMF9QSTNFUVgxMjA0KSB7CisJCQkvKiBQSTNFUVgxMjA0LCBSZWRy
aXZlciBzZXR0aW5ncyAqLworCQkJd3JpdGVfaTJjX3JlZHJpdmVyX3NldHRpbmcocGlwZV9jdHgs
IGZhbHNlKTsKKwkJfQorCX0KIAljb3JlX2RjLT5od3NzLmRpc2FibGVfc3RyZWFtKHBpcGVfY3R4
LCBvcHRpb24pOwogCiAJZGlzYWJsZV9saW5rKHBpcGVfY3R4LT5zdHJlYW0tPmxpbmssIHBpcGVf
Y3R4LT5zdHJlYW0tPnNpZ25hbCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
