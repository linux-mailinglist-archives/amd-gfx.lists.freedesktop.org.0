Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D198850F
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7922C6EEC7;
	Fri,  9 Aug 2019 21:38:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770047.outbound.protection.outlook.com [40.107.77.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C3E6EEC6
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oF0u5g/S4yEC56pNiODsSGpRaFGTc6i2cUYliRfL9DyuTpTYfDCWjlEnW+fkNoqaEhszUC+FKF5olOxtztZkJ4FRClpPfskipRqMfoDGjC0w61w/aOahRbALEbIgCTcHWtHyVWjN7AD18Y8nkZ28jAjXQxeKis4XINHsGGlfCfCRpKUCdcCrD+dnWYnCLzHYUWD9dPdvzwo9Uq0cZecs6syuEa1oKZzW0sRJ4L6u5spFR/TJjKr6kILtrHC2iXXK2duzhKjkUMwCwEp2a99P295hIqsXjJ+OCD08LnqaiCzLY2DHlTLPGtSyU3UrLofyFNjAsoYP2zWKsFe4N+pd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oxHT8oEGuZBRIsQYqk90xTsX8MoDf781TII5Fygz78=;
 b=CcrnY1dyGtxmMeEM/0qS6kCea+Q9xglBfUGv56X+hOXFEudL/I44fy2A/UigA37bttVB0Naj51adjwvxwGkPhsc70fiCU6PnqfaZuBquBHAvfvB3icQdZ1JPlG3qWHp2rF0Xh4JsJjYa5LC/zG8+lrPfu3ToBHzuhGTkhTpCi/smzqcP6mjlO4KdEzizb+trvdpjgnxub/UoC6ASLGU3kmrjmHVNRP9OTSDKd1e8DAm/MTnP/Te2QtaZ4azLuHGDZYxip1+MfrCJkBcD88euXXllypNQQ8Fh82Y2hZP5ndgYz60NqYUmDsRpgwzh2cJhaBYCMdIfPtsf6RkTnGHTaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0020.namprd12.prod.outlook.com
 (2603:10b6:405:4c::30) by BN6PR12MB1268.namprd12.prod.outlook.com
 (2603:10b6:404:1a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15; Fri, 9 Aug
 2019 21:38:52 +0000
Received: from DM3NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by BN6PR1201CA0020.outlook.office365.com
 (2603:10b6:405:4c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT003.mail.protection.outlook.com (10.152.82.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:51 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:42 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 38/49] drm/amd/display: Add enum for H-timing divider mode
Date: Fri, 9 Aug 2019 17:37:31 -0400
Message-ID: <20190809213742.30301-39-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(39850400004)(396003)(376002)(346002)(2980300002)(428003)(199004)(189003)(8936002)(47776003)(2906002)(2870700001)(1076003)(2876002)(305945005)(50226002)(356004)(5660300002)(8676002)(6666004)(48376002)(2351001)(11346002)(446003)(49486002)(51416003)(76176011)(6916009)(14444005)(86362001)(50466002)(126002)(81166006)(53936002)(486006)(2616005)(476003)(336012)(4326008)(70586007)(81156014)(426003)(70206006)(478600001)(36756003)(26005)(316002)(54906003)(186003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1268; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 965e5357-e3c6-4dfd-f630-08d71d11f8b5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1268; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1268:
X-Microsoft-Antispam-PRVS: <BN6PR12MB12683DB0F0A649E93D0591F382D60@BN6PR12MB1268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:556;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: M55LP/sV9NetnaPkEPiBfhKWaHKCNOnOuFlcQYlshR6EsYGCAgNmbapVE1YL/OArGEh00QvUEwwOgJ7gQV8EtxMoBVjQahF1/w2DWWXUFYif7N3k7YCxktgq4TAnrUEleLdUpwP5n+PLZ985ph7wbAfVCMmTehqwR1yLIhRkI98KHTv2Y1UymzT98/oNQehzUOrFqBffGK/oAT4+8OTe/cVSLB+MKkXt/GXOxv/SQMgacHpJYG8VPO1EHwmxHmznFRsrNoK1qhu6PMqultXo+C1OwtE0lHrrLyBrhnXUgyL4ITrv/84rNKuiwdnaH12d+1Ibdbg4zIMkaRZEajTnYv+E88SA9JW44kFwcHU9NbfKmtNG82iEaOD5Oj+4H/ZrPuX9uAP/zm9M91A48uaFYE58LJisgebjVTZ6FZ2aNC4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:51.9453 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 965e5357-e3c6-4dfd-f630-08d71d11f8b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oxHT8oEGuZBRIsQYqk90xTsX8MoDf781TII5Fygz78=;
 b=KJo2dHf2mEswKtN01ZvlOl0uULWN0Pq/EWJO6jpaiSK/HttEkCm/JF5kg6e3guZlv8ymepaleZ+kEOzyGhuj+/CcDJMkJF4VOiyKMltf1aMfghxHQuZ2oV8wxz9IY7WfislgfbBBXmPYDlz+BUxx0ZCMPz3KudojKKDSecSO5S0=
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
Cc: Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUWluZ3FpbmcgWmh1byA8cWluZ3Fpbmcuemh1b0BhbWQuY29tPgoKQWRkIGhfdGltaW5n
X2Rpdl9tb2RlIGVudW0gdG8gYmV0dGVyIHJlZmxlY3QgcG9zc2libGUgcmVnaXN0ZXIKdmFsdWVz
LiBSZXBsYWNlIHByZXZpb3VzbHkgcHJvZ3JhbW1lZCB2YWx1ZXMgd2l0aCBlbnVtCgpTaWduZWQt
b2ZmLWJ5OiBRaW5ncWluZyBaaHVvIDxxaW5ncWluZy56aHVvQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBEbXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5MYWt0eXVzaGtpbkBhbWQuY29tPgpBY2tlZC1i
eTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjEwL2RjbjEwX29wdGMuYyAgICAgICAgfCA5ICsrKysrLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody90aW1pbmdfZ2VuZXJhdG9yLmggfCA1ICsr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX29w
dGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9vcHRjLmMK
aW5kZXggYjYzMTc4NmE0YTM0Li5lNWU1YmU2MzAzMmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9vcHRjLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX29wdGMuYwpAQCAtMTU0LDcgKzE1NCw3IEBA
IHZvaWQgb3B0YzFfcHJvZ3JhbV90aW1pbmcoCiAJdWludDMyX3QgaF9zeW5jX3BvbGFyaXR5LCB2
X3N5bmNfcG9sYXJpdHk7CiAJdWludDMyX3Qgc3RhcnRfcG9pbnQgPSAwOwogCXVpbnQzMl90IGZp
ZWxkX251bSA9IDA7Ci0JdWludDMyX3QgaF9kaXZfMjsKKwllbnVtIGhfdGltaW5nX2Rpdl9tb2Rl
IGhfZGl2ID0gSF9USU1JTkdfTk9fRElWOwogCiAJc3RydWN0IG9wdGMgKm9wdGMxID0gRENOMTBU
R19GUk9NX1RHKG9wdGMpOwogCkBAIC0yODUsMTAgKzI4NSwxMSBAQCB2b2lkIG9wdGMxX3Byb2dy
YW1fdGltaW5nKAogCSAqIG9mIHN0ZXJlbyBoYW5kbGVkIGluIGV4cGxpY2l0IGNhbGwKIAkgKi8K
IAotCWhfZGl2XzIgPSBvcHRjMV9pc190d29fcGl4ZWxzX3Blcl9jb250YWludGVyKCZwYXRjaGVk
X2NydGNfdGltaW5nKTsKLQlSRUdfVVBEQVRFKE9UR19IX1RJTUlOR19DTlRMLAotCQkJT1RHX0hf
VElNSU5HX0RJVl9CWTIsIGhfZGl2XzIgfHwgb3B0YzEtPm9wcF9jb3VudCA9PSAyKTsKKwlpZiAo
b3B0YzFfaXNfdHdvX3BpeGVsc19wZXJfY29udGFpbnRlcigmcGF0Y2hlZF9jcnRjX3RpbWluZykg
fHwgb3B0YzEtPm9wcF9jb3VudCA9PSAyKQorCQloX2RpdiA9IEhfVElNSU5HX0RJVl9CWTI7CiAK
KwlSRUdfVVBEQVRFKE9UR19IX1RJTUlOR19DTlRMLAorCQlPVEdfSF9USU1JTkdfRElWX0JZMiwg
aF9kaXYpOwogfQogCiB2b2lkIG9wdGMxX3NldF92dGdfcGFyYW1zKHN0cnVjdCB0aW1pbmdfZ2Vu
ZXJhdG9yICpvcHRjLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2luYy9ody90aW1pbmdfZ2VuZXJhdG9yLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvaW5jL2h3L3RpbWluZ19nZW5lcmF0b3IuaAppbmRleCAxZjgzY2I3YzdkZDQuLmY2MDdlZjI0
Yzc2NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody90
aW1pbmdfZ2VuZXJhdG9yLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2lu
Yy9ody90aW1pbmdfZ2VuZXJhdG9yLmgKQEAgLTk2LDYgKzk2LDExIEBAIGVudW0gY3JjX3NlbGVj
dGlvbiB7CiAJSU5URVJTRUNUX1dJTkRPV19OT1RfQV9OT1RfQiwKIH07CiAKK2VudW0gaF90aW1p
bmdfZGl2X21vZGUgeworCUhfVElNSU5HX05PX0RJViwKKwlIX1RJTUlOR19ESVZfQlkyLAorfTsK
Kwogc3RydWN0IGNyY19wYXJhbXMgewogCS8qIFJlZ2lvbnMgdXNlZCB0byBjYWxjdWxhdGUgQ1JD
Ki8KIAl1aW50MTZfdCB3aW5kb3dhX3hfc3RhcnQ7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
