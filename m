Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DC7A862C
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0CA89BFE;
	Wed,  4 Sep 2019 15:48:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810050.outbound.protection.outlook.com [40.107.81.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAE889BF1
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:48:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvleUD8IPjztwXArRbDOeBuGIzCJ6IXqRj+D9r0wI1wc0BPGr4+sy8hZAE6dYqgmvu34jXvNVvGmGc8T3pX6BtPXLMMqyIeoXX3QxdRCVaGDrIK1n2k9FngJjE/xYRNvnWyOrvJg3AWHSIibLF1cTgM9LhqtUrwkU5wifTcTzgUcTRjAAl9BXIYIW2HVb/jtK1WjNgAjVqarFOugrZ2agNQdWE9sLn2v2n7NUofA9gS57h7kthoI19mghsHWDcK7++tAk6G+VsDD2kcP+WzU4bS2eNWoxqVzfU8m9YS5zR+Qsn3nb+RKll7hPGr1Jrbcc3KJv/tUdPaayfW+OB6rWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7o67eQq3aEY79KwAkIg/w+BDyUpC66KC6ANwVBg7tDA=;
 b=K52BsBWibqmNnaCUfkuoDVYZs+F5A9i+wcs0r16VoYtdXi+cNoJHxMuOz8GsuhdQgYiH1UCAP+ua8AmrDPNHOwPjgBZcy2evJDKS2BOUox6229HlJMafkGkO/ww+CJvAUGTTaPbYioh7eu8qIaPGv3qWAGRXG1v4RYmdp+Pzj+QL0Ehg4ebhs+/O//IZ/HgEW6S+K3uRQroleu32TGXQf1zC8wCGDULHi/0DBE9vjyitciceTAMvwbqNmKsOgB4eZSKQXdIRjCF2NtkKYtbJFXsiHJcp0qDNMc+PdVtgmwTC4lY7DQWCPWheess8aKaK+nX8gnLcSX0p8wSamO8iRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2863.namprd12.prod.outlook.com (20.179.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 15:48:29 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 15:48:29 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/10] drm/amdkfd: init kfd apertures v9 for renoir
Thread-Topic: [PATCH 05/10] drm/amdkfd: init kfd apertures v9 for renoir
Thread-Index: AQHVYzgyZMxkClLv/U2oLTCtQnD1Dw==
Date: Wed, 4 Sep 2019 15:48:29 +0000
Message-ID: <20190904154803.5102-6-ray.huang@amd.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
In-Reply-To: <20190904154803.5102-1-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80ec4910-266b-4069-38c0-08d7314f54a7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2863; 
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2863CA84074852E2B8A6B739ECB80@MN2PR12MB2863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(66446008)(99286004)(64756008)(305945005)(66556008)(66476007)(66946007)(6436002)(5640700003)(86362001)(7736002)(3846002)(6116002)(486006)(256004)(6916009)(5660300002)(8676002)(2351001)(4326008)(6506007)(386003)(14454004)(316002)(54906003)(6486002)(11346002)(76176011)(478600001)(446003)(53936002)(52116002)(26005)(71190400001)(71200400001)(102836004)(66066001)(1076003)(186003)(36756003)(8936002)(25786009)(4744005)(50226002)(81156014)(2501003)(81166006)(6512007)(2616005)(476003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2863;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +ktj7znk3v7LlPIJfA7jyp5wP7eUXn61ajWcN84JJf91sOEoDc9CTGTUh1+7p2lhpDfkknmo97goopLTi7jFnrEKAIspQc71z0b9Qc+HKXFUI4ZjlobQ+mImmwmHXovlYtkIQarPUYcOoaUolOuYo6M1rR5N2uFPvxAK5zwuZWSmZXp4ZoZxJl/9+J5/gTLU0WuEY+lnhhN1PH4M4LoSwIUsxZKjmZaQC1XwIcDS1Z0A5+DpKLVsZPKbTCFLU2Re2MUWabCwmqmQXuzhH6llm9Po9PnfDoAcF9t0R2LA58ouXQrSsNdEtELpOM028e+5qAUaaU65yMJo56x74Hdy2wIDzWld9AYd2Ncl6EhmU9fX93gkmd5Aj0S3wipwzfZFtpPawjg7XzXJUXwKgG4/Pc8nVssGD66VmfscSdNqV5Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ec4910-266b-4069-38c0-08d7314f54a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:48:29.1325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lfV8qPzUYg51vErtRolpPk4CdirZiHFuezxygWOx7FMeW87tDhX5wJV0Bjp673juI7+oYjGhxecz86aHYU8N9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7o67eQq3aEY79KwAkIg/w+BDyUpC66KC6ANwVBg7tDA=;
 b=JPgfevTkJvDuvn1rnlZU4l2guZ1L/8135AxZc28EQ/G3dqKJCW0ifdZ5GPAK9esOnOzgrKTyfwC05ssCXxsn8uJaR+lj/8aKGdyNKz668CBpNUL3Z3lM8c6doxVNA5uL6nT7W+X2TTP0fFq7AXQEk4uiAynPpZe+hk2C4uL5ScI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVub2lyIGlzIEdNQyB2OSwgc28gaW5pdCB2OSBrZmQgYXBlcnR1cmVzLgoKU2lnbmVkLW9mZi1i
eTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZmxhdF9tZW1vcnkuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ZsYXRf
bWVtb3J5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZmxhdF9tZW1vcnkuYwpp
bmRleCA3YTViM2IyLi45ODljNzRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZmxhdF9tZW1vcnkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfZmxhdF9tZW1vcnkuYwpAQCAtNDEwLDYgKzQxMCw3IEBAIGludCBrZmRfaW5pdF9hcGVydHVy
ZXMoc3RydWN0IGtmZF9wcm9jZXNzICpwcm9jZXNzKQogCQkJY2FzZSBDSElQX1ZFR0ExMjoKIAkJ
CWNhc2UgQ0hJUF9WRUdBMjA6CiAJCQljYXNlIENISVBfUkFWRU46CisJCQljYXNlIENISVBfUkVO
T0lSOgogCQkJY2FzZSBDSElQX05BVkkxMDoKIAkJCQlrZmRfaW5pdF9hcGVydHVyZXNfdjkocGRk
LCBpZCk7CiAJCQkJYnJlYWs7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
