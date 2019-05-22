Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A3266B5
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 17:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DB589BFD;
	Wed, 22 May 2019 15:11:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770072.outbound.protection.outlook.com [40.107.77.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCDB89BFD
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 15:11:56 +0000 (UTC)
Received: from DM5PR12CA0067.namprd12.prod.outlook.com (2603:10b6:3:103::29)
 by CY4PR12MB1272.namprd12.prod.outlook.com (2603:10b6:903:3e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.17; Wed, 22 May
 2019 15:11:32 +0000
Received: from DM3NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM5PR12CA0067.outlook.office365.com
 (2603:10b6:3:103::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.17 via Frontend
 Transport; Wed, 22 May 2019 15:11:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT030.mail.protection.outlook.com (10.152.82.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Wed, 22 May 2019 15:11:32 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 22 May 2019
 10:11:31 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/display: Use new connector state when getting
 color depth
Date: Wed, 22 May 2019 11:11:16 -0400
Message-ID: <20190522151116.22916-2-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522151116.22916-1-nicholas.kazlauskas@amd.com>
References: <20190522151116.22916-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(2980300002)(428003)(189003)(199004)(4326008)(186003)(53936002)(76176011)(72206003)(126002)(86362001)(8936002)(486006)(2616005)(1076003)(81166006)(77096007)(81156014)(426003)(44832011)(5660300002)(26005)(47776003)(446003)(476003)(70586007)(336012)(70206006)(8676002)(50226002)(68736007)(11346002)(51416003)(356004)(6916009)(54906003)(7696005)(305945005)(2351001)(14444005)(498600001)(6666004)(53416004)(2906002)(16586007)(50466002)(36756003)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 214f82d5-80ef-41b4-c5a7-08d6dec7c62d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1272C7669E049B5C474CAC9BEC000@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 0045236D47
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: N6pSmB2c4P5P/u9wDfdec4B8+bQ7iv+r2Qry8jgQ2Ahy9hsv6MBmzPsfOJ22FgcHYuAtErnOO0PR8ma94pJG0+4u6QCArFML4AWBrt8VKlEfakAw1SXbRObaysQGkB73QUmmNNz/HVo+GYAP9jxUh1jBEFbGs1jPKZY5pBue3hhUGnHeJE74YyhvLOvfbSskU1WFtVhbvUTVvojni0ICe1pvH8eloxHw5woluhHHR0tOEf8W3YOMSJ48TrfdRCZBqk+XzB8/89DO3Emj++kGPFQhfbDxi3F9Q32aS0O0uEtNw0LMLGJ0drqqUYSOhvlgesTK2gBHizbJRZ1LKe3NZTdPPvn3KeXFMoWisMZRbSpvPOY4Xe35aPQ8IlilUBiOBVPnbdoW0knPUT1U45sxxrTPy4JThRouwan9ZWsrDNU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2019 15:11:32.0667 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 214f82d5-80ef-41b4-c5a7-08d6dec7c62d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kt289aS5Ud3ApkUoVUKSOfsnSa5HaYKP8HDM0s5WkVI=;
 b=wF3GK556VwsLs4XOFupRskZSArPSGUS63GUjSr4MaozeeLH+LrL3LEwiaVHvlxv/0OAqOjas1m8GOdqH76kWWUySzUI6TZaJH18FGObZoZWGyGqFNpXAiLxGBpRSkIYx8V+FYN6a/uZ78jy3GscEaqQPlfoUkIIRsTyNDJUJBUA=
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
Cc: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KVGhlIGN1cnJlbnQgc3RhdGUgb24gdGhlIGNvbm5lY3RvciBpcyBxdWVyaWVkIHdoZW4g
Z2V0dGluZyB0aGUgbWF4IGJwYwpyYXRoZXIgdGhhbiB0aGUgbmV3IHN0YXRlLiBUaGlzIG1lYW5z
IHRoYXQgYSBuZXcgbWF4IGJwYyB2YWx1ZSBjYW4gb25seQpjdXJyZW50bHkgdGFrZSBlZmZlY3Qg
b24gdGhlIGNvbW1pdCAqYWZ0ZXIqIGl0IGNoYW5nZXMuCgpUaGUgbmV3IHN0YXRlIHNob3VsZCBi
ZSBwYXNzZWQgaW4gaW5zdGVhZC4KCltIb3ddClBhc3MgZG93biB0aGUgZG1fc3RhdGUgYXMgZHJt
IHN0YXRlIHRvIHdoZXJlIHdlIGRvIGNvbG9yIGRlcHRoIGxvb2t1cC4KClRoZSBwYXNzZWQgaW4g
c3RhdGUgY2FuIHN0aWxsIGJlIE5VTEwgd2hlbiBjYWxsZWQgZnJvbQphbWRncHVfZG1fY29ubmVj
dG9yX21vZGVfdmFsaWQsIHNvIG1ha2Ugc3VyZSB0aGF0IHdlIGhhdmUgcmVhc29uYWJsZQpkZWZh
dWx0cyBpbiBwbGFjZS4gVGhhdCBzaG91bGQgcHJvYmFibHkgYmUgYWRkcmVzc2VkIGF0IHNvbWUg
cG9pbnQuCgpUaGlzIGNoYW5nZSBub3cgKGNvcnJlY3RseSkgY2F1c2VzIGEgbW9kZXNldCB0byBv
Y2N1ciB3aGVuIGNoYW5naW5nIHRoZQptYXggYnBjIGZvciBhIGNvbm5lY3Rvci4KCkNjOiBMZW8g
TGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5r
YXpsYXVza2FzQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIHwgMjYgKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGE3YTllNGQ4MWExNy4uNTgw
YzMyNDg5MWZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKQEAgLTMwMzgsMTMgKzMwMzgsMTQgQEAgc3RhdGljIHZvaWQgdXBkYXRl
X3N0cmVhbV9zY2FsaW5nX3NldHRpbmdzKGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpt
b2RlLAogfQogCiBzdGF0aWMgZW51bSBkY19jb2xvcl9kZXB0aAotY29udmVydF9jb2xvcl9kZXB0
aF9mcm9tX2Rpc3BsYXlfaW5mbyhjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
KQorY29udmVydF9jb2xvcl9kZXB0aF9mcm9tX2Rpc3BsYXlfaW5mbyhjb25zdCBzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yLAorCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVj
dG9yX3N0YXRlICpzdGF0ZSkKIHsKIAl1aW50MzJfdCBicGMgPSA4OwogCiAJLyogVE9ETzogVXNl
IHBhc3NlZCBpbiBzdGF0ZSBpbnN0ZWFkIG9mIHRoZSBjdXJyZW50IHN0YXRlLiAqLwotCWlmIChj
b25uZWN0b3ItPnN0YXRlKSB7Ci0JCWJwYyA9IGNvbm5lY3Rvci0+c3RhdGUtPm1heF9icGM7CisJ
aWYgKHN0YXRlKSB7CisJCWJwYyA9IHN0YXRlLT5tYXhfYnBjOwogCQkvKiBSb3VuZCBkb3duIHRv
IHRoZSBuZWFyZXN0IGV2ZW4gbnVtYmVyLiAqLwogCQlicGMgPSBicGMgLSAoYnBjICYgMSk7CiAJ
fQpAQCAtMzE2NSwxMSArMzE2NiwxMiBAQCBzdGF0aWMgdm9pZCBhZGp1c3RfY29sb3VyX2RlcHRo
X2Zyb21fZGlzcGxheV9pbmZvKHN0cnVjdCBkY19jcnRjX3RpbWluZyAqdGltaW5nXwogCiB9CiAK
LXN0YXRpYyB2b2lkCi1maWxsX3N0cmVhbV9wcm9wZXJ0aWVzX2Zyb21fZHJtX2Rpc3BsYXlfbW9k
ZShzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0sCi0JCQkJCSAgICAgY29uc3Qgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgKm1vZGVfaW4sCi0JCQkJCSAgICAgY29uc3Qgc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvciwKLQkJCQkJICAgICBjb25zdCBzdHJ1Y3QgZGNfc3RyZWFtX3N0
YXRlICpvbGRfc3RyZWFtKQorc3RhdGljIHZvaWQgZmlsbF9zdHJlYW1fcHJvcGVydGllc19mcm9t
X2RybV9kaXNwbGF5X21vZGUoCisJc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtLAorCWNv
bnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlX2luLAorCWNvbnN0IHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IsCisJY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUg
KmNvbm5lY3Rvcl9zdGF0ZSwKKwljb25zdCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpvbGRfc3Ry
ZWFtKQogewogCXN0cnVjdCBkY19jcnRjX3RpbWluZyAqdGltaW5nX291dCA9ICZzdHJlYW0tPnRp
bWluZzsKIAljb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfaW5mbyAqaW5mbyA9ICZjb25uZWN0b3It
PmRpc3BsYXlfaW5mbzsKQEAgLTMxOTIsNyArMzE5NCw3IEBAIGZpbGxfc3RyZWFtX3Byb3BlcnRp
ZXNfZnJvbV9kcm1fZGlzcGxheV9tb2RlKHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSwK
IAogCXRpbWluZ19vdXQtPnRpbWluZ18zZF9mb3JtYXQgPSBUSU1JTkdfM0RfRk9STUFUX05PTkU7
CiAJdGltaW5nX291dC0+ZGlzcGxheV9jb2xvcl9kZXB0aCA9IGNvbnZlcnRfY29sb3JfZGVwdGhf
ZnJvbV9kaXNwbGF5X2luZm8oCi0JCQljb25uZWN0b3IpOworCQljb25uZWN0b3IsIGNvbm5lY3Rv
cl9zdGF0ZSk7CiAJdGltaW5nX291dC0+c2Nhbl90eXBlID0gU0NBTk5JTkdfVFlQRV9OT0RBVEE7
CiAJdGltaW5nX291dC0+aGRtaV92aWMgPSAwOwogCkBAIC0zMzg5LDYgKzMzOTEsOCBAQCBjcmVh
dGVfc3RyZWFtX2Zvcl9zaW5rKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9y
LAogewogCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpwcmVmZXJyZWRfbW9kZSA9IE5VTEw7CiAJ
c3RydWN0IGRybV9jb25uZWN0b3IgKmRybV9jb25uZWN0b3I7CisJY29uc3Qgc3RydWN0IGRybV9j
b25uZWN0b3Jfc3RhdGUgKmNvbl9zdGF0ZSA9CisJCWRtX3N0YXRlID8gJmRtX3N0YXRlLT5iYXNl
IDogTlVMTDsKIAlzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0gPSBOVUxMOwogCXN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlIG1vZGUgPSAqZHJtX21vZGU7CiAJYm9vbCBuYXRpdmVfbW9kZV9m
b3VuZCA9IGZhbHNlOwpAQCAtMzQ2MSwxMCArMzQ2NSwxMCBAQCBjcmVhdGVfc3RyZWFtX2Zvcl9z
aW5rKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yLAogCSovCiAJaWYgKCFz
Y2FsZSB8fCBtb2RlX3JlZnJlc2ggIT0gcHJlZmVycmVkX3JlZnJlc2gpCiAJCWZpbGxfc3RyZWFt
X3Byb3BlcnRpZXNfZnJvbV9kcm1fZGlzcGxheV9tb2RlKHN0cmVhbSwKLQkJCSZtb2RlLCAmYWNv
bm5lY3Rvci0+YmFzZSwgTlVMTCk7CisJCQkmbW9kZSwgJmFjb25uZWN0b3ItPmJhc2UsIGNvbl9z
dGF0ZSwgTlVMTCk7CiAJZWxzZQogCQlmaWxsX3N0cmVhbV9wcm9wZXJ0aWVzX2Zyb21fZHJtX2Rp
c3BsYXlfbW9kZShzdHJlYW0sCi0JCQkmbW9kZSwgJmFjb25uZWN0b3ItPmJhc2UsIG9sZF9zdHJl
YW0pOworCQkJJm1vZGUsICZhY29ubmVjdG9yLT5iYXNlLCBjb25fc3RhdGUsIG9sZF9zdHJlYW0p
OwogCiAJdXBkYXRlX3N0cmVhbV9zY2FsaW5nX3NldHRpbmdzKCZtb2RlLCBkbV9zdGF0ZSwgc3Ry
ZWFtKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
