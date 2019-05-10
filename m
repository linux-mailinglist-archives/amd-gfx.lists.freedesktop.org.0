Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0210D198DA
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 09:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3A58979E;
	Fri, 10 May 2019 07:17:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780055.outbound.protection.outlook.com [40.107.78.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B9A8979E
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 07:17:55 +0000 (UTC)
Received: from BN8PR12CA0004.namprd12.prod.outlook.com (2603:10b6:408:60::17)
 by BN6SPR00MB03.namprd12.prod.outlook.com (2603:10b6:404:b3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Fri, 10 May
 2019 07:17:54 +0000
Received: from BY2NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by BN8PR12CA0004.outlook.office365.com
 (2603:10b6:408:60::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Fri, 10 May 2019 07:17:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT020.mail.protection.outlook.com (10.152.84.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Fri, 10 May 2019 07:17:54 +0000
Received: from monk-build.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 10 May 2019
 02:17:53 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: avoid duplicated tmo report on same job
Date: Fri, 10 May 2019 15:17:48 +0800
Message-ID: <1557472668-12462-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(6916009)(53416004)(4326008)(50466002)(68736007)(72206003)(478600001)(305945005)(48376002)(2906002)(51416003)(53936002)(14444005)(86362001)(7696005)(356004)(6666004)(16586007)(316002)(47776003)(70586007)(336012)(70206006)(426003)(8936002)(50226002)(81166006)(81156014)(36756003)(8676002)(5660300002)(126002)(2616005)(77096007)(186003)(476003)(2351001)(26005)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6SPR00MB03; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a21fe46-af63-4dd0-371e-08d6d5179ea8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6SPR00MB03; 
X-MS-TrafficTypeDiagnostic: BN6SPR00MB03:
X-Microsoft-Antispam-PRVS: <BN6SPR00MB03EA191E5076B9646E7445840C0@BN6SPR00MB03.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:80;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tNYia5ImDh+sm+SZehN3pZE6+QggZ7STfvxSAZ+yk5Xg8L+4kUYXpF5gTypFMGBr61ePwpBx3KD60a6x1dzW4r3g5kwD/VaPZe432xv9Gyd/frRQk0gndC4t/m0m4IS/dfGwce1Z9PGNLNZrEgo86cRWC7c987/cY1QcfKUrKmPoE9FQqGtt+UVNIXX6ps6E6sKi9licxyFgibHr93nSBsjU+IH7YO8L8+6pt1snlgg5nd5AiWPcejPxzWzMnzWtkWORkziQcQExq7lBcYxVpV2vh7lCV8KveXDage1V4xMpRdbenEYBZh4AY71lXqenxc8euSO2SBjwxBFdCL9JpXpUT421DT9DTfyJpdJLU08KFIQrG+AFBapoHJ/PrJe9ytEW96Ug9PoICWp3w3WZhyqiRSEO6EsNj2utj4+DX7w=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 07:17:54.0660 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a21fe46-af63-4dd0-371e-08d6d5179ea8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6SPR00MB03
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu5EdmNQ/owCyWMKopYpi027xXw8HDNLy3oKeWiuElk=;
 b=gyh8RJVp0k8aKGeyQhMrnP84u1GEOcCgO49Od+WrMzVg3AhTM39MGWp+txN7ZD1W3aHpunk1Aen0KAH0pucXoT9k2x0Px42pRKnno0E6o9g4jFfTQhVk8yzLAIzAjAjZZloOadC1BJhReV3YnMq6mVkd3Wa5v5+fccnunGVeVL8=
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
Cc: Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogTW9uayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgIDMgKy0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMgICAgfCAxMiArKysrKysrKysrKy0KIGluY2x1ZGUv
ZHJtL2dwdV9zY2hlZHVsZXIuaCAgICAgICAgICAgICAgICB8ICAxICsKIDMgZmlsZXMgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggZDYyODZlZC4uZjFkYzBiYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMzM1Niw4ICszMzU2LDcg
QEAgYm9vbCBhbWRncHVfZGV2aWNlX3Nob3VsZF9yZWNvdmVyX2dwdShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIAlyZXR1cm4gdHJ1ZTsKIAogZGlzYWJsZWQ6Ci0JCURSTV9JTkZPKCJHUFUg
cmVjb3ZlcnkgZGlzYWJsZWQuXG4iKTsKLQkJcmV0dXJuIGZhbHNlOworCXJldHVybiBmYWxzZTsK
IH0KIAogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9i
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMKaW5kZXggMTM5Nzk0
Mi4uY2E2MjI1MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2pvYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYwpAQCAt
MzMsNiArMzMsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1f
c2NoZWRfam9iICpzX2pvYikKIAlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSB0b19hbWRncHVf
cmluZyhzX2pvYi0+c2NoZWQpOwogCXN0cnVjdCBhbWRncHVfam9iICpqb2IgPSB0b19hbWRncHVf
am9iKHNfam9iKTsKIAlzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5mbyB0aTsKKwlib29sIHJlY292ZXI7
CiAKIAltZW1zZXQoJnRpLCAwLCBzaXplb2Yoc3RydWN0IGFtZGdwdV90YXNrX2luZm8pKTsKIApA
QCAtNDIsNiArNDMsMTEgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1Y3Qg
ZHJtX3NjaGVkX2pvYiAqc19qb2IpCiAJCXJldHVybjsKIAl9CiAKKwlyZWNvdmVyID0gYW1kZ3B1
X2RldmljZV9zaG91bGRfcmVjb3Zlcl9ncHUocmluZy0+YWRldik7CisJaWYgKHNfam9iLT5zY2hl
ZC0+bGFzdF90bW9faWQgPT0gc19qb2ItPmlkKQorCQlnb3RvIHNraXBfcmVwb3J0OworCisJc19q
b2ItPnNjaGVkLT5sYXN0X3Rtb19pZCA9IHNfam9iLT5pZDsKIAlhbWRncHVfdm1fZ2V0X3Rhc2tf
aW5mbyhyaW5nLT5hZGV2LCBqb2ItPnBhc2lkLCAmdGkpOwogCURSTV9FUlJPUigicmluZyAlcyB0
aW1lb3V0LCBzaWduYWxlZCBzZXE9JXUsIGVtaXR0ZWQgc2VxPSV1XG4iLAogCQkgIGpvYi0+YmFz
ZS5zY2hlZC0+bmFtZSwgYXRvbWljX3JlYWQoJnJpbmctPmZlbmNlX2Rydi5sYXN0X3NlcSksCkBA
IC00OSw3ICs1NSwxMSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCBk
cm1fc2NoZWRfam9iICpzX2pvYikKIAlEUk1fRVJST1IoIlByb2Nlc3MgaW5mb3JtYXRpb246IHBy
b2Nlc3MgJXMgcGlkICVkIHRocmVhZCAlcyBwaWQgJWRcbiIsCiAJCSAgdGkucHJvY2Vzc19uYW1l
LCB0aS50Z2lkLCB0aS50YXNrX25hbWUsIHRpLnBpZCk7CiAKLQlpZiAoYW1kZ3B1X2RldmljZV9z
aG91bGRfcmVjb3Zlcl9ncHUocmluZy0+YWRldikpCisJaWYgKCFyZWNvdmVyKQorCQlEUk1fSU5G
TygiR1BVIHJlY292ZXJ5IGRpc2FibGVkLlxuIik7CisKK3NraXBfcmVwb3J0OgorCWlmIChyZWNv
dmVyKQogCQlhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHJpbmctPmFkZXYsIGpvYik7CiB9CiAK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaCBiL2luY2x1ZGUvZHJtL2dw
dV9zY2hlZHVsZXIuaAppbmRleCA5YzJhOTU3Li4xOTQ0ZDI3IDEwMDY0NAotLS0gYS9pbmNsdWRl
L2RybS9ncHVfc2NoZWR1bGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oCkBA
IC0yODIsNiArMjgyLDcgQEAgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyIHsKIAlpbnQJCQkJaGFu
Z19saW1pdDsKIAlhdG9taWNfdCAgICAgICAgICAgICAgICAgICAgICAgIG51bV9qb2JzOwogCWJv
b2wJCQlyZWFkeTsKKwl1aW50NjRfdCBsYXN0X3Rtb19pZDsKIH07CiAKIGludCBkcm1fc2NoZWRf
aW5pdChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkLAotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
