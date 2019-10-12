Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7352D4C5F
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 05:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE426EA1A;
	Sat, 12 Oct 2019 03:17:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810048.outbound.protection.outlook.com [40.107.81.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34396EA1A
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Oct 2019 03:16:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQIAHCArVLsHcOdvXs9ldACu0BfTn8T3SgItFzBJA7DlEmg0qVJplg3DEqdcjDuvfGbBn9+7kPzD1hVcrY/bKXwD8ZjxAM4LCkkjJs/qIGEq4/yx90st/vVPf5IJWxRwauhMnvtB+FobK3/g9Y7FemnmPc/XIvst6GEafJ5qTUndRzxSk9sMKCnVWJ/SSly2b2UZ97g1qBmE1xw9izp/RduZy8c+PuqSC2BO54qnZQbwKnOEGo+MxfXqRPs0oHXbHV5x9qfuFssWUSO6cwO2BiYvlUfJFjAZkC1kdsB8LtPsZx4hLcv4J58hjGMfwvGYK+Hk1h1eE41EWcV5geUwhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWE82YDNsKLU1zb3eOU5SgoBCs2FWebEnTr5ZLmWAlk=;
 b=XNDekLHF96Y1ETgS9Jz/b2tM1AJ4J9FowOIA3KNGm5ic51ZpFbKKQusTuF5YuTdazdq68F1+I4Plo49WRHKjgIhGTc0cjwFbZXQUQw/9ALlKHfnRNmIKKTdLDNvrnJ5SnOvv2Id6KJ9Cv9kXLkubo362GivF2rwdnlrisTg/DaYdhYRznYFvCQoTzN1Lr6yLGXszgKkPqnJPtjmoFl7J2MiAW8NiOm461/zguLFgUULtx+Gn7NwkHS8mcpq8idJitk0NVEx9ZoaHyhW7pOKVPjJ17widqlLllh++rOIRw1k+Ui/FGbqodd2WCejMfZxt4cGnstU3xtSJXgD91vQT7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3378.namprd12.prod.outlook.com (20.178.208.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Sat, 12 Oct 2019 03:16:55 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c%7]) with mapi id 15.20.2347.021; Sat, 12 Oct 2019
 03:16:55 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: print where the pptable comes from
Thread-Topic: [PATCH] drm/amd/powerplay: print where the pptable comes from
Thread-Index: AQHVgKt/cjKdPZbFQkuEDAE/0+Y1zg==
Date: Sat, 12 Oct 2019 03:16:54 +0000
Message-ID: <20191012031639.20104-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6ed163d-a25a-48b6-dbd7-08d74ec2a1e4
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3378:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB337894820DEE8806E81C75B589960@BN8PR12MB3378.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(199004)(189003)(486006)(6512007)(6506007)(102836004)(2616005)(386003)(476003)(186003)(316002)(2501003)(6486002)(54906003)(5640700003)(6436002)(25786009)(3846002)(6916009)(478600001)(14454004)(99286004)(6116002)(8936002)(256004)(50226002)(7736002)(305945005)(81156014)(81166006)(8676002)(64756008)(26005)(66066001)(1076003)(52116002)(66556008)(71200400001)(66476007)(2351001)(66446008)(86362001)(4326008)(2906002)(66946007)(5660300002)(71190400001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3378;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9L8LRd+Ji9mROSGrF3RnzQPxCMeXO8BmK0yS3gqlqnHP2TPQLnv/6fo1DijmfyR63du/bPPgdfLygMyFlBTTpNw16s8n6X5KbUQdzAQgHdxt9AyKEK1Qf8wktS0GjS47Ljn8sPStQchLz/mymo1Hn5XxSFosEPeVVJWez38meU1N3MdKkYxFQwbNVDFXcNdm4QU3ng0xlyReD+RU/LVvNUsf31J7IY0Sp13IvYjl+7oWUoFINVPAlPrI53Jfa1e4d1rvt6c1Ji2DVO6WLusNKSvXtgU+9ed7ScZZak5L10kQlbyWCJgvytKy/U/xx995Ehv08lv0Ef0ZIdLOjZmVLsrc4nrFw5TrtNzPZB/KKfQDpmjjuQBdW/7G4QId5j1mP7P/kwJh0tusvuMdTDNddLd7lbCudgBajj9BKVkkrNY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ed163d-a25a-48b6-dbd7-08d74ec2a1e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 03:16:54.7474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+wVdAYELjUy7ETmSGqjuEq+5Eu7b2oMrQDGNN65Q9x8XNL0zCmYsdkl74gUkJVM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3378
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWE82YDNsKLU1zb3eOU5SgoBCs2FWebEnTr5ZLmWAlk=;
 b=me8Omae8y7TUbymqlL0I74XjwD47YGTLwaTbfUT1BfEXRD8qORjDMhzhnqI1u2a/Y2HvJODCvBMHjBJDPwe0eKkDCl6LJAYZQrd0GAmn+brK7LjxoHITUhm2uyrhdir7iVGsTMpYZRLa2wLUHlpZ7ft8Dk+ebbj6FATZ9QWha2c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhpcyBoZWxwcyB0byBrbm93IHdoZXRoZXIgdGhlIHBwdGFibGUgaXMgZnJvbSBmaXJtd2FyZSBv
ciB2YmlvcwoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyB8IDUgKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IDk4ODNmMGE0NDcxYS4uODA5ODgzYzIxMjQxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpAQCAtMzY5LDYgKzM2
OSw5IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3NldHVwX3BwdGFibGUoc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUpCiAJdmVyc2lvbl9tYWpvciA9IGxlMTZfdG9fY3B1KGhkci0+aGVhZGVyLmhlYWRl
cl92ZXJzaW9uX21ham9yKTsKIAl2ZXJzaW9uX21pbm9yID0gbGUxNl90b19jcHUoaGRyLT5oZWFk
ZXIuaGVhZGVyX3ZlcnNpb25fbWlub3IpOwogCWlmICh2ZXJzaW9uX21ham9yID09IDIgJiYgc211
LT5zbXVfdGFibGUuYm9vdF92YWx1ZXMucHBfdGFibGVfaWQgPiAwKSB7CisJCXByX2luZm8oInVz
aW5nIHNvZnQgcHB0YWJsZSAjJWRcbiIsCisJCQkJc211LT5zbXVfdGFibGUuYm9vdF92YWx1ZXMu
cHBfdGFibGVfaWQpOworCiAJCXN3aXRjaCAodmVyc2lvbl9taW5vcikgewogCQljYXNlIDA6CiAJ
CQlyZXQgPSBzbXVfdjExXzBfc2V0X3BwdGFibGVfdjJfMChzbXUsICZ0YWJsZSwgJnNpemUpOwpA
QCAtMzg1LDYgKzM4OCw4IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3NldHVwX3BwdGFibGUoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJCQlyZXR1cm4gcmV0OwogCiAJfSBlbHNlIHsKKwkJcHJf
aW5mbygidXNpbmcgcHB0YWJsZSBmcm9tIHZiaW9zXG4iKTsKKwogCQlpbmRleCA9IGdldF9pbmRl
eF9pbnRvX21hc3Rlcl90YWJsZShhdG9tX21hc3Rlcl9saXN0X29mX2RhdGFfdGFibGVzX3YyXzEs
CiAJCQkJCQkgICAgcG93ZXJwbGF5aW5mbyk7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
