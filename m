Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AE72679A
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 18:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4882689C1E;
	Wed, 22 May 2019 16:01:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810041.outbound.protection.outlook.com [40.107.81.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE40389C1E
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 16:01:03 +0000 (UTC)
Received: from SN1PR12CA0076.namprd12.prod.outlook.com (2603:10b6:802:20::47)
 by BYAPR12MB2663.namprd12.prod.outlook.com (2603:10b6:a03:69::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.16; Wed, 22 May
 2019 16:01:02 +0000
Received: from CO1NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by SN1PR12CA0076.outlook.office365.com
 (2603:10b6:802:20::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Wed, 22 May 2019 16:01:01 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT031.mail.protection.outlook.com (10.152.80.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Wed, 22 May 2019 16:01:01 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 22 May 2019
 11:00:59 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/amd/display: Use new connector state when getting
 color depth
Date: Wed, 22 May 2019 12:00:55 -0400
Message-ID: <20190522160055.26665-2-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522160055.26665-1-nicholas.kazlauskas@amd.com>
References: <20190522160055.26665-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(53936002)(2351001)(4326008)(51416003)(7696005)(76176011)(36756003)(5660300002)(2616005)(316002)(44832011)(48376002)(86362001)(1076003)(486006)(426003)(16586007)(6666004)(47776003)(54906003)(126002)(476003)(14444005)(50466002)(446003)(356004)(11346002)(8676002)(305945005)(2906002)(6916009)(81166006)(53416004)(70206006)(26005)(81156014)(77096007)(336012)(70586007)(186003)(68736007)(50226002)(8936002)(72206003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2663; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cc139f4-e528-4ad7-872c-08d6deceaffd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BYAPR12MB2663; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2663:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2663CA0A3BA75C688F3E39FEEC000@BYAPR12MB2663.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 0045236D47
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: p50XqY3OVh8LHvbjtWco/ddL8onx0ev0yHGwR6tOm9ofIYB+iBURYKt/q2VxDsT235tCBEo+i+mPEVvvI21HtR7lmXaV+m+qvY4bOBR3R9ryYwdmha7Qe0At2fpYHuDMFYgNRL3j+G3+ncR/jiQJhL2DNEQkDfyLVYwqjm4YrNPdvp3f8H0lSke7NbsGepsFpU76JyPQkjrf68gvfxQO2n7MNXJwJfk2XfJbhpBZbdfGVUSEPwImPuVryFixg8yB6xSZyswSNwkaO0A/3lHfexuH6kfTCsD50QorqiCh6LU+QTX7Fi7r48084Y6Cj6JuFlhFLVFYIi9CBV3rMnu4O9Tlxw2FRdivsnwFmTMrEgz557P3XyQyopkl3zSoeGT65BkYxE3iXzca0I1z+3uupyITjWv4SkdqxTixnr3hSuY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2019 16:01:01.4459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc139f4-e528-4ad7-872c-08d6deceaffd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2663
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjFZtahZXTE5NYTgjiiv4HoAiBMj5ivmxTEVtAJF2zQ=;
 b=btzKGdCejDwvkCfUlDehidOlbxDfwfDXIcHaPnWlqBQphoTfElqY6h3u++PoFFzAsKivehaegp0ORDaxZQ7XilyjtdJp8V006qgT10DgUPcwLyp9op5qtaMIyeXq1JzyJ1aQIXGj/yyxrRWzFubGFE1bWnA3TkPceg31moDgmJ8=
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
Y2N1ciB3aGVuIGNoYW5naW5nIHRoZQptYXggYnBjIGZvciBhIGNvbm5lY3Rvci4KCnYyOiBEcm9w
IGV4dHJhIFRPRE8uCgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBIYXJyeSBX
ZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTmljaG9sYXMg
S2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgpBY2tlZC1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDI3ICsrKysrKysrKystLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCBi
OGU4ODIwOWVmNWQuLmZkMDQyMTc5NGUwZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC0zMDM4LDEzICszMDM4LDEzIEBAIHN0
YXRpYyB2b2lkIHVwZGF0ZV9zdHJlYW1fc2NhbGluZ19zZXR0aW5ncyhjb25zdCBzdHJ1Y3QgZHJt
X2Rpc3BsYXlfbW9kZSAqbW9kZSwKIH0KIAogc3RhdGljIGVudW0gZGNfY29sb3JfZGVwdGgKLWNv
bnZlcnRfY29sb3JfZGVwdGhfZnJvbV9kaXNwbGF5X2luZm8oY29uc3Qgc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvcikKK2NvbnZlcnRfY29sb3JfZGVwdGhfZnJvbV9kaXNwbGF5X2luZm8o
Y29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKKwkJCQkgICAgICBjb25zdCBz
dHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqc3RhdGUpCiB7CiAJdWludDMyX3QgYnBjID0gY29u
bmVjdG9yLT5kaXNwbGF5X2luZm8uYnBjOwogCi0JLyogVE9ETzogVXNlIHBhc3NlZCBpbiBzdGF0
ZSBpbnN0ZWFkIG9mIHRoZSBjdXJyZW50IHN0YXRlLiAqLwotCWlmIChjb25uZWN0b3ItPnN0YXRl
KSB7Ci0JCWJwYyA9IGNvbm5lY3Rvci0+c3RhdGUtPm1heF9icGM7CisJaWYgKHN0YXRlKSB7CisJ
CWJwYyA9IHN0YXRlLT5tYXhfYnBjOwogCQkvKiBSb3VuZCBkb3duIHRvIHRoZSBuZWFyZXN0IGV2
ZW4gbnVtYmVyLiAqLwogCQlicGMgPSBicGMgLSAoYnBjICYgMSk7CiAJfQpAQCAtMzE2NSwxMSAr
MzE2NSwxMiBAQCBzdGF0aWMgdm9pZCBhZGp1c3RfY29sb3VyX2RlcHRoX2Zyb21fZGlzcGxheV9p
bmZvKHN0cnVjdCBkY19jcnRjX3RpbWluZyAqdGltaW5nXwogCiB9CiAKLXN0YXRpYyB2b2lkCi1m
aWxsX3N0cmVhbV9wcm9wZXJ0aWVzX2Zyb21fZHJtX2Rpc3BsYXlfbW9kZShzdHJ1Y3QgZGNfc3Ry
ZWFtX3N0YXRlICpzdHJlYW0sCi0JCQkJCSAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgKm1vZGVfaW4sCi0JCQkJCSAgICAgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvciwKLQkJCQkJICAgICBjb25zdCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpvbGRfc3RyZWFt
KQorc3RhdGljIHZvaWQgZmlsbF9zdHJlYW1fcHJvcGVydGllc19mcm9tX2RybV9kaXNwbGF5X21v
ZGUoCisJc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtLAorCWNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICptb2RlX2luLAorCWNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IsCisJY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5lY3Rvcl9zdGF0
ZSwKKwljb25zdCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpvbGRfc3RyZWFtKQogewogCXN0cnVj
dCBkY19jcnRjX3RpbWluZyAqdGltaW5nX291dCA9ICZzdHJlYW0tPnRpbWluZzsKIAljb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfaW5mbyAqaW5mbyA9ICZjb25uZWN0b3ItPmRpc3BsYXlfaW5mbzsK
QEAgLTMxOTIsNyArMzE5Myw3IEBAIGZpbGxfc3RyZWFtX3Byb3BlcnRpZXNfZnJvbV9kcm1fZGlz
cGxheV9tb2RlKHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSwKIAogCXRpbWluZ19vdXQt
PnRpbWluZ18zZF9mb3JtYXQgPSBUSU1JTkdfM0RfRk9STUFUX05PTkU7CiAJdGltaW5nX291dC0+
ZGlzcGxheV9jb2xvcl9kZXB0aCA9IGNvbnZlcnRfY29sb3JfZGVwdGhfZnJvbV9kaXNwbGF5X2lu
Zm8oCi0JCQljb25uZWN0b3IpOworCQljb25uZWN0b3IsIGNvbm5lY3Rvcl9zdGF0ZSk7CiAJdGlt
aW5nX291dC0+c2Nhbl90eXBlID0gU0NBTk5JTkdfVFlQRV9OT0RBVEE7CiAJdGltaW5nX291dC0+
aGRtaV92aWMgPSAwOwogCkBAIC0zMzg5LDYgKzMzOTAsOCBAQCBjcmVhdGVfc3RyZWFtX2Zvcl9z
aW5rKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yLAogewogCXN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlICpwcmVmZXJyZWRfbW9kZSA9IE5VTEw7CiAJc3RydWN0IGRybV9jb25u
ZWN0b3IgKmRybV9jb25uZWN0b3I7CisJY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUg
KmNvbl9zdGF0ZSA9CisJCWRtX3N0YXRlID8gJmRtX3N0YXRlLT5iYXNlIDogTlVMTDsKIAlzdHJ1
Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0gPSBOVUxMOwogCXN0cnVjdCBkcm1fZGlzcGxheV9t
b2RlIG1vZGUgPSAqZHJtX21vZGU7CiAJYm9vbCBuYXRpdmVfbW9kZV9mb3VuZCA9IGZhbHNlOwpA
QCAtMzQ2MSwxMCArMzQ2NCwxMCBAQCBjcmVhdGVfc3RyZWFtX2Zvcl9zaW5rKHN0cnVjdCBhbWRn
cHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yLAogCSovCiAJaWYgKCFzY2FsZSB8fCBtb2RlX3Jl
ZnJlc2ggIT0gcHJlZmVycmVkX3JlZnJlc2gpCiAJCWZpbGxfc3RyZWFtX3Byb3BlcnRpZXNfZnJv
bV9kcm1fZGlzcGxheV9tb2RlKHN0cmVhbSwKLQkJCSZtb2RlLCAmYWNvbm5lY3Rvci0+YmFzZSwg
TlVMTCk7CisJCQkmbW9kZSwgJmFjb25uZWN0b3ItPmJhc2UsIGNvbl9zdGF0ZSwgTlVMTCk7CiAJ
ZWxzZQogCQlmaWxsX3N0cmVhbV9wcm9wZXJ0aWVzX2Zyb21fZHJtX2Rpc3BsYXlfbW9kZShzdHJl
YW0sCi0JCQkmbW9kZSwgJmFjb25uZWN0b3ItPmJhc2UsIG9sZF9zdHJlYW0pOworCQkJJm1vZGUs
ICZhY29ubmVjdG9yLT5iYXNlLCBjb25fc3RhdGUsIG9sZF9zdHJlYW0pOwogCiAJdXBkYXRlX3N0
cmVhbV9zY2FsaW5nX3NldHRpbmdzKCZtb2RlLCBkbV9zdGF0ZSwgc3RyZWFtKTsKIAotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
