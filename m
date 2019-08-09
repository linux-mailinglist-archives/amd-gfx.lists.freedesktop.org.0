Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4671588504
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448DE6EEBB;
	Fri,  9 Aug 2019 21:38:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810075.outbound.protection.outlook.com [40.107.81.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED2E6EEB8
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8dmrVyt3pWe6hawKDPYhCyeJ0yAhRJaIk11rBLpnL4z4pBy1W+VpSpvbl4e7v6Fgw43eEMCIhyHMAzQkzus5+siwQ2OGpo5myj0CaVWSFVnYTkc9MZxhC1VErOTJ1Wcf/UKv3CoGo+6SSCXNC8HE6lSapk0+U8tDH+H3I5gddFfRZlnXONJzaICRMe9mR+fe8erb0yc2IdadQ82RrxOU41hFn8/uvEGTEIlQyH2/pK2V0h9g4pUU/QcDzLPAIKTh9ggVJOsgAYDGxQTLxEdi6kncQucqzGWdwrn1w7Xq14GfyRNjAWykh0G9tnxxN+fYwU3mDjOkAk5ROpSDXg0rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8n14W2lnGispW3lBZ50OeRQeCgeCUMfVpPz1vA/FcU=;
 b=DWBeed4rFVhSvlZXkg0pw4oP0WjRbc4KYuJuL6y3BeNceS4uJFx17gMzFX15THMADF/z+6saPSHY93tBnTobYOz/Q/nVbnsmCLnuIsdQm5hubc7DQrJm8PM6m+YSdhKu0hsRxpQhDpnteQkfm2pNfLu6y6pR5ZUyzias7RZ0clxFTpBJ8YxTolexPRmL3YygAQiGLtAXPwe7d0S9C9OpKJTKww9BA5H8EtgcTcOYBANHywD82PFZQbFxAvqtMo2O986HXTajEo3+FX4M+n95wmfbsLlUzDjPj5tICUx/hzZ1vJYthnj8sqOpZMcqpqbVcElLX5rV5ODX46wSA6gSIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:910:16::12) by BN6PR12MB1267.namprd12.prod.outlook.com
 (2603:10b6:404:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Fri, 9 Aug
 2019 21:38:42 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by CY4PR1201CA0002.outlook.office365.com
 (2603:10b6:910:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:41 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:38 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 29/49] drm/amd/display: Enable type C hotplug
Date: Fri, 9 Aug 2019 17:37:22 -0400
Message-ID: <20190809213742.30301-30-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(305945005)(6666004)(2870700001)(11346002)(5024004)(2876002)(486006)(126002)(45080400002)(47776003)(2616005)(70206006)(476003)(48376002)(1076003)(50226002)(54906003)(426003)(70586007)(478600001)(356004)(2906002)(446003)(53936002)(36756003)(316002)(5660300002)(8936002)(81156014)(336012)(2351001)(51416003)(14444005)(50466002)(8676002)(4326008)(6916009)(81166006)(186003)(86362001)(76176011)(49486002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1267; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 895dfc08-d4a3-4a3b-3055-08d71d11f2ac
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1267; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1267:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1267C27AF217CC69CB88323B82D60@BN6PR12MB1267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +wXFbfbANYSKc9EyAUCMr6O+lqYwWSgwm1iiQhHFOzIefwHNtBFDa7jrAjY3u2TIBCZwR4UTtQ9wByZYhsgWAI/lPd1AslD6trV9CyC2dO+l08sQx3RZknkcifsk+mViPLeLKGL5sBUNqxYp+B9HpfArax2eR5HQqQ2xXCcYiGgjKSP5l5r7L5/r/cELYJ8ltTR7DcR28nfNkqWTWpVbn+payJD7xtnPZAunku/Axb9VGMxB1g6JUBaroerHcEX7h34HNVXVOxvwug323OmQc+8c56cx4/uKiaLXvG0QBByMTNnACfHUYx7mBK1Ek1cFaqh0UBpiTKwrl0Of3SHcnzM0v5FouUoZISYK+OWti3CFv7Vm1ykFOa4xe31Vxx57xayftvzYvIeneNaz0YKz24uIngbO4hb4fJvnCF0m+2E=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:41.8164 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 895dfc08-d4a3-4a3b-3055-08d71d11f2ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8n14W2lnGispW3lBZ50OeRQeCgeCUMfVpPz1vA/FcU=;
 b=j3v4Xj+SHyo2V5gOz2n9BYbYsYpNaKiIoZaSdMkzDF2XITeg+Dj0FGP76nZUAnh3fXohRV6CMBqyaJnQrPW6rEXkAc0FI9kiJ+HeakN/nnh+pMYhABmWOl5ryG4s+RPcY3FlGsSIOIv3iLRin2IJzv7TU6fBCawgUQ/PEmlRVGU=
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
Cc: Leo Li <sunpeng.li@amd.com>, Eric Yang <eric.yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5IGFuZCBIb3ddCldlIHdh
bnQgdG8gY2hhbmdlIHdoZXJlIHRpbWluZyBpcyBkb25lIGZvciBhbHQgbW9kZS4KU29tZSBvZiB0
aGUgY29tbWVudGVkIG91dCAjaWZzIGFyZSBuZWVkZWQgZm9yIERDTjIwCnNvIHdlIGVuYWJsZSB0
aGVtIGZvciB0aGF0IGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiBFcmljIFlhbmcgPEVyaWMuWWFuZzJA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEVyaWMgWWFuZyA8ZXJpYy55YW5nMkBhbWQuY29tPgpBY2tl
ZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIHwgNTkgKysrKysrKysrKysrKysrKysrKwogLi4u
L2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rlci5oIHwgIDEgKwogLi4uL2Ry
bS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvbGlua19lbmNvZGVyLmggIHwgIDEgKwogMyBmaWxlcyBj
aGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGluay5jCmluZGV4IGNhMTJjNjZhNGUwNi4uMWEzMDA2NmFjNjA1IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCkBAIC02ODIs
NiArNjgyLDU2IEBAIHN0YXRpYyBib29sIGlzX3NhbWVfZWRpZChzdHJ1Y3QgZGNfZWRpZCAqb2xk
X2VkaWQsIHN0cnVjdCBkY19lZGlkICpuZXdfZWRpZCkKIAlyZXR1cm4gKG1lbWNtcChvbGRfZWRp
ZC0+cmF3X2VkaWQsIG5ld19lZGlkLT5yYXdfZWRpZCwgbmV3X2VkaWQtPmxlbmd0aCkgPT0gMCk7
CiB9CiAKK2Jvb2wgd2FpdF9mb3JfYWx0X21vZGUoc3RydWN0IGRjX2xpbmsgKmxpbmspCit7CisK
KwkvKioKKwkgKiBzb21ldGhpbmcgaXMgdGVycmlibHkgd3JvbmcgaWYgdGltZSBvdXQgaXMgPiAy
MDBtcy4gKDVIeikKKwkgKiA1MDAgbWljcm9zZWNvbmRzICogNDAwIHRyaWVzIHVzIDIwMCBtcwor
CSAqKi8KKwl1bnNpZ25lZCBpbnQgc2xlZXBfdGltZV9pbl9taWNyb3NlY29uZHMgPSA1MDA7CisJ
dW5zaWduZWQgaW50IHRyaWVzX2FsbG93ZWQgPSA0MDA7CisJYm9vbCBpc19pbl9hbHRfbW9kZTsK
Kwl1bnNpZ25lZCBsb25nIGxvbmcgZW50ZXJfdGltZXN0YW1wOworCXVuc2lnbmVkIGxvbmcgbG9u
ZyBmaW5pc2hfdGltZXN0YW1wOworCXVuc2lnbmVkIGxvbmcgbG9uZyB0aW1lX3Rha2VuX2luX25z
OworCWludCB0cmllc190YWtlbjsKKworCURDX0xPR0dFUl9JTklUKGxpbmstPmN0eC0+bG9nZ2Vy
KTsKKworCWlmIChsaW5rLT5saW5rX2VuYy0+ZnVuY3MtPmlzX2luX2FsdF9tb2RlID09IE5VTEwp
CisJCXJldHVybiB0cnVlOworCisJaXNfaW5fYWx0X21vZGUgPSBsaW5rLT5saW5rX2VuYy0+ZnVu
Y3MtPmlzX2luX2FsdF9tb2RlKGxpbmstPmxpbmtfZW5jKTsKKwlEQ19MT0dfV0FSTklORygiRFAg
QWx0IG1vZGUgc3RhdGUgb24gSFBEOiAlZFxuIiwgaXNfaW5fYWx0X21vZGUpOworCisJaWYgKGlz
X2luX2FsdF9tb2RlKQorCQlyZXR1cm4gdHJ1ZTsKKworCWVudGVyX3RpbWVzdGFtcCA9IGRtX2dl
dF90aW1lc3RhbXAobGluay0+Y3R4KTsKKworCWZvciAodHJpZXNfdGFrZW4gPSAwOyB0cmllc190
YWtlbiA8IHRyaWVzX2FsbG93ZWQ7IHRyaWVzX3Rha2VuKyspIHsKKwkJdWRlbGF5KHNsZWVwX3Rp
bWVfaW5fbWljcm9zZWNvbmRzKTsKKwkJLyogYXNrIHRoZSBsaW5rIGlmIGFsdCBtb2RlIGlzIGVu
YWJsZWQsIGlmIHNvIHJldHVybiBvayAqLworCQlpZiAobGluay0+bGlua19lbmMtPmZ1bmNzLT5p
c19pbl9hbHRfbW9kZShsaW5rLT5saW5rX2VuYykpIHsKKworCQkJZmluaXNoX3RpbWVzdGFtcCA9
IGRtX2dldF90aW1lc3RhbXAobGluay0+Y3R4KTsKKwkJCXRpbWVfdGFrZW5faW5fbnMgPSBkbV9n
ZXRfZWxhcHNlX3RpbWVfaW5fbnMoCisJCQkJbGluay0+Y3R4LCBmaW5pc2hfdGltZXN0YW1wLCBl
bnRlcl90aW1lc3RhbXApOworCQkJRENfTE9HX1dBUk5JTkcoIkFsdCBtb2RlIGVudGVyZWQgZmlu
aXNoZWQgYWZ0ZXIgJWxsdSBtc1xuIiwKKwkJCQkgICAgICAgdGltZV90YWtlbl9pbl9ucyAvIDEw
MDAwMDApOworCQkJcmV0dXJuIHRydWU7CisJCX0KKworCX0KKwlmaW5pc2hfdGltZXN0YW1wID0g
ZG1fZ2V0X3RpbWVzdGFtcChsaW5rLT5jdHgpOworCXRpbWVfdGFrZW5faW5fbnMgPSBkbV9nZXRf
ZWxhcHNlX3RpbWVfaW5fbnMobGluay0+Y3R4LCBmaW5pc2hfdGltZXN0YW1wLAorCQkJCQkJICAg
IGVudGVyX3RpbWVzdGFtcCk7CisJRENfTE9HX1dBUk5JTkcoIkFsdCBtb2RlIGhhcyB0aW1lZCBv
dXQgYWZ0ZXIgJWxsdSBtc1xuIiwKKwkJCXRpbWVfdGFrZW5faW5fbnMgLyAxMDAwMDAwKTsKKwly
ZXR1cm4gZmFsc2U7Cit9CisKIC8qKgogICogZGNfbGlua19kZXRlY3QoKSAtIERldGVjdCBpZiBh
IHNpbmsgaXMgYXR0YWNoZWQgdG8gYSBnaXZlbiBsaW5rCiAgKgpAQCAtNzcwLDYgKzgyMCwxNSBA
QCBib29sIGRjX2xpbmtfZGV0ZWN0KHN0cnVjdCBkY19saW5rICpsaW5rLCBlbnVtIGRjX2RldGVj
dF9yZWFzb24gcmVhc29uKQogCQl9CiAKIAkJY2FzZSBTSUdOQUxfVFlQRV9ESVNQTEFZX1BPUlQ6
IHsKKwkJCS8qIHdhIEhQRCBoaWdoIGNvbWluZyB0b28gZWFybHkqLworCQkJaWYgKGxpbmstPmxp
bmtfZW5jLT5mZWF0dXJlcy5mbGFncy5iaXRzLkRQX0lTX1VTQl9DID09IDEpIHsKKworCQkJCS8q
IGlmIGFsdCBtb2RlIHRpbWVzIG91dCwgcmV0dXJuIGZhbHNlICovCisJCQkJaWYgKHdhaXRfZm9y
X2FsdF9tb2RlKGxpbmspID09IGZhbHNlKSB7CisJCQkJCXJldHVybiBmYWxzZTsKKwkJCQl9CisJ
CQl9CisKIAkJCWlmICghZGV0ZWN0X2RwKAogCQkJCWxpbmssCiAJCQkJJnNpbmtfY2FwcywKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9saW5r
X2VuY29kZXIuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9s
aW5rX2VuY29kZXIuaAppbmRleCAzM2IyYWYxYTE4MWMuLmYzZTU3MzQzNDE3YyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rl
ci5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9saW5r
X2VuY29kZXIuaApAQCAtMzM3LDYgKzMzNyw3IEBAIHN0cnVjdCBkY24xMF9saW5rX2VuY19yZWdp
c3RlcnMgewogCQl0eXBlIFJEUENTX1RYX0ZJRk9fRVJST1JfTUFTSztcCiAJCXR5cGUgUkRQQ1Nf
RFBBTFRfRElTQUJMRV9UT0dHTEVfTUFTSztcCiAJCXR5cGUgUkRQQ1NfRFBBTFRfNExBTkVfVE9H
R0xFX01BU0s7XAorCQl0eXBlIFJEUENTX1BIWV9EUEFMVF9ESVNBQkxFO1wKIAkJdHlwZSBSRFBD
U19QSFlfRFBBTFRfRElTQUJMRV9BQ0s7XAogCQl0eXBlIFJEUENTX1BIWV9EUF9NUExMQl9WMkk7
XAogCQl0eXBlIFJEUENTX1BIWV9EUF9NUExMQl9GUkVRX1ZDTztcCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2xpbmtfZW5jb2Rlci5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9saW5rX2VuY29kZXIuaAppbmRleCBlNWU4
NjQwYTllZjMuLjcwMDFiZmJkNjY4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2luYy9ody9saW5rX2VuY29kZXIuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvaW5jL2h3L2xpbmtfZW5jb2Rlci5oCkBAIC0xODMsNiArMTgzLDcgQEAgc3Ry
dWN0IGxpbmtfZW5jb2Rlcl9mdW5jcyB7CiAKIAlib29sICgqZmVjX2lzX2FjdGl2ZSkoc3RydWN0
IGxpbmtfZW5jb2RlciAqZW5jKTsKICNlbmRpZgorCWJvb2wgKCppc19pbl9hbHRfbW9kZSkgKHN0
cnVjdCBsaW5rX2VuY29kZXIgKmVuYyk7CiB9OwogCiAjZW5kaWYgLyogTElOS19FTkNPREVSX0hf
ICovCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
