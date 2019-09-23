Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B95BB5DE
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 15:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873C26E91F;
	Mon, 23 Sep 2019 13:58:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4e::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFBC6E921
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 13:58:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCNuCec8klfX0E7rYCDuOCUdO5/WXXJvuROsXtYdWgZCadurRDjrPNdBN/pgA4FrVEoDhOwioPZnEtcMpg6t3boVZjic1TT0M62SzJzJ+F/pu06to7zgJEBemkpJgiJ3X9Og+qDfVKHVGhxaYT7QPVCZwldmorq90j8CU43Xu4dcQ+0o0C7UAfT8UZyGTpV+Tu1lnVpD3Dh3Psz0aabFTGbJGzTOk4Dry6Z6DQ7UGeheK/uIyrLEgPZHFbuyk2HCtlQGhdKSO4d6AGbU3wN6EMaLU/1hrOMY3YADXalniCXzfFj0OdGMG3r+RXMkstMFi3cQwHUbInFMRh4GwKPn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZFhYwK9TL3GkqWRkcX0bZYiyT6Q6ATivkSPmtNWv98=;
 b=DuPPjCsu+G5etJB7iLjdGJbvIKctZSrf3VrNr+PDExt2rtk8PEETyEAwJlcguqmH9J2iiSpXKbCYCAg9DAy5DQa1BSqov0c5RcpzaWNdbkNUqUdqqGdxAqbl7BS5fs9ZAzv87US/JVyInoBlzRLGdMsB+Ie/hqpRto3dckYZ8hDG/gxaiR8eg1kN06XB5HZGZj6La65s/c0Tb/ASpq9tCHAyr709Q2AGSU0qAwbjQB2b6zQDwY2RldNNMAMMGUKOuuhByXNYBs0BsXj4ccJcNxaG8+A6u2GHCl1EW/V3E/ROh2URfsoUIl6rgcMxpCJwUi57/JJR5l3dHL+4luMKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3588.namprd12.prod.outlook.com (20.178.210.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Mon, 23 Sep 2019 13:58:10 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 13:58:09 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu/gmc10: do not apply the 'invalidation from
 sdma' workaround for navi12
Thread-Topic: [PATCH 1/2] drm/amdgpu/gmc10: do not apply the 'invalidation
 from sdma' workaround for navi12
Thread-Index: AQHVchbuzvgxiyJrjU6lDBJ5+GFvFA==
Date: Mon, 23 Sep 2019 13:58:09 +0000
Message-ID: <20190923135746.8066-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0077.apcprd03.prod.outlook.com
 (2603:1096:203:72::17) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c555bc3d-c75c-4a0f-3669-08d7402e10c4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB3588; 
x-ms-traffictypediagnostic: BN8PR12MB3588:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3588EC282C40D96920341E5C89850@BN8PR12MB3588.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(199004)(189003)(102836004)(8676002)(81156014)(81166006)(8936002)(26005)(1076003)(5660300002)(2906002)(99286004)(6916009)(2351001)(6116002)(71200400001)(71190400001)(4744005)(256004)(3846002)(36756003)(14444005)(66946007)(66476007)(66556008)(64756008)(66446008)(2501003)(6436002)(4326008)(5640700003)(50226002)(6512007)(52116002)(316002)(54906003)(66066001)(6486002)(305945005)(486006)(7736002)(478600001)(186003)(386003)(2616005)(86362001)(6506007)(476003)(25786009)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3588;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NxXaYg8VXh/lpgArTVAOHGaER284Z4ruwtzYgRLFA5mZ8WfTHK3bAXrQ9P7QpJJ0gDKIZdUTh9H8dTuU0DOvcwDAvNWKnYZIffERvWADDMhDDT1CFhTcyV5QBCCjm9NKmaMj0LZ99l+34OeQTJpcYXhcnDz2HrIERH0o5do8Qa2dB30VxDyD85HRLWcRsFNbBr1ByfhxAUvs1nT4FKUHewjYB2l5b1Yrc3dR7D3Ne0p+xxidrHyIfqB7xIC+I5fL7ynzX9xBS7yggN6jy/lnsgGyYn1zx2Przr/O1KZVI969BwDrvhx2KWCwPpz6+xwp8Q/yZH04fejC5f2hy0cWISyxrzTvKuw4JZFD3IiXsxS4JTwBgf+/5t5SW5HVWI0h70UX6d5rVWGDaLYX8O9TbU3odEdh2PAtZ+lmL6MEITs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c555bc3d-c75c-4a0f-3669-08d7402e10c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 13:58:09.5779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i++AzAR6vDRDYxNXRZ4CERO06HtSWZrZb1mbXypmghlJmBBaTJFHlruH6UmAd3WG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3588
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZFhYwK9TL3GkqWRkcX0bZYiyT6Q6ATivkSPmtNWv98=;
 b=dLEcmNTWV3Dl0ZZZpA6olbzNUpMOMfC3IOyZvpC2O+D8qEeippJXZ/wJVsbfZFze6n6ev3LRnFrLDk+INVPyzPZtqf1iLH7r+xR2E9LlVoiBbZKJS/nb31SSgIxT1G30t4uoH/GPiyTlVz6tFLsbb6dW5EoJZHA1A5tb1ZgdodU=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

d2hlbiBnZnhvZmYgaXMgZW5hYmxlZCwgYXBwbHlpbmcgdGhpcyB3b3JrYXJvdW5kIG1ha2VzIHNk
bWEgaGFuZyB3aGlsZQplbnRlcmluZyBkZXNrdG9wLgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZ
dWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjEwXzAuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYwppbmRleCBl
ZDFjM2I4ODNmNmEuLjM4OTdlMGQyODgzOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3YxMF8wLmMKQEAgLTI5MSw3ICsyOTEsOCBAQCBzdGF0aWMgdm9pZCBnbWNfdjEwXzBfZmx1c2hf
Z3B1X3RsYihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwKIAogCWlm
ICghYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfZW5hYmxlZCB8fAogCSAgICAhYWRldi0+aWJfcG9v
bF9yZWFkeSB8fAotCSAgICBhZGV2LT5hc2ljX3R5cGUgPiBDSElQX05BVkkxNCB8fAorCSAgICBh
ZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9OQVZJMTAgfHwKKwkgICAgYWRldi0+YXNpY190eXBlID09
IENISVBfTkFWSTE0IHx8CiAJICAgIGFkZXYtPmluX2dwdV9yZXNldCkgewogCQlnbWNfdjEwXzBf
Zmx1c2hfdm1faHViKGFkZXYsIHZtaWQsIEFNREdQVV9HRlhIVUJfMCwgMCk7CiAJCW11dGV4X3Vu
bG9jaygmYWRldi0+bW1hbi5ndHRfd2luZG93X2xvY2spOwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
