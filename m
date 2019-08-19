Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD1F926FD
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8199A6E159;
	Mon, 19 Aug 2019 14:36:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710054.outbound.protection.outlook.com [40.107.71.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D076E171
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:36:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVYDbDZiTF4uAspv/pA3GG/90qjrOXUZvO+jSp81bQVk9EKuML8AWHsesrL59Yx9IuyuMWfllmeIMBCu9k9uSBoQZF7zlkn6ap+EbhIwRX7azRdbwUA0MkAtCQUyJoV0B2V0w1JZ1VedcdQzhTLNixxBGMvXSWCB0RrNvLhUktDZZ/8/+f8pYUE05pwL26afki9XCIXFTyPSgKfm5ZPIRYhyO25f1Jj6x1AVhvKr8Lgn6ZYb2PKxfNjxflCwDwJO2+G2wcb/R7jBoxiY9FugemcJlNAnpDWc2t0EXDmwwwnX7dj4fDk7yo1gHPjDGuZYOyBf02OI5hf15LrNAYBloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyKYimCfDiwUfqUm3FOSID3NAYx2StwWO4pIlPXZfeI=;
 b=kyYZCJkmuj5aWIyhzEFhHh/reFI4t+Q+LYC0x9f4OSkIwVtlTp9NLy4CdyjBg8K37yT1hv8OBnNN+Gr5BcEcjQNRYF4h4omRiNdawo5KX+s9xOtxcawI42I6FBxqH1ewxjD+5IwvS7pIb9CvvbOiiusF+dxPzIdiuJkWbNwVa0jYLcWD5a3WOcoPQ/iNZ9KWFH4ApdYASQBIIfASwuGxR05qlgy1Xu3Wv0Ja5k1adMt5J7kmregFpE2d1r1EuFU37n7/xIywDD7Z0rRiJp1HtT2MUFNkPMImIIooHVzQso2gI/6jf4CDXZdapehIy2fljBHQQw6lOycqggK3WT3l8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0005.namprd12.prod.outlook.com (2603:10b6:4:1::15) by
 MWHPR12MB1534.namprd12.prod.outlook.com (2603:10b6:301:10::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 14:35:58 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by DM5PR12CA0005.outlook.office365.com
 (2603:10b6:4:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:57 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:47 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 24/36] drm/amd/display: fix odm validation
Date: Mon, 19 Aug 2019 10:35:03 -0400
Message-ID: <20190819143515.21653-25-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(316002)(50226002)(4326008)(7696005)(51416003)(478600001)(2906002)(50466002)(14444005)(86362001)(48376002)(356004)(6666004)(47776003)(76176011)(8936002)(5660300002)(6916009)(70206006)(81166006)(8676002)(16586007)(186003)(53416004)(36756003)(1076003)(26005)(305945005)(336012)(446003)(11346002)(2351001)(426003)(53936002)(486006)(126002)(476003)(2616005)(81156014)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1534; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55df9a1e-1f6d-4d72-36cc-08d724b28ca5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1534; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1534:
X-Microsoft-Antispam-PRVS: <MWHPR12MB15347E3F713AD118325187B9F9A80@MWHPR12MB1534.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4mpCQmgsnTuyisAWA9wFQ+765FDeF3fGKjdHvhhGuo5pSkzvsw5CMJ9on8xGsvqM6gu1uQHM1oy7jMfyVhUDIuLskgpvVtXytChxezoJ+ymeVVhAbqRgXp8Ui3Tflev3LgD7qFYjwCUsZtLUlzNZQHkA+8hnw6XRIEvSG5EWkq23DjwjzGelA7kaF1x8rZea+SOcy5qIsoYO3Jpc5V8PdPXwmPS6bU0OwpwnYoNYTL3R92o4UIrI5VXsWztvCipYOpyCprl20UQss4XQMyHQiIWACPsXX67biAHArcdzunAVpYlHEoBi2o+A3dvKoClmLRhDhYrdSNxNa2Gbv32iQOQMz7AyuZCsDCHssu5NmXsGXahrXifXV1XJz00/75adAGN5YmUscM0Rp64cItvnSfp/pAYoHXSavfbEy/20HEM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:57.7099 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55df9a1e-1f6d-4d72-36cc-08d724b28ca5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1534
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyKYimCfDiwUfqUm3FOSID3NAYx2StwWO4pIlPXZfeI=;
 b=jWRMJnHQU8dkmbea4hVsxBzBMBKMJdD+FMiXPdxlgSpOqYGLLpoA1IlS1BVMsVP5IAp/BYeFBsOQozzPwJRMcqcOF+NHF+Tu8vfRK4UjxQXjjNtHLU0+HZJ3zYmjViGeJi0JjHUR7L6jSvGlD79lfpwNqyBOhyQm1SsUBf3MdVw=
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

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClVw
ZGF0ZSBidyB2YWxpZGF0aW9uIHRvIHVzZSBwcmV2IGFuZCBuZXh0IG9kbSBwaXBlIHBvaW50ZXJz
CmZvciBwb3B1bGF0aW5nIGRtbCBpbnB1dHMuCgpTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gTGFrdHl1
c2hraW4gPERteXRyby5MYWt0eXVzaGtpbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxlbmUg
TGl1IDxDaGFybGVuZS5MaXVAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxC
aGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYyB8IDQwICsrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxOSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IGFh
MTM0MmNjZjhiNC4uNDc3ODg1ODE2ODU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAtMTYwMCwxMiArMTYwMCw4
IEBAIHN0YXRpYyBib29sIGRjbjIwX3NwbGl0X3N0cmVhbV9mb3Jfb2RtKAogCQlzdHJ1Y3QgcGlw
ZV9jdHggKm5leHRfb2RtX3BpcGUpCiB7CiAJaW50IHBpcGVfaWR4ID0gbmV4dF9vZG1fcGlwZS0+
cGlwZV9pZHg7Ci0Jc3RydWN0IHNjYWxlcl9kYXRhICpzZCA9ICZwcmV2X29kbV9waXBlLT5wbGFu
ZV9yZXMuc2NsX2RhdGE7Ci0Jc3RydWN0IHBpcGVfY3R4ICpzZWNfbmV4dF9waXBlID0gbmV4dF9v
ZG1fcGlwZS0+bmV4dF9vZG1fcGlwZTsKLQlpbnQgbmV3X3dpZHRoOwogCiAJKm5leHRfb2RtX3Bp
cGUgPSAqcHJldl9vZG1fcGlwZTsKLQluZXh0X29kbV9waXBlLT5uZXh0X29kbV9waXBlID0gc2Vj
X25leHRfcGlwZTsKIAogCW5leHRfb2RtX3BpcGUtPnBpcGVfaWR4ID0gcGlwZV9pZHg7CiAJbmV4
dF9vZG1fcGlwZS0+cGxhbmVfcmVzLm1pID0gcG9vbC0+bWlzW25leHRfb2RtX3BpcGUtPnBpcGVf
aWR4XTsKQEAgLTE2MjcsMTEgKzE2MjMsMTEgQEAgc3RhdGljIGJvb2wgZGNuMjBfc3BsaXRfc3Ry
ZWFtX2Zvcl9vZG0oCiAJQVNTRVJUKG5leHRfb2RtX3BpcGUtPnRvcF9waXBlID09IE5VTEwpOwog
CiAJaWYgKHByZXZfb2RtX3BpcGUtPnBsYW5lX3N0YXRlKSB7CisJCXN0cnVjdCBzY2FsZXJfZGF0
YSAqc2QgPSAmcHJldl9vZG1fcGlwZS0+cGxhbmVfcmVzLnNjbF9kYXRhOworCQlpbnQgbmV3X3dp
ZHRoOworCiAJCS8qIEhBQ1RJVkUgaGFsdmVkIGZvciBvZG0gY29tYmluZSAqLwogCQlzZC0+aF9h
Y3RpdmUgLz0gMjsKLQkJLyogQ29weSBzY2xfZGF0YSB0byBzZWNvbmRhcnkgcGlwZSAqLwotCQlu
ZXh0X29kbV9waXBlLT5wbGFuZV9yZXMuc2NsX2RhdGEgPSAqc2Q7Ci0KIAkJLyogQ2FsY3VsYXRl
IG5ldyB2cCBhbmQgcmVjb3V0IGZvciBsZWZ0IHBpcGUgKi8KIAkJLyogTmVlZCBhdCBsZWFzdCAx
NiBwaXhlbHMgd2lkdGggcGVyIHNpZGUgKi8KIAkJaWYgKHNkLT5yZWNvdXQueCArIDE2ID49IHNk
LT5oX2FjdGl2ZSkKQEAgLTE2NDUsMTAgKzE2NDEsMTIgQEAgc3RhdGljIGJvb2wgZGNuMjBfc3Bs
aXRfc3RyZWFtX2Zvcl9vZG0oCiAKIAkJLyogQ2FsY3VsYXRlIG5ldyB2cCBhbmQgcmVjb3V0IGZv
ciByaWdodCBwaXBlICovCiAJCXNkID0gJm5leHRfb2RtX3BpcGUtPnBsYW5lX3Jlcy5zY2xfZGF0
YTsKLQkJbmV3X3dpZHRoID0gc2QtPnJlY291dC53aWR0aCArIHNkLT5yZWNvdXQueCAtIHNkLT5o
X2FjdGl2ZTsKKwkJLyogSEFDVElWRSBoYWx2ZWQgZm9yIG9kbSBjb21iaW5lICovCisJCXNkLT5o
X2FjdGl2ZSAvPSAyOwogCQkvKiBOZWVkIGF0IGxlYXN0IDE2IHBpeGVscyB3aWR0aCBwZXIgc2lk
ZSAqLwogCQlpZiAobmV3X3dpZHRoIDw9IDE2KQogCQkJcmV0dXJuIGZhbHNlOworCQluZXdfd2lk
dGggPSBzZC0+cmVjb3V0LndpZHRoICsgc2QtPnJlY291dC54IC0gc2QtPmhfYWN0aXZlOwogCQlz
ZC0+dmlld3BvcnQud2lkdGggLT0gZGNfZml4cHRfZmxvb3IoZGNfZml4cHRfbXVsX2ludCgKIAkJ
CQlzZC0+cmF0aW9zLmhvcnosIHNkLT5yZWNvdXQud2lkdGggLSBuZXdfd2lkdGgpKTsKIAkJc2Qt
PnZpZXdwb3J0X2Mud2lkdGggLT0gZGNfZml4cHRfZmxvb3IoZGNfZml4cHRfbXVsX2ludCgKQEAg
LTE4MTgsNiArMTgxNiwxOSBAQCBpbnQgZGNuMjBfcG9wdWxhdGVfZG1sX3BpcGVzX2Zyb21fY29u
dGV4dCgKIAkJcGlwZXNbcGlwZV9jbnRdLmRvdXQuZHBfbGFuZXMgPSA0OwogCQlwaXBlc1twaXBl
X2NudF0ucGlwZS5kZXN0LnZ0b3RhbF9taW4gPSByZXNfY3R4LT5waXBlX2N0eFtpXS5zdHJlYW0t
PmFkanVzdC52X3RvdGFsX21pbjsKIAkJcGlwZXNbcGlwZV9jbnRdLnBpcGUuZGVzdC52dG90YWxf
bWF4ID0gcmVzX2N0eC0+cGlwZV9jdHhbaV0uc3RyZWFtLT5hZGp1c3Qudl90b3RhbF9tYXg7CisJ
CXBpcGVzW3BpcGVfY250XS5waXBlLmRlc3Qub2RtX2NvbWJpbmUgPSByZXNfY3R4LT5waXBlX2N0
eFtpXS5wcmV2X29kbV9waXBlCisJCQkJCQkJfHwgcmVzX2N0eC0+cGlwZV9jdHhbaV0ubmV4dF9v
ZG1fcGlwZTsKKwkJcGlwZXNbcGlwZV9jbnRdLnBpcGUuc3JjLmhzcGxpdF9ncnAgPSByZXNfY3R4
LT5waXBlX2N0eFtpXS5waXBlX2lkeDsKKwkJaWYgKHJlc19jdHgtPnBpcGVfY3R4W2ldLnRvcF9w
aXBlICYmIHJlc19jdHgtPnBpcGVfY3R4W2ldLnRvcF9waXBlLT5wbGFuZV9zdGF0ZQorCQkJCT09
IHJlc19jdHgtPnBpcGVfY3R4W2ldLnBsYW5lX3N0YXRlKQorCQkJcGlwZXNbcGlwZV9jbnRdLnBp
cGUuc3JjLmhzcGxpdF9ncnAgPSByZXNfY3R4LT5waXBlX2N0eFtpXS50b3BfcGlwZS0+cGlwZV9p
ZHg7CisJCWVsc2UgaWYgKHJlc19jdHgtPnBpcGVfY3R4W2ldLnByZXZfb2RtX3BpcGUpIHsKKwkJ
CXN0cnVjdCBwaXBlX2N0eCAqZmlyc3RfcGlwZSA9IHJlc19jdHgtPnBpcGVfY3R4W2ldLnByZXZf
b2RtX3BpcGU7CisKKwkJCXdoaWxlIChmaXJzdF9waXBlLT5wcmV2X29kbV9waXBlKQorCQkJCWZp
cnN0X3BpcGUgPSBmaXJzdF9waXBlLT5wcmV2X29kbV9waXBlOworCQkJcGlwZXNbcGlwZV9jbnRd
LnBpcGUuc3JjLmhzcGxpdF9ncnAgPSBmaXJzdF9waXBlLT5waXBlX2lkeDsKKwkJfQogCiAJCXN3
aXRjaCAocmVzX2N0eC0+cGlwZV9jdHhbaV0uc3RyZWFtLT5zaWduYWwpIHsKIAkJY2FzZSBTSUdO
QUxfVFlQRV9ESVNQTEFZX1BPUlRfTVNUOgpAQCAtMTg3MCw3ICsxODgxLDYgQEAgaW50IGRjbjIw
X3BvcHVsYXRlX2RtbF9waXBlc19mcm9tX2NvbnRleHQoCiAJCQlicmVhazsKIAkJfQogCi0KIAkJ
c3dpdGNoIChyZXNfY3R4LT5waXBlX2N0eFtpXS5zdHJlYW0tPnRpbWluZy5waXhlbF9lbmNvZGlu
ZykgewogCQljYXNlIFBJWEVMX0VOQ09ESU5HX1JHQjoKIAkJY2FzZSBQSVhFTF9FTkNPRElOR19Z
Q0JDUjQ0NDoKQEAgLTE4OTIsMTAgKzE5MDIsNiBAQCBpbnQgZGNuMjBfcG9wdWxhdGVfZG1sX3Bp
cGVzX2Zyb21fY29udGV4dCgKIAkJCXBpcGVzW3BpcGVfY250XS5kb3V0Lm91dHB1dF9mb3JtYXQg
PSBkbV80NDQ7CiAJCQlwaXBlc1twaXBlX2NudF0uZG91dC5vdXRwdXRfYnBwID0gb3V0cHV0X2Jw
YyAqIDM7CiAJCX0KLQkJcGlwZXNbcGlwZV9jbnRdLnBpcGUuc3JjLmhzcGxpdF9ncnAgPSByZXNf
Y3R4LT5waXBlX2N0eFtpXS5waXBlX2lkeDsKLQkJaWYgKHJlc19jdHgtPnBpcGVfY3R4W2ldLnRv
cF9waXBlICYmIHJlc19jdHgtPnBpcGVfY3R4W2ldLnRvcF9waXBlLT5wbGFuZV9zdGF0ZQotCQkJ
CT09IHJlc19jdHgtPnBpcGVfY3R4W2ldLnBsYW5lX3N0YXRlKQotCQkJcGlwZXNbcGlwZV9jbnRd
LnBpcGUuc3JjLmhzcGxpdF9ncnAgPSByZXNfY3R4LT5waXBlX2N0eFtpXS50b3BfcGlwZS0+cGlw
ZV9pZHg7CiAKIAkJLyogdG9kbzogZGVmYXVsdCBtYXggZm9yIG5vdywgdW50aWwgdGhlcmUgaXMg
bG9naWMgcmVmbGVjdGluZyB0aGlzIGluIGRjKi8KIAkJcGlwZXNbcGlwZV9jbnRdLmRvdXQub3V0
cHV0X2JwYyA9IDEyOwpAQCAtMTk0NCwxNCArMTk1MCw2IEBAIGludCBkY24yMF9wb3B1bGF0ZV9k
bWxfcGlwZXNfZnJvbV9jb250ZXh0KAogCQkJCQkmJiByZXNfY3R4LT5waXBlX2N0eFtpXS5ib3R0
b21fcGlwZS0+cGxhbmVfc3RhdGUgPT0gcGxuKQogCQkJCQl8fCAocmVzX2N0eC0+cGlwZV9jdHhb
aV0udG9wX3BpcGUKIAkJCQkJJiYgcmVzX2N0eC0+cGlwZV9jdHhbaV0udG9wX3BpcGUtPnBsYW5l
X3N0YXRlID09IHBsbik7Ci0JCQlwaXBlc1twaXBlX2NudF0ucGlwZS5kZXN0Lm9kbV9jb21iaW5l
ID0gKHJlc19jdHgtPnBpcGVfY3R4W2ldLmJvdHRvbV9waXBlCi0JCQkJCSYmIHJlc19jdHgtPnBp
cGVfY3R4W2ldLmJvdHRvbV9waXBlLT5wbGFuZV9zdGF0ZSA9PSBwbG4KLQkJCQkJJiYgcmVzX2N0
eC0+cGlwZV9jdHhbaV0uYm90dG9tX3BpcGUtPnN0cmVhbV9yZXMub3BwCi0JCQkJCQkhPSByZXNf
Y3R4LT5waXBlX2N0eFtpXS5zdHJlYW1fcmVzLm9wcCkKLQkJCQl8fCAocmVzX2N0eC0+cGlwZV9j
dHhbaV0udG9wX3BpcGUKLQkJCQkJJiYgcmVzX2N0eC0+cGlwZV9jdHhbaV0udG9wX3BpcGUtPnBs
YW5lX3N0YXRlID09IHBsbgotCQkJCQkmJiByZXNfY3R4LT5waXBlX2N0eFtpXS50b3BfcGlwZS0+
c3RyZWFtX3Jlcy5vcHAKLQkJCQkJCSE9IHJlc19jdHgtPnBpcGVfY3R4W2ldLnN0cmVhbV9yZXMu
b3BwKTsKIAkJCXBpcGVzW3BpcGVfY250XS5waXBlLnNyYy5zb3VyY2Vfc2NhbiA9IHBsbi0+cm90
YXRpb24gPT0gUk9UQVRJT05fQU5HTEVfOTAKIAkJCQkJfHwgcGxuLT5yb3RhdGlvbiA9PSBST1RB
VElPTl9BTkdMRV8yNzAgPyBkbV92ZXJ0IDogZG1faG9yejsKIAkJCXBpcGVzW3BpcGVfY250XS5w
aXBlLnNyYy52aWV3cG9ydF95X3kgPSBzY2wtPnZpZXdwb3J0Lnk7Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
