Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56837B72B6
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 07:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AEA6EBBE;
	Thu, 19 Sep 2019 05:32:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790051.outbound.protection.outlook.com [40.107.79.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC566EBBE
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 05:32:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAzg1HZK+oBtVjQ1xhYZbHV9xs7tcR2d2AaokdAcraQbhFrTnwLlqQBcgoS4tNd8R1zfrJ5QF15Q+kHUsXD6Pblp9Yn3dj0HHGwsisRAu8nufUwGchGHQUnGe41rWV+QH+nSglkVPQXiZdA8TbMikRQiTyXsSEPQnY7o/rnLwdYlzYEAjP6X1uZEqe8aQymZusxh4UhImMjyRHplmn++lV5ZSg5dmaGrgviXoIaSKRlJo8AZhjwnEq2+saW/WMjhkyhumoHXeH73zMwyHlOFlux0Y91OwNsHBb+u9MCwF0LGSZhjqz5zxAzLuUu0JbScahuK0E9PcViv1SeU1YCRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jPLDqcp+1CCT22ZByTj+LM0aew9R/SqB4Q+g6Q3S3k=;
 b=SIMYW1pIP3EdtS8cNpc4jRcCvFst23NE3DQvex3Ti+cQw/vKjg9VpNKPVIZLWvbUq8/iSYO0lBpIN6zP4nCW9XKMxXBXoSDeQadvsX6GaSQEs1N2dNLPYqK1aIwp3ljjvUSw4NgpWFrdvLWAvS9LXA5BF+c9Tqj4kSCEUVnK+btt/DhEqS5jZwGaKUss360k94IfATi0dg63qfNOk7RNZZG/KbpfG+WLA1sAC/3Rud2rLdQvMZeb3dlKLM45LL4iLAwFx8Uo5+TT/r11HLzwAIkDR5LzVbyaVbxcbEzFLw1VjXQovvCVzyJ1rO4q0go9oretRq9V2YzD4dPN8fXNPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 DM5PR12MB1852.namprd12.prod.outlook.com (2603:10b6:3:10a::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Thu, 19 Sep 2019 05:32:53 +0000
Received: from DM3NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Thu, 19 Sep 2019 05:32:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT006.mail.protection.outlook.com (10.152.82.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 05:32:52 +0000
Received: from rico-code.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 19 Sep 2019
 00:32:51 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/gfx10: add support for wks firmware loading
Date: Thu, 19 Sep 2019 13:32:47 +0800
Message-ID: <20190919053247.14172-1-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(428003)(199004)(189003)(5660300002)(486006)(186003)(36756003)(2351001)(14444005)(478600001)(2906002)(336012)(126002)(2616005)(51416003)(426003)(26005)(476003)(356004)(6666004)(305945005)(7696005)(44832011)(1076003)(86362001)(48376002)(70206006)(70586007)(6916009)(8936002)(81166006)(81156014)(53416004)(50226002)(8676002)(16586007)(47776003)(54906003)(316002)(4326008)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1852; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7f8421c-894b-4abc-e6d5-08d73cc2d14d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM5PR12MB1852; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1852:
X-Microsoft-Antispam-PRVS: <DM5PR12MB185220DD6680C7C21C2C0D0995890@DM5PR12MB1852.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 016572D96D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: B4Frq91QI/VhsOS7QicSV8tzRtqMWV7VD+WkMj+Cz36pPZinoLkFkRXkV8B0Wl2VLTIvZAhSZnO38gAVY8wG3KbAUuT71iVIhox4y17b1Q9RRoliTX+dDiIjIfnj+dXRXaI807vrpStyZikhCmuP4KMrIx9KVatzNWRuSSvF1ke+XR7eLOFeW8Xjv7B50hx+CtP+dfPG7PsIaRVbidtMtteTo/R6bJvFBZHlkQ7gl0c7u56NffMsFNpfXD/Brb1tUK65U2EsEV1UvYMSxE6JH4E+zciA7o0LWdCjIb327BOm0KVFOpMQmjSAUoSRwu5JvrPQ6ba/bQ4H6FNK0eEvpNOjgD13gV6DYgxP4aHfiYxI7JeZachq2RtQsEIadvusSnOESErwilrvMkmfui0oGwlIZlOcMY57hSyOQgI6zFE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 05:32:52.6728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f8421c-894b-4abc-e6d5-08d73cc2d14d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1852
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jPLDqcp+1CCT22ZByTj+LM0aew9R/SqB4Q+g6Q3S3k=;
 b=A5Tm8ItqJUudHpYl5mSbwBqzF+k72KVB0uDzjsJV6HbTGjv7eqoQdGT7ees5m63zM7t/dAKS5BziDy8WO+0txW0cRXzJbORVUraPsCqhKd2FTR9f/C+lQbekAJf8tIfZWkmg8foNPNM+JKBXTEvHrIhKaBaBiFMuP/D/yrsFEAc=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tianci Yin <tianci.yin@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+Cgpsb2FkIGRpZmZlcmVudCBj
cCBmaXJtd2FyZSBhY2NvcmRpbmcgdG8gdGhlIERJRCBhbmQgUklECgpTaWduZWQtb2ZmLWJ5OiBU
aWFuY2kuWWluIDx0aWFuY2kueWluQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3YxMF8wLmMgfCAyMiArKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4IDA4MmEwYjMyOThhOS4uNjVjYWY0MDRlN2QxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwpAQCAtNjYsNiArNjYsMTEgQEAgTU9E
VUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEwX21lYy5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgi
YW1kZ3B1L25hdmkxMF9tZWMyLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEw
X3JsYy5iaW4iKTsKIAorTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTE0X2NlX3drcy5iaW4i
KTsKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxNF9wZnBfd2tzLmJpbiIpOworTU9EVUxF
X0ZJUk1XQVJFKCJhbWRncHUvbmF2aTE0X21lX3drcy5iaW4iKTsKK01PRFVMRV9GSVJNV0FSRSgi
YW1kZ3B1L25hdmkxNF9tZWNfd2tzLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2
aTE0X21lYzJfd2tzLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTE0X2NlLmJp
biIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTE0X3BmcC5iaW4iKTsKIE1PRFVMRV9G
SVJNV0FSRSgiYW1kZ3B1L25hdmkxNF9tZS5iaW4iKTsKQEAgLTU5MSw3ICs1OTYsOCBAQCBzdGF0
aWMgdm9pZCBnZnhfdjEwXzBfY2hlY2tfZ2Z4b2ZmX2ZsYWcoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiBzdGF0aWMgaW50IGdmeF92MTBfMF9pbml0X21pY3JvY29kZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIHsKIAljb25zdCBjaGFyICpjaGlwX25hbWU7Ci0JY2hhciBmd19uYW1l
WzMwXTsKKwljaGFyIGZ3X25hbWVbNDBdOworCWNoYXIgd2tzWzEwXTsKIAlpbnQgZXJyOwogCXN0
cnVjdCBhbWRncHVfZmlybXdhcmVfaW5mbyAqaW5mbyA9IE5VTEw7CiAJY29uc3Qgc3RydWN0IGNv
bW1vbl9maXJtd2FyZV9oZWFkZXIgKmhlYWRlciA9IE5VTEw7CkBAIC02MDQsMTIgKzYxMCwxNiBA
QCBzdGF0aWMgaW50IGdmeF92MTBfMF9pbml0X21pY3JvY29kZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAogCURSTV9ERUJVRygiXG4iKTsKIAorCW1lbXNldCh3a3MsIDAsIHNpemVvZih3
a3MpKTsKIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJ
CWNoaXBfbmFtZSA9ICJuYXZpMTAiOwogCQlicmVhazsKIAljYXNlIENISVBfTkFWSTE0OgogCQlj
aGlwX25hbWUgPSAibmF2aTE0IjsKKwkJaWYgKCEoYWRldi0+cGRldi0+ZGV2aWNlID09IDB4NzM0
MCAmJgorCQkgICAgICBhZGV2LT5wZGV2LT5yZXZpc2lvbiAhPSAweDAwKSkKKwkJCXNucHJpbnRm
KHdrcywgc2l6ZW9mKHdrcyksICJfd2tzIik7CiAJCWJyZWFrOwogCWNhc2UgQ0hJUF9OQVZJMTI6
CiAJCWNoaXBfbmFtZSA9ICJuYXZpMTIiOwpAQCAtNjE4LDcgKzYyOCw3IEBAIHN0YXRpYyBpbnQg
Z2Z4X3YxMF8wX2luaXRfbWljcm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlC
VUcoKTsKIAl9CiAKLQlzbnByaW50Zihmd19uYW1lLCBzaXplb2YoZndfbmFtZSksICJhbWRncHUv
JXNfcGZwLmJpbiIsIGNoaXBfbmFtZSk7CisJc25wcmludGYoZndfbmFtZSwgc2l6ZW9mKGZ3X25h
bWUpLCAiYW1kZ3B1LyVzX3BmcCVzLmJpbiIsIGNoaXBfbmFtZSwgd2tzKTsKIAllcnIgPSByZXF1
ZXN0X2Zpcm13YXJlKCZhZGV2LT5nZngucGZwX2Z3LCBmd19uYW1lLCBhZGV2LT5kZXYpOwogCWlm
IChlcnIpCiAJCWdvdG8gb3V0OwpAQCAtNjI5LDcgKzYzOSw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Yx
MF8wX2luaXRfbWljcm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWFkZXYtPmdm
eC5wZnBfZndfdmVyc2lvbiA9IGxlMzJfdG9fY3B1KGNwX2hkci0+aGVhZGVyLnVjb2RlX3ZlcnNp
b24pOwogCWFkZXYtPmdmeC5wZnBfZmVhdHVyZV92ZXJzaW9uID0gbGUzMl90b19jcHUoY3BfaGRy
LT51Y29kZV9mZWF0dXJlX3ZlcnNpb24pOwogCi0Jc25wcmludGYoZndfbmFtZSwgc2l6ZW9mKGZ3
X25hbWUpLCAiYW1kZ3B1LyVzX21lLmJpbiIsIGNoaXBfbmFtZSk7CisJc25wcmludGYoZndfbmFt
ZSwgc2l6ZW9mKGZ3X25hbWUpLCAiYW1kZ3B1LyVzX21lJXMuYmluIiwgY2hpcF9uYW1lLCB3a3Mp
OwogCWVyciA9IHJlcXVlc3RfZmlybXdhcmUoJmFkZXYtPmdmeC5tZV9mdywgZndfbmFtZSwgYWRl
di0+ZGV2KTsKIAlpZiAoZXJyKQogCQlnb3RvIG91dDsKQEAgLTY0MCw3ICs2NTAsNyBAQCBzdGF0
aWMgaW50IGdmeF92MTBfMF9pbml0X21pY3JvY29kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIAlhZGV2LT5nZngubWVfZndfdmVyc2lvbiA9IGxlMzJfdG9fY3B1KGNwX2hkci0+aGVhZGVy
LnVjb2RlX3ZlcnNpb24pOwogCWFkZXYtPmdmeC5tZV9mZWF0dXJlX3ZlcnNpb24gPSBsZTMyX3Rv
X2NwdShjcF9oZHItPnVjb2RlX2ZlYXR1cmVfdmVyc2lvbik7CiAKLQlzbnByaW50Zihmd19uYW1l
LCBzaXplb2YoZndfbmFtZSksICJhbWRncHUvJXNfY2UuYmluIiwgY2hpcF9uYW1lKTsKKwlzbnBy
aW50Zihmd19uYW1lLCBzaXplb2YoZndfbmFtZSksICJhbWRncHUvJXNfY2Ulcy5iaW4iLCBjaGlw
X25hbWUsIHdrcyk7CiAJZXJyID0gcmVxdWVzdF9maXJtd2FyZSgmYWRldi0+Z2Z4LmNlX2Z3LCBm
d19uYW1lLCBhZGV2LT5kZXYpOwogCWlmIChlcnIpCiAJCWdvdG8gb3V0OwpAQCAtNzA1LDcgKzcx
NSw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2luaXRfbWljcm9jb2RlKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCWlmIChhZGV2LT5nZngucmxjLmlzX3JsY192Ml8xKQogCQlnZnhfdjEw
XzBfaW5pdF9ybGNfZXh0X21pY3JvY29kZShhZGV2KTsKIAotCXNucHJpbnRmKGZ3X25hbWUsIHNp
emVvZihmd19uYW1lKSwgImFtZGdwdS8lc19tZWMuYmluIiwgY2hpcF9uYW1lKTsKKwlzbnByaW50
Zihmd19uYW1lLCBzaXplb2YoZndfbmFtZSksICJhbWRncHUvJXNfbWVjJXMuYmluIiwgY2hpcF9u
YW1lLCB3a3MpOwogCWVyciA9IHJlcXVlc3RfZmlybXdhcmUoJmFkZXYtPmdmeC5tZWNfZncsIGZ3
X25hbWUsIGFkZXYtPmRldik7CiAJaWYgKGVycikKIAkJZ290byBvdXQ7CkBAIC03MTYsNyArNzI2
LDcgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCiAJYWRldi0+Z2Z4Lm1lY19md192ZXJzaW9uID0gbGUzMl90b19jcHUoY3Bf
aGRyLT5oZWFkZXIudWNvZGVfdmVyc2lvbik7CiAJYWRldi0+Z2Z4Lm1lY19mZWF0dXJlX3ZlcnNp
b24gPSBsZTMyX3RvX2NwdShjcF9oZHItPnVjb2RlX2ZlYXR1cmVfdmVyc2lvbik7CiAKLQlzbnBy
aW50Zihmd19uYW1lLCBzaXplb2YoZndfbmFtZSksICJhbWRncHUvJXNfbWVjMi5iaW4iLCBjaGlw
X25hbWUpOworCXNucHJpbnRmKGZ3X25hbWUsIHNpemVvZihmd19uYW1lKSwgImFtZGdwdS8lc19t
ZWMyJXMuYmluIiwgY2hpcF9uYW1lLCB3a3MpOwogCWVyciA9IHJlcXVlc3RfZmlybXdhcmUoJmFk
ZXYtPmdmeC5tZWMyX2Z3LCBmd19uYW1lLCBhZGV2LT5kZXYpOwogCWlmICghZXJyKSB7CiAJCWVy
ciA9IGFtZGdwdV91Y29kZV92YWxpZGF0ZShhZGV2LT5nZngubWVjMl9mdyk7Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
