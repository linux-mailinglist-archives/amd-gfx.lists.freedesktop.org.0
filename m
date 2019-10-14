Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDE6D59DE
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 05:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C286E1B7;
	Mon, 14 Oct 2019 03:21:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690068.outbound.protection.outlook.com [40.107.69.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC836E1B5
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 03:21:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAPUcMuMsRxFRm6Y1P66kZysjCekVrprSj5b+d8kyIJNHDKw3EM9xpnh13zwgzEvmfvgdEpzyzAoAtegPnnYEBZa6nQ1vE7duZC99oqtfuaLMZx9Gt0sJ+pmYo30vdmHwcjZgxco4e+9HUsWcXlTtR/EhkrjfGs2dTT7Ri/z364567hB2ec5yAXA7lG6vD/CSaJ6FN75/X2UvEi/ZlTNR0VQrkc6qv//ROdfLeq99P2LMvFz9hUJbpcGOXZtmEX0luoQWEaDGFi/k54lFkeJSaValg9Pz86dmj4ovztEYyzJcUKiz7M2ZiLuYbpzWm57YbcO3i0eQJvecuCdqmk01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho6HZDyJIsh3NY3bcMzdyDeD9EqeHqxWV5+7gTGS1RM=;
 b=cgb+o1rpVEPNQpL9wKC17JgFF9v1n04DUd1SqnUsB9gV6rDKgBQojCR3nTBJOtrKxLFz6Iaa+UXi6FGIFn9nFfxaI3UC91KQaBIqJf8TzrC9PHUF31xnKdptEBWeX1JmJynRn5ycIV8PPNxC5lxivE9cofyLxeqNighvttDGJbAFbkTBJdam6P70Ic4y1NLbbmYKcy6o+2pqqnoQPQymcNZA6QWxfzZasJ+u0GX8RJELIucoegb6/z1P9Jpg45iDbw5N9jqa4BNrDuXu05SxDP6v6Dzmh00tMdON/dxkzPrpMxrWnd3ooB0EiHUje6Z/bHXRA5xNlunwQx9bjCWtTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0055.namprd12.prod.outlook.com (2603:10b6:3:103::17)
 by CY4PR1201MB0006.namprd12.prod.outlook.com (2603:10b6:903:d3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Mon, 14 Oct
 2019 03:21:24 +0000
Received: from CO1NAM03FT054.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM5PR12CA0055.outlook.office365.com
 (2603:10b6:3:103::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Mon, 14 Oct 2019 03:21:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT054.mail.protection.outlook.com (10.152.81.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2347.21 via Frontend Transport; Mon, 14 Oct 2019 03:21:23 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 13 Oct
 2019 22:21:22 -0500
Received: from rico-code.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Sun, 13 Oct 2019 22:21:21 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/8] drm/amdgpu: update amdgpu_discovery to handle revision
Date: Mon, 14 Oct 2019 11:21:11 +0800
Message-ID: <20191014032118.14020-1-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(428003)(199004)(189003)(53416004)(86362001)(1076003)(81166006)(8676002)(2351001)(70586007)(81156014)(8936002)(14444005)(50226002)(70206006)(356004)(6666004)(6916009)(305945005)(486006)(476003)(126002)(336012)(2616005)(44832011)(426003)(5660300002)(478600001)(26005)(186003)(51416003)(7696005)(2906002)(36756003)(4326008)(16586007)(54906003)(47776003)(50466002)(316002)(15650500001)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0006; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0f95a31-b1eb-434a-280d-08d75055975c
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0006:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB000691326F19732F44E96F2195900@CY4PR1201MB0006.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 01901B3451
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wVkMZMmUtNmMgYko0tJFdk8jJYYo4KTSgJH+6k+EQjhibQF2xKy6ZKWb+cWzfoFzWQUMF+xj+3wovQPjkqs3dnaUaoXVUH3O8W3kSg67MMRAB0OC4XbbQbTEeVV8hcbQ1cdGP4E3LmrBxG7BXK3WyUpmtGaglsja19WgfKhRV7IxLAOE1Ah8D8/h1Hccsgp7y2l+Wtve0rnilkCKjx+PWDoSN8qy6+LdVORALC3nflSBfqB+kndTMRC3uVv7rjcy+7QCMmbR/nYoxMWVq/QyIwphE4/ko2jB+TkMX5yBRnBxikTqjxAtNbhv06S3xbNb4Bz3x3TWQl1HZDRrc+x6M3Yi6qdlZ6MSetmjHMyWLyLjlf8J7vgmSLpUj2gqIVv9dMpb1/V/dtLQyN/tdrt6IxN2Xqv6V1Y2xPfBt19mkLo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 03:21:23.6424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f95a31-b1eb-434a-280d-08d75055975c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0006
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho6HZDyJIsh3NY3bcMzdyDeD9EqeHqxWV5+7gTGS1RM=;
 b=wonDBqxLHVSiBJw05v6GhCZXVsf3m7oQETIhFkk5AitbUtyGzyLohsMW7mmXrYxIACUaYAXtMzSUYDsCON9Xv7sbBjU48ZcM8fK+XAvoNCHmAj8Dc8Rz0SVGIAbg/87D9JRy4QMCKRmRKJ3UHHssEhsCTqHn+X9p8im+U/ovdxo=
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
Cc: Deucher Alexander <Alexander.Deucher@amd.com>,
 Tuikov Luben <Luben.Tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tianci Yin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+Cgp1cGRhdGUgYW1kZ3B1X2Rp
c2NvdmVyeSB0byBnZXQgSVAgcmV2aXNpb24uCgpDaGFuZ2UtSWQ6IElmODE1MjEwM2QwM2I1OGUx
ZGMwZjMyZGI2MzYyNWUyOTBmNWYwOGEwClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFRpYW5jaS5ZaW4gPHRpYW5jaS55
aW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292
ZXJ5LmMgfCA0ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3Zl
cnkuaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNj
b3ZlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYwpp
bmRleCA3MTE5OGM1MzE4ZTEuLmRkZDgzNjQxMDJhMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYwpAQCAtMzMzLDcgKzMzMyw3IEBAIGludCBhbWRn
cHVfZGlzY292ZXJ5X3JlZ19iYXNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB9
CiAKIGludCBhbWRncHVfZGlzY292ZXJ5X2dldF9pcF92ZXJzaW9uKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCBpbnQgaHdfaWQsCi0JCQkJICAgIGludCAqbWFqb3IsIGludCAqbWlub3IpCisJ
CQkJICAgIGludCAqbWFqb3IsIGludCAqbWlub3IsIGludCAqcmV2aXNpb24pCiB7CiAJc3RydWN0
IGJpbmFyeV9oZWFkZXIgKmJoZHI7CiAJc3RydWN0IGlwX2Rpc2NvdmVyeV9oZWFkZXIgKmloZHI7
CkBAIC0zNjksNiArMzY5LDggQEAgaW50IGFtZGdwdV9kaXNjb3ZlcnlfZ2V0X2lwX3ZlcnNpb24o
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBod19pZCwKIAkJCQkJKm1ham9yID0gaXAt
Pm1ham9yOwogCQkJCWlmIChtaW5vcikKIAkJCQkJKm1pbm9yID0gaXAtPm1pbm9yOworCQkJCWlm
IChyZXZpc2lvbikKKwkJCQkJKnJldmlzaW9uID0gaXAtPnJldmlzaW9uOwogCQkJCXJldHVybiAw
OwogCQkJfQogCQkJaXBfb2Zmc2V0ICs9IHNpemVvZigqaXApICsgNCAqIChpcC0+bnVtX2Jhc2Vf
YWRkcmVzcyAtIDEpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rpc2NvdmVyeS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2Nv
dmVyeS5oCmluZGV4IDVhNjY5M2Q3ZDI2OS4uYmE3OGUxNWQ5YjA1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5oCkBAIC0zMCw3ICszMCw3IEBAIGlu
dCBhbWRncHVfZGlzY292ZXJ5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogdm9p
ZCBhbWRncHVfZGlzY292ZXJ5X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50
IGFtZGdwdV9kaXNjb3ZlcnlfcmVnX2Jhc2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dik7CiBpbnQgYW1kZ3B1X2Rpc2NvdmVyeV9nZXRfaXBfdmVyc2lvbihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgaW50IGh3X2lkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50ICptYWpvciwgaW50ICptaW5vcik7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbnQgKm1ham9yLCBpbnQgKm1pbm9yLCBpbnQgKnJldmlzaW9uKTsKIGludCBhbWRn
cHVfZGlzY292ZXJ5X2dldF9nZnhfaW5mbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAK
ICNlbmRpZiAvKiBfX0FNREdQVV9ESVNDT1ZFUllfXyAqLwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
