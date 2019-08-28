Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85A4A0BFD
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 23:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB7C89F08;
	Wed, 28 Aug 2019 21:04:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720045.outbound.protection.outlook.com [40.107.72.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB9089F07
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 21:04:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElXBq4K+CprYbjcGKvaklSjeNq9E2bYQtmSq0saMwT/f1DxXa+ROCZqYYuAgv4iSYr/OvjP9+cmvJ4eztJ0+mTVnfMKrBXz56oHDv5hF+I744Pt9g6H99oxvIZGTIgMyflbuBAv8qVnrpGUgLxp/7uib1AvCtNncgEcAK44y8+cn2RtziJqSvUEV6dOquHd18O4YlP0i4svzPI0DliWV4xBtfak9XtuV++o7i0ihS1Ela/rQrKJ2DXShHeHxvgbiwXs/6cP1OsLGLw1cIol4OO+5lEn65g57JE/Uu3k+vvIro7fjZA/8ee0us9ILWTd0RwFwdoLUDsDZcbOZ3f6PLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCmZLvrs19SOiCe5fII4asxywSlqHb21JKcR0rwjd1M=;
 b=g438fn5iKnYLx1A5SZXKcveSgL6SvG+fgw6r5s0rqQZA3Bkx81AhR7szT13cEoQsHeHshS8YEUCI9ss85MWKOnTEjoMPQua0gfpypROSx6V3s8XyvGx27yTlmUkRk7dxw6LfFnaUhIMxPejKsRr7OugvsqQmFY7h4o1W250UgPkq2/dYXILvoVbueUfll/I4/BcHCPTG48Pp75gIjDOrv892hRKoFghNf7pKrLCCaBEoaaOKfxFSBzAP1AnNuF1gr++eE0fIZM2LPKiHG758yrXwfHZoAZfgd/l1x/YHXN1Z3lKpRBd2RhS8bfTlUp6zqdYsSNk4BJ93CEjLIQ8A7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0051.namprd12.prod.outlook.com (2603:10b6:0:56::19) by
 CY4PR12MB1525.namprd12.prod.outlook.com (2603:10b6:910:11::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 21:04:05 +0000
Received: from BY2NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by DM3PR12CA0051.outlook.office365.com
 (2603:10b6:0:56::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Wed, 28 Aug 2019 21:04:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT004.mail.protection.outlook.com (10.152.84.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 21:04:05 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 16:04:02 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/17] drm/amd/display: refine i2c over aux
Date: Wed, 28 Aug 2019 17:03:39 -0400
Message-ID: <20190828210354.21464-3-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
References: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(2980300002)(428003)(199004)(189003)(186003)(36756003)(446003)(8936002)(426003)(2351001)(5660300002)(48376002)(476003)(53416004)(11346002)(2616005)(8676002)(86362001)(81166006)(81156014)(126002)(50226002)(4326008)(53936002)(336012)(50466002)(478600001)(486006)(70586007)(305945005)(76176011)(2906002)(26005)(16586007)(70206006)(6916009)(47776003)(1076003)(356004)(7696005)(6666004)(51416003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1525; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83350438-3101-40b7-34aa-08d72bfb42bb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1525; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1525:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1525C9FCE009B9D2390A8F9EF9A30@CY4PR12MB1525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4oMFZmCXz5gmcIe3FuJ6jG53EzVK40GOtJIUehjyeT7QjFuLX0rCrom0eseCAO1D0GmetyKuNmX/kriqI8vqPAmCcPFMqhWqdMiyqKpsCpJ7cE4MHwTQm6QSXKwAufS9ScjHkNUKzLPzCvgTSYHAWQh1uxdzDKvusd4+oiWxD/NaDWRtuQfytTZEwn6Xc2rHbgbAuLgW/fAcgL0UngvY3jnPRsLCOTBsV4MhxG9GCSJPP0NDZyRAmAZ8N+mW3xJzt0yjLfBTLRAUXTroN8S8qMimUGPoFmS92hlfhs0moOD/k4uh5WTMUZzgV4aCCfwjXWweBrOQLfy5Zb1NMbe1L3Vq6B2B4yyfDp7YIvWviMNcubmg4WGZ8kZdl8szjZ2buBGImzYx+E59iA5kqo4kp3wPqhBlJD+9W3LgjUP5Ot8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 21:04:05.1083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83350438-3101-40b7-34aa-08d72bfb42bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1525
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCmZLvrs19SOiCe5fII4asxywSlqHb21JKcR0rwjd1M=;
 b=HdEyeqVAMnb0fQWB7z/nu1GD909oInx57UFMW+qJ/P6H2YWdoOsD9hbLil4ibQyxmNp1nq1iDjRQiSEIfaMdFqg/F3jLHy+gfwv0DEWq8IQ5sYLZINfWBPdZSrlxoS1uWoiS4nBaj2cjHgJAuM794jR8gZF5hxwsR//kKZolFes=
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
Cc: Lewis Huang <Lewis.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+CgpbV2h5XQpXaGVuIHVzZXIg
bW9kZSB1c2UgaTJjIG92ZXIgYXV4IHRocm91Z2ggQURMIG9yIERESSwgdGhlIGZ1bmN0aW9uCmRh
bF9kZGNfc2VydmljZV9xdWVyeV9kZGNfZGF0YSB3aWxsIGJlIGNhbGxlZC4gVGhlcmUgYXJlIHR3
byBpc3N1ZXMuCgoxLiBXaGVuIHJlYWQvd3JpdGUgbGVuZ3RoID4gMTZieXRlLCBjdXJyZW50IGFs
d2F5cyByZXR1cm4gZmFsc2UgYmVjYXVzZQp0aGUgREVGQVVMVF9BVVhfTUFYX0RBVEFfU0laRSAh
PSBsZW5ndGguCjIuIFdoZW4gdXNlcm1vZGUgb25seSBuZWVkIHRvIHJlYWQgZGF0YSB0aHJvdWdo
IGkyYywgZHJpdmVyIHdpbGwgd3JpdGUKbW90ID0gdHJ1ZSBhdCB0aGUgc2FtZSBhZGRyZXNzIGFu
ZCBjYXVzZSBpMmMgc2luayBjb25mdXNlZC4gVGhlcmVmb3JlCnRoZSBmb2xsb3dpbmcgcmVhZCBj
b21tYW5kIHdpbGwgZ2V0IGdhcmJhZ2UuCgpbSG93XQoxLiBBZGQgZnVuY3Rpb24gZGFsX2RjY19z
dWJtaXRfYXV4X2NvbW1hbmQgdG8gaGFuZGxlIGxlbmd0aCA+IDE2IGJ5dGUuCjIuIENoZWNrIHJl
YWQgc2l6ZSBhbmQgd3JpdGUgc2l6ZSB3aGVuIHF1ZXJ5IGRkYyBkYXRhLgoKU2lnbmVkLW9mZi1i
eTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaGFybGVu
ZSBMaXUgPENoYXJsZW5lLkxpdUBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEg
PEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2RkYy5jIHwgODcgKysrKysrKysrKysrKy0tLS0tLQogLi4uL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2RjX2xpbmtfZGRjLmggIHwgIDMgKwogMiBmaWxlcyBjaGFu
Z2VkLCA2MyBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RkYy5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kZGMuYwppbmRleCA3ZmQyZDEzNThm
MWIuLmY3MDEzN2Q2N2M4MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGlua19kZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2RkYy5jCkBAIC00OTQsNyArNDk0LDcgQEAgYm9vbCBkYWxfZGRjX3Nl
cnZpY2VfcXVlcnlfZGRjX2RhdGEoCiAJdWludDhfdCAqcmVhZF9idWYsCiAJdWludDMyX3QgcmVh
ZF9zaXplKQogewotCWJvb2wgcmV0OworCWJvb2wgcmV0ID0gZmFsc2U7CiAJdWludDMyX3QgcGF5
bG9hZF9zaXplID0KIAkJZGFsX2RkY19zZXJ2aWNlX2lzX2luX2F1eF90cmFuc2FjdGlvbl9tb2Rl
KGRkYykgPwogCQkJREVGQVVMVF9BVVhfTUFYX0RBVEFfU0laRSA6IEVESURfU0VHTUVOVF9TSVpF
OwpAQCAtNTEzLDM0ICs1MTMsMzIgQEAgYm9vbCBkYWxfZGRjX3NlcnZpY2VfcXVlcnlfZGRjX2Rh
dGEoCiAJLypUT0RPOiBsZW4gb2YgcGF5bG9hZCBkYXRhIGZvciBpMmMgYW5kIGF1eCBpcyB1aW50
OCEhISEsCiAJICogIGJ1dCB3ZSB3YW50IHRvIHJlYWQgMjU2IG92ZXIgaTJjISEhISovCiAJaWYg
KGRhbF9kZGNfc2VydmljZV9pc19pbl9hdXhfdHJhbnNhY3Rpb25fbW9kZShkZGMpKSB7Ci0JCXN0
cnVjdCBhdXhfcGF5bG9hZCB3cml0ZV9wYXlsb2FkID0gewotCQkJLmkyY19vdmVyX2F1eCA9IHRy
dWUsCi0JCQkud3JpdGUgPSB0cnVlLAotCQkJLm1vdCA9IHRydWUsCi0JCQkuYWRkcmVzcyA9IGFk
ZHJlc3MsCi0JCQkubGVuZ3RoID0gd3JpdGVfc2l6ZSwKLQkJCS5kYXRhID0gd3JpdGVfYnVmLAot
CQkJLnJlcGx5ID0gTlVMTCwKLQkJCS5kZWZlcl9kZWxheSA9IGdldF9kZWZlcl9kZWxheShkZGMp
LAotCQl9OwotCi0JCXN0cnVjdCBhdXhfcGF5bG9hZCByZWFkX3BheWxvYWQgPSB7Ci0JCQkuaTJj
X292ZXJfYXV4ID0gdHJ1ZSwKLQkJCS53cml0ZSA9IGZhbHNlLAotCQkJLm1vdCA9IGZhbHNlLAot
CQkJLmFkZHJlc3MgPSBhZGRyZXNzLAotCQkJLmxlbmd0aCA9IHJlYWRfc2l6ZSwKLQkJCS5kYXRh
ID0gcmVhZF9idWYsCi0JCQkucmVwbHkgPSBOVUxMLAotCQkJLmRlZmVyX2RlbGF5ID0gZ2V0X2Rl
ZmVyX2RlbGF5KGRkYyksCi0JCX07Ci0KLQkJcmV0ID0gZGNfbGlua19hdXhfdHJhbnNmZXJfd2l0
aF9yZXRyaWVzKGRkYywgJndyaXRlX3BheWxvYWQpOworCQlzdHJ1Y3QgYXV4X3BheWxvYWQgcGF5
bG9hZDsKKwkJYm9vbCByZWFkX2F2YWlsYWJsZSA9IHRydWU7CisKKwkJcGF5bG9hZC5pMmNfb3Zl
cl9hdXggPSB0cnVlOworCQlwYXlsb2FkLmFkZHJlc3MgPSBhZGRyZXNzOworCQlwYXlsb2FkLnJl
cGx5ID0gTlVMTDsKKwkJcGF5bG9hZC5kZWZlcl9kZWxheSA9IGdldF9kZWZlcl9kZWxheShkZGMp
OworCisJCWlmICh3cml0ZV9zaXplICE9IDApIHsKKwkJCXBheWxvYWQud3JpdGUgPSB0cnVlOwor
CQkJcGF5bG9hZC5tb3QgPSB0cnVlOworCQkJcGF5bG9hZC5sZW5ndGggPSB3cml0ZV9zaXplOwor
CQkJcGF5bG9hZC5kYXRhID0gd3JpdGVfYnVmOworCisJCQlyZXQgPSBkYWxfZGRjX3N1Ym1pdF9h
dXhfY29tbWFuZChkZGMsICZwYXlsb2FkKTsKKwkJCXJlYWRfYXZhaWxhYmxlID0gcmV0OworCQl9
CiAKLQkJaWYgKCFyZXQpCi0JCQlyZXR1cm4gZmFsc2U7CisJCWlmIChyZWFkX3NpemUgIT0gMCAm
JiByZWFkX2F2YWlsYWJsZSkgeworCQkJcGF5bG9hZC53cml0ZSA9IGZhbHNlOworCQkJcGF5bG9h
ZC5tb3QgPSBmYWxzZTsKKwkJCXBheWxvYWQubGVuZ3RoID0gcmVhZF9zaXplOworCQkJcGF5bG9h
ZC5kYXRhID0gcmVhZF9idWY7CiAKLQkJcmV0ID0gZGNfbGlua19hdXhfdHJhbnNmZXJfd2l0aF9y
ZXRyaWVzKGRkYywgJnJlYWRfcGF5bG9hZCk7CisJCQlyZXQgPSBkYWxfZGRjX3N1Ym1pdF9hdXhf
Y29tbWFuZChkZGMsICZwYXlsb2FkKTsKKwkJfQogCX0gZWxzZSB7CiAJCXN0cnVjdCBpMmNfcGF5
bG9hZHMgKnBheWxvYWRzID0KIAkJCWRhbF9kZGNfaTJjX3BheWxvYWRzX2NyZWF0ZShkZGMtPmN0
eCwgcGF5bG9hZHNfbnVtKTsKQEAgLTU3MSw2ICs1NjksNDEgQEAgYm9vbCBkYWxfZGRjX3NlcnZp
Y2VfcXVlcnlfZGRjX2RhdGEoCiAJcmV0dXJuIHJldDsKIH0KIAorYm9vbCBkYWxfZGRjX3N1Ym1p
dF9hdXhfY29tbWFuZChzdHJ1Y3QgZGRjX3NlcnZpY2UgKmRkYywKKwkJc3RydWN0IGF1eF9wYXls
b2FkICpwYXlsb2FkKQoreworCXVpbnQ4X3QgcmV0cmlldmVkID0gMDsKKwlib29sIHJldCA9IDA7
CisKKwlpZiAoIWRkYykKKwkJcmV0dXJuIGZhbHNlOworCisJaWYgKCFwYXlsb2FkKQorCQlyZXR1
cm4gZmFsc2U7CisKKwlkbyB7CisJCXN0cnVjdCBhdXhfcGF5bG9hZCBjdXJyZW50X3BheWxvYWQ7
CisJCWJvb2wgaXNfZW5kX29mX3BheWxvYWQgPSAocmV0cmlldmVkICsgREVGQVVMVF9BVVhfTUFY
X0RBVEFfU0laRSkgPgorCQkJcGF5bG9hZC0+bGVuZ3RoID8gdHJ1ZSA6IGZhbHNlOworCisJCWN1
cnJlbnRfcGF5bG9hZC5hZGRyZXNzID0gcGF5bG9hZC0+YWRkcmVzczsKKwkJY3VycmVudF9wYXls
b2FkLmRhdGEgPSAmcGF5bG9hZC0+ZGF0YVtyZXRyaWV2ZWRdOworCQljdXJyZW50X3BheWxvYWQu
ZGVmZXJfZGVsYXkgPSBwYXlsb2FkLT5kZWZlcl9kZWxheTsKKwkJY3VycmVudF9wYXlsb2FkLmky
Y19vdmVyX2F1eCA9IHBheWxvYWQtPmkyY19vdmVyX2F1eDsKKwkJY3VycmVudF9wYXlsb2FkLmxl
bmd0aCA9IGlzX2VuZF9vZl9wYXlsb2FkID8KKwkJCXBheWxvYWQtPmxlbmd0aCAtIHJldHJpZXZl
ZCA6IERFRkFVTFRfQVVYX01BWF9EQVRBX1NJWkU7CisJCWN1cnJlbnRfcGF5bG9hZC5tb3QgPSBw
YXlsb2FkLT5tb3QgPyBwYXlsb2FkLT5tb3QgOiAhaXNfZW5kX29mX3BheWxvYWQ7CisJCWN1cnJl
bnRfcGF5bG9hZC5yZXBseSA9IHBheWxvYWQtPnJlcGx5OworCQljdXJyZW50X3BheWxvYWQud3Jp
dGUgPSBwYXlsb2FkLT53cml0ZTsKKworCQlyZXQgPSBkY19saW5rX2F1eF90cmFuc2Zlcl93aXRo
X3JldHJpZXMoZGRjLCAmY3VycmVudF9wYXlsb2FkKTsKKworCQlyZXRyaWV2ZWQgKz0gY3VycmVu
dF9wYXlsb2FkLmxlbmd0aDsKKwl9IHdoaWxlIChyZXRyaWV2ZWQgPCBwYXlsb2FkLT5sZW5ndGgg
JiYgcmV0ID09IHRydWUpOworCisJcmV0dXJuIHJldDsKK30KKwogLyogZGNfbGlua19hdXhfdHJh
bnNmZXJfcmF3KCkgLSBBdHRlbXB0IHRvIHRyYW5zZmVyCiAgKiB0aGUgZ2l2ZW4gYXV4IHBheWxv
YWQuICBUaGlzIGZ1bmN0aW9uIGRvZXMgbm90IHBlcmZvcm0KICAqIHJldHJpZXMgb3IgaGFuZGxl
IGVycm9yIHN0YXRlcy4gIFRoZSByZXBseSBpcyByZXR1cm5lZApkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9kY19saW5rX2RkYy5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9kY19saW5rX2RkYy5oCmluZGV4IGIxZmFiMjUxYzA5Yi4u
N2QzNWQwM2EyZDQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
aW5jL2RjX2xpbmtfZGRjLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2lu
Yy9kY19saW5rX2RkYy5oCkBAIC05NSw2ICs5NSw5IEBAIGJvb2wgZGFsX2RkY19zZXJ2aWNlX3F1
ZXJ5X2RkY19kYXRhKAogCQl1aW50OF90ICpyZWFkX2J1ZiwKIAkJdWludDMyX3QgcmVhZF9zaXpl
KTsKIAorYm9vbCBkYWxfZGRjX3N1Ym1pdF9hdXhfY29tbWFuZChzdHJ1Y3QgZGRjX3NlcnZpY2Ug
KmRkYywKKwkJc3RydWN0IGF1eF9wYXlsb2FkICpwYXlsb2FkKTsKKwogaW50IGRjX2xpbmtfYXV4
X3RyYW5zZmVyX3JhdyhzdHJ1Y3QgZGRjX3NlcnZpY2UgKmRkYywKIAkJc3RydWN0IGF1eF9wYXls
b2FkICpwYXlsb2FkLAogCQllbnVtIGF1eF9jaGFubmVsX29wZXJhdGlvbl9yZXN1bHQgKm9wZXJh
dGlvbl9yZXN1bHQpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
