Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC7B69DCA
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A68689CBA;
	Mon, 15 Jul 2019 21:21:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700043.outbound.protection.outlook.com [40.107.70.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D31189C88
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfjTjSb8CGLEOQTGEu11cAZPZcD8D08k3cyD1GN9JOdn/OmPKn/cqFUWIH1OxisY4oHDpOjVkbNI4aI1Zvw+SfKaYhKzU9uWyRCDpGf4CHEVJJjBdMuVPbkm0NPZDw8tfudECvusvNUpLFMJGphuoNllkriRZIne8gwkW+z4DgN4FzZE1AWnmHcuXF7xkYQ+i54wwfPn2qKLPTwvZ9PThKMiVX8oOtFk6zvM3OxFrLKHwEWX+sdAUzJoZ2wcUJ8RtxtxHYpAqJQvtTVzJp/ZowWpRH4MdDjpSqmo+LLqc7ZhvhtO47Zt5d3LIxQZeFHXFJUrFRu5cBxPrWL/sg5R1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYM2jjxxTlFiAmaZkuD3ZVKXwkePAELbgyA3iu+tF28=;
 b=RzM+h++ElFNMkBSC6SUkhDc7hcaiR07P4s2NA17iPPYY2JbwTQglRsWOQDfO/QziaUu/OvpFeHqIexlhL5dBoMmF4MIyDLQQJMZxivCkoyL0vRm5xBUSU8l/aRH9KwdAWzJEeoYqq9SdKKiIWCmtP/9LTJaBLQv1QKZPwh9N1Jv4xSn/whROv4j9NSRgDkhcaUAcnhiKPOLuaSvIQmJMmJulynwa5XPlKILRtD0gpMkcXDckC/EeMVkO5MekgvZFxgN4hpQ4SOw4/NwOxnc0Vkp3WdK8ekdibIcNZ+MNX6p9rizkgLg7RWxIL7niuXiDN3HcOwAxLlXiIkNSbmTzOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:208:a8::19)
 by CY4PR12MB1925.namprd12.prod.outlook.com (2603:10b6:903:120::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:45 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MN2PR12CA0006.outlook.office365.com
 (2603:10b6:208:a8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.20 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:44 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:29 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 50/87] drm/amd/display: Set FEC_READY always before link
 training
Date: Mon, 15 Jul 2019 17:20:12 -0400
Message-ID: <20190715212049.4584-51-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(428003)(189003)(199004)(2616005)(8676002)(81156014)(81166006)(316002)(54906003)(486006)(8936002)(476003)(126002)(446003)(11346002)(49486002)(50226002)(86362001)(68736007)(6916009)(26005)(76176011)(51416003)(14444005)(2870700001)(47776003)(426003)(336012)(36756003)(50466002)(48376002)(2906002)(2876002)(4326008)(186003)(70586007)(70206006)(1076003)(2351001)(305945005)(6666004)(356004)(53936002)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1925; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4083897-7de5-4ce0-aea0-08d7096a702a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1925; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1925:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1925DA8FC338536D7FC8BBBD82CF0@CY4PR12MB1925.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: EYp/HEERKs/yrOtTjYNwfXmlU26G3j8ae5etroszEiZno3CgIcTljovRtI3iMsvP127uLHphQPXVi80S0hXplolPYSQZxBZqanT5Yqsn7X0D8qAjvQsXXzIRx54OUKuSfvRSxv5jv0dkdfFGJS9D0KI/TZYiFbe0rU/vITi+7vb3P8+fbaXG7gGeH2BY4b7ffE07cJOhouTzOyPDNVp+w7rJuxioB03qTqKU7Xr3VEjiyce6XZwCuV1EcTKwKUlx65w3p44OKeOA8+E2U39Lj03BV6KE4feLU4fTmoBeXnkf7w005CO79UDb0iYsnzulakfClfTsSAeB/HM6giBmGFyWuISQjXhkIV0E/b8p1QyYn+qn/K38+IgwKtw5bZRx8yDAmiqP6rRTJgG53TFu2RCIl3BpnqKLocRyCxBmb2I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:44.7201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4083897-7de5-4ce0-aea0-08d7096a702a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1925
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYM2jjxxTlFiAmaZkuD3ZVKXwkePAELbgyA3iu+tF28=;
 b=cwMGWWY9VJCj6oCb2ffBtXT5LVnawUpTWMwzYFuzLP6W27ay1q5xJzTp2MLhJR1WVMt0CmJZTWpvw+YHMwRn/ITpKMoLUSyk6ZfhluHhFwb0Yd73yasY8okjGtF3ZgfGFVtGrmwNjEcImVHfMME4cOvrvh/T8368B7NHIzEyBHc=
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
Cc: Leo Li <sunpeng.li@amd.com>, Abdoulaye Berthe <Abdoulaye.Berthe@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KUmlnaHQg
bm93IHdlIEZFQ19SRUFEWSBpcyBzZXQgb25seSBiZWZvcmUgdGhlIGZpbmFsIGxpbmsgdHJhaW5p
bmcsCmkuZS4gYXQgbW9kZSBzZXQgdGltZS4gVGhpcyBtZWFucyBGRUNfUkVBRFkgd29uJ3QgYmUg
c2V0IHdoZW4gZG9pbmcKbGluayB0cmFpbmluZyBhcyBhIHJlc3BvbnNlIHRvIEhQRC4gSXQgYWxz
byBmYWlscyBVQ0Q0MDAgRkVDIHRlc3QgaW4KRFAgY29tcGxpYW5jZS4KCltob3ddCk1vdmUgRkVD
X1JFQURZIHNldHVwIHRvIGxpbmsgdHJhaW5pbmcuCgpTaWduZWQtb2ZmLWJ5OiBOaWtvbGEgQ29y
bmlqIDxuaWtvbGEuY29ybmlqQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbnRob255IEtvbyA8QW50
aG9ueS5Lb29AYW1kLmNvbT4KQWNrZWQtYnk6IEFiZG91bGF5ZSBCZXJ0aGUgPEFiZG91bGF5ZS5C
ZXJ0aGVAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyAgfCAxNCArKysr
Ky0tLS0tLS0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMg
ICB8IDE4ICsrKysrKysrKysrKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rLmMKaW5kZXggMTk0ODNmYmYzMjFiLi4xNDIyZTc0YTVmZmMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKQEAgLTE1MjEsMTUg
KzE1MjEsNiBAQCBzdGF0aWMgZW51bSBkY19zdGF0dXMgZW5hYmxlX2xpbmtfZHAoCiAJaWYgKGxp
bmtfc2V0dGluZ3MubGlua19yYXRlID09IExJTktfUkFURV9MT1cpCiAJCQlza2lwX3ZpZGVvX3Bh
dHRlcm4gPSBmYWxzZTsKIAotI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCi0J
aWYgKGxpbmstPnByZWZlcnJlZF90cmFpbmluZ19zZXR0aW5ncy5mZWNfZW5hYmxlICE9IE5VTEwp
Ci0JCWZlY19lbmFibGUgPSAqbGluay0+cHJlZmVycmVkX3RyYWluaW5nX3NldHRpbmdzLmZlY19l
bmFibGU7Ci0JZWxzZQotCQlmZWNfZW5hYmxlID0gdHJ1ZTsKLQotCWRwX3NldF9mZWNfcmVhZHko
bGluaywgZmVjX2VuYWJsZSk7Ci0jZW5kaWYKLQogCWlmIChsaW5rLT5hdXhfYWNjZXNzX2Rpc2Fi
bGVkKSB7CiAJCWRjX2xpbmtfZHBfcGVyZm9ybV9saW5rX3RyYWluaW5nX3NraXBfYXV4KGxpbmss
ICZsaW5rX3NldHRpbmdzKTsKIApAQCAtMTU0Nyw2ICsxNTM4LDExIEBAIHN0YXRpYyBlbnVtIGRj
X3N0YXR1cyBlbmFibGVfbGlua19kcCgKIAkJc3RhdHVzID0gRENfRkFJTF9EUF9MSU5LX1RSQUlO
SU5HOwogCiAjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKKwlpZiAobGluay0+
cHJlZmVycmVkX3RyYWluaW5nX3NldHRpbmdzLmZlY19lbmFibGUgIT0gTlVMTCkKKwkJZmVjX2Vu
YWJsZSA9ICpsaW5rLT5wcmVmZXJyZWRfdHJhaW5pbmdfc2V0dGluZ3MuZmVjX2VuYWJsZTsKKwll
bHNlCisJCWZlY19lbmFibGUgPSB0cnVlOworCiAJZHBfc2V0X2ZlY19lbmFibGUobGluaywgZmVj
X2VuYWJsZSk7CiAjZW5kaWYKIAlyZXR1cm4gc3RhdHVzOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jCmluZGV4IDQ0NDJlN2IxZTViNS4uNWM4
ZTMzMTgyMzljIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGlua19kcC5jCkBAIC0xMTc5LDE0ICsxMTc5LDI2IEBAIGVudW0gbGlua190cmFpbmluZ19y
ZXN1bHQgZGNfbGlua19kcF9wZXJmb3JtX2xpbmtfdHJhaW5pbmcoCiAJYm9vbCBza2lwX3ZpZGVv
X3BhdHRlcm4pCiB7CiAJZW51bSBsaW5rX3RyYWluaW5nX3Jlc3VsdCBzdGF0dXMgPSBMSU5LX1RS
QUlOSU5HX1NVQ0NFU1M7Ci0KIAlzdHJ1Y3QgbGlua190cmFpbmluZ19zZXR0aW5ncyBsdF9zZXR0
aW5nczsKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAorCWJvb2wgZmVjX2Vu
YWJsZTsKKyNlbmRpZgogCiAJaW5pdGlhbGl6ZV90cmFpbmluZ19zZXR0aW5ncyhsaW5rLCBsaW5r
X3NldHRpbmcsICZsdF9zZXR0aW5ncyk7CiAKIAkvKiAxLiBzZXQgbGluayByYXRlLCBsYW5lIGNv
dW50IGFuZCBzcHJlYWQuICovCiAJZHBjZF9zZXRfbGlua19zZXR0aW5ncyhsaW5rLCAmbHRfc2V0
dGluZ3MpOwogCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKKwlpZiAobGlu
ay0+cHJlZmVycmVkX3RyYWluaW5nX3NldHRpbmdzLmZlY19lbmFibGUgIT0gTlVMTCkKKwkJZmVj
X2VuYWJsZSA9ICpsaW5rLT5wcmVmZXJyZWRfdHJhaW5pbmdfc2V0dGluZ3MuZmVjX2VuYWJsZTsK
KwllbHNlCisJCWZlY19lbmFibGUgPSB0cnVlOworCisJZHBfc2V0X2ZlY19yZWFkeShsaW5rLCBm
ZWNfZW5hYmxlKTsKKyNlbmRpZgorCisKIAkvKiAyLiBwZXJmb3JtIGxpbmsgdHJhaW5pbmcgKHNl
dCBsaW5rIHRyYWluaW5nIGRvbmUKIAkgKiAgdG8gZmFsc2UgaXMgZG9uZSBhcyB3ZWxsKQogCSAq
LwpAQCAtMzE1Myw3ICszMTY1LDcgQEAgdm9pZCBkcF9zZXRfZmVjX3JlYWR5KHN0cnVjdCBkY19s
aW5rICpsaW5rLCBib29sIHJlYWR5KQogCiAJaWYgKGxpbmtfZW5jLT5mdW5jcy0+ZmVjX3NldF9y
ZWFkeSAmJgogCQkJbGluay0+ZHBjZF9jYXBzLmZlY19jYXAuYml0cy5GRUNfQ0FQQUJMRSkgewot
CQlpZiAobGluay0+ZmVjX3N0YXRlID09IGRjX2xpbmtfZmVjX25vdF9yZWFkeSAmJiByZWFkeSkg
eworCQlpZiAocmVhZHkpIHsKIAkJCWZlY19jb25maWcgPSAxOwogCQkJaWYgKGNvcmVfbGlua193
cml0ZV9kcGNkKGxpbmssCiAJCQkJCURQX0ZFQ19DT05GSUdVUkFUSU9OLApAQCAtMzE2NCw3ICsz
MTc2LDcgQEAgdm9pZCBkcF9zZXRfZmVjX3JlYWR5KHN0cnVjdCBkY19saW5rICpsaW5rLCBib29s
IHJlYWR5KQogCQkJfSBlbHNlIHsKIAkJCQlkbV9lcnJvcigiZHBjZCB3cml0ZSBmYWlsZWQgdG8g
c2V0IGZlY19yZWFkeSIpOwogCQkJfQotCQl9IGVsc2UgaWYgKGxpbmstPmZlY19zdGF0ZSA9PSBk
Y19saW5rX2ZlY19yZWFkeSAmJiAhcmVhZHkpIHsKKwkJfSBlbHNlIGlmIChsaW5rLT5mZWNfc3Rh
dGUgPT0gZGNfbGlua19mZWNfcmVhZHkpIHsKIAkJCWZlY19jb25maWcgPSAwOwogCQkJY29yZV9s
aW5rX3dyaXRlX2RwY2QobGluaywKIAkJCQkJRFBfRkVDX0NPTkZJR1VSQVRJT04sCi0tIAoyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
