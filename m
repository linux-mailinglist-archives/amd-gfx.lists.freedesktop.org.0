Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA66BED09
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 10:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CEB6EE46;
	Thu, 26 Sep 2019 08:08:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730068.outbound.protection.outlook.com [40.107.73.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539A36EE46
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 08:08:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BagEzdZrEemwAOu6C00R1eL5qknogxrsoFZrxvPzzeRxXe2OnUyrxdF10sbE331ldTNcFIg6k4a8aAHTOqBE/+TtxS0SI1PNrjyIUIJbq1ylwY+pAqZarUl2fQTETTAm/hw83JUG3cJ4DL7V2yd7L/Jac5G0FfE0sX9K0XM+6w4VtyPHkwCXRgeouUOauW/dtxrtJqsULaSpaj6QVo8UKmG1+sIcueHq6Kgmo6vPMegVcaTb98vwDsneiQb3TBulkPCb/3jbJX6V/ibUU4wQNr2MePtcpzb5UnvzKOk9f381Tdn2S0mFvotXW0z7Sp8KprqM0TgTsoqx75VX90pFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trLWx/46oGQDa4byawj6cd2flS0h+W5JkEHBWNYEeYc=;
 b=X88qRe8x9UOV5qik39L2tXfI3acWxD60FJAU5BV1hg4mOZyvXd6ynoRXESjB8akA07BTSZ/pzT2xgVk5Zxfz0Nzvm3QeiJXCCaZGxuvyaIHmzLlRpHgymCV6jhWeOqzwZ48NlDckWhFk6GHQq+r/Di1QbkQjIr++LczS2pj38VVp4k5R9ZbZDJtIk7fWr5GxMKlUC9VTc59uRHBeIZ/ZEKOMf/9IXlpT80hRUwppuUnq8lxNI+yZ9yasDYpikbFkldsbA3DTrK87wmN/LQ1Mu+kod2d6CXoF5TlyA3f+ALGSM+Fg5zDUCoTUT4zg9UXUDgkfhWM0S5F5PSK1PH/LZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3267.namprd12.prod.outlook.com (20.179.65.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 08:08:08 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3%7]) with mapi id 15.20.2305.016; Thu, 26 Sep 2019
 08:08:08 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Topic: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Index: AQHVdEGHm0iocdCUOEuYheblhNg2qw==
Date: Thu, 26 Sep 2019 08:08:08 +0000
Message-ID: <20190926080746.20765-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0060.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::24) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3ec4f55-7765-4364-8d6b-08d74258aa37
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB3267; 
x-ms-traffictypediagnostic: BN8PR12MB3267:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB326745DDCFD0BB2BF3B2920089860@BN8PR12MB3267.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(199004)(189003)(36756003)(54906003)(66476007)(64756008)(66556008)(66446008)(66946007)(6486002)(476003)(2616005)(486006)(99286004)(4744005)(86362001)(3846002)(386003)(478600001)(6436002)(6116002)(6506007)(316002)(26005)(186003)(14444005)(256004)(102836004)(6512007)(1076003)(81156014)(8676002)(81166006)(14454004)(50226002)(25786009)(2351001)(66066001)(5660300002)(5640700003)(305945005)(2906002)(8936002)(4326008)(2501003)(71200400001)(6916009)(7736002)(52116002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3267;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nwqIwJsrRRWEt88CAbOs9Ah4krLwDeAoq00Nm2Z6dS4VLgnRLBucEIX+5J88bYJjJKNrQoS1OUGijfW5VyJw4vxlOw/lZRmDK5WeJYhJrPtfAADEKpkD4oGllow5seTMUmibuAxG7saiIRhvcgrZr0Ovv38HhQroWJtCyeG4228nW7eh0M6HV7Af5i0RVga3BT9VwwBAfshwRrMiIeKtHGtMNhASmzEULNTwZ48lCIar9exUTCLH2lU/sE/UnTIVSk7N9y55Qxw2VU3IrgApv/YnvXgRxOA1cMg5pcCyVUxZIzl4+GKVk0GI/bAOK21LA4cs2+UiIdLR5UdyJbTBsV9or7wibiWu1O7xuRTbqpHml8eKrsJOrEGAcuoPBArq3jVWR0HGZ9mhCku8irl7T2QJfH2z5uvsr8FHV7Mixrc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ec4f55-7765-4364-8d6b-08d74258aa37
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 08:08:08.1504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H2DEJOK7w0hv2t0tIEMkP7OXnG/+p0KTPCnD/nxRXGL8SdDe5qzIJ8s1xxe1Wpyd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trLWx/46oGQDa4byawj6cd2flS0h+W5JkEHBWNYEeYc=;
 b=j2SNyQJswMkwqUZd5Wvz3/dEw+i709dDDrAJwI/GhgjQLnXGys0OgPM4+LJImkV5T1jDXL2SS5J2PxQZT3qnRYYvASgQoPs7cSeugKhI1pCUkDnJtCJ8ikd0FjQydH3hy6U5oZz2Lf0VYYEV6yzOjsIA4JpJwh7mNXXmkWkVg/Q=
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXM6IDc2N2FjYWJkYWM4MSAoImRybS9hbWQvcG93ZXJwbGF5OiBhZGQgYmFjbyBzbXUgcmVz
ZXQgZnVuY3Rpb24gZm9yIHNtdTExIikKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFv
amllLnl1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEw
XzAuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjEwXzAuYwppbmRleCBjYjNmNjE4NzNiYWEuLmRjMmU2OGUwMTllYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKQEAgLTI5Miw2ICsyOTIsNyBA
QCBzdGF0aWMgdm9pZCBnbWNfdjEwXzBfZmx1c2hfZ3B1X3RsYihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgdWludDMyX3Qgdm1pZCwKIAogCWlmICghYWRldi0+bW1hbi5idWZmZXJfZnVuY3Nf
ZW5hYmxlZCB8fAogCSAgICAhYWRldi0+aWJfcG9vbF9yZWFkeSB8fAorCSAgICAhKGFkZXYtPmFz
aWNfdHlwZSA+PSBDSElQX05BVkkxMCAmJiBhZGV2LT5hc2ljX3R5cGUgPD0gQ0hJUF9OQVZJMTIp
IHx8CiAJICAgIGFkZXYtPmluX2dwdV9yZXNldCkgewogCQlnbWNfdjEwXzBfZmx1c2hfdm1faHVi
KGFkZXYsIHZtaWQsIEFNREdQVV9HRlhIVUJfMCwgMCk7CiAJCW11dGV4X3VubG9jaygmYWRldi0+
bW1hbi5ndHRfd2luZG93X2xvY2spOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
