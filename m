Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DA878F44
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 17:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5955C89B38;
	Mon, 29 Jul 2019 15:31:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690050.outbound.protection.outlook.com [40.107.69.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8AC89B33
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 15:31:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqFHH3stle9PkVzMFzMurtIdC+/KCXvRcZAMA/wG3yj+Jdn8HibyEsiYXhfzbz5HQPl1akQBmbG/BoniS6bDNluLwYDAK44yIeTJ/wepEqoUOJVDz9Pq9qcsuPtcu4P6ndWC815Kd4EkP5fcKfj+MqA2+vk8aYDHw6ZDOF98e8JEZIsSYw33cIrETYpS3Q/iWG5uTRYXOQyQUpii+h6URUmBYbZwibU8kawLT0hvnPR4oHfvSGecjoJA6JsjOJa/empw94g+0hmIS3Qkp5WofPsNvugF+amIrEH5Ld12IRRn87G8hj6oCvF0KEcLWt/p9uTIZuVwEPEiDrAAn42eKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpZlxnNNGO1rKcvjL4+oU/EdwniX2uSTUM1q5odJkek=;
 b=jNvNXB87enfgzKScaVMHsG92ZAIBHONrHxnWAvWQk0EKPdpUGhroV9aOdr8lVxLl/enX0iJzCP8vfA1rAXRm+Fw0HbnrqjKQ8brOE4czBvWcakILVoWiUaQFLeIXoiRzuCVvR6nDWWOBxT5v4Q/K1sHuNj6RryJTxjJB4s6HUmfiln242HRFNot37317LbB3F4DK9IPrInfbHJJQnSKecq9KlgAKU4EPER8dLIi3Tq5far0DUHRZCWiIRoV/jpgr5YbRFqwU6v1bd/H0ui6vbX/aD3eFSwhJWB/4CO8bfLkPiruYxzGVoD0EAMZIzxWOwb8wZoR84Rdsz6XuL5bn0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3305.namprd12.prod.outlook.com (20.179.106.93) by
 DM6PR12MB3387.namprd12.prod.outlook.com (20.178.198.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 15:31:10 +0000
Received: from DM6PR12MB3305.namprd12.prod.outlook.com
 ([fe80::17b:9dff:4990:ec26]) by DM6PR12MB3305.namprd12.prod.outlook.com
 ([fe80::17b:9dff:4990:ec26%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 15:31:10 +0000
From: "Cornwall, Jay" <Jay.Cornwall@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdkfd: Fix gfx10 wave64 VGPR context restore
Thread-Topic: [PATCH 1/3] drm/amdkfd: Fix gfx10 wave64 VGPR context restore
Thread-Index: AQHVRiKmx1jqvJyykUGj1/vfbH6+LQ==
Date: Mon, 29 Jul 2019 15:31:10 +0000
Message-ID: <1564414258-18161-1-git-send-email-jay.cornwall@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.78.1]
x-clientproxiedby: SN1PR12CA0064.namprd12.prod.outlook.com
 (2603:10b6:802:20::35) To DM6PR12MB3305.namprd12.prod.outlook.com
 (2603:10b6:5:189::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f93eb02-a303-4435-5d15-08d71439c86d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3387; 
x-ms-traffictypediagnostic: DM6PR12MB3387:
x-microsoft-antispam-prvs: <DM6PR12MB338756F737D5D345E267494A87DD0@DM6PR12MB3387.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:57;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(189003)(199004)(2351001)(186003)(66946007)(66556008)(486006)(6512007)(64756008)(66446008)(2501003)(26005)(14454004)(68736007)(81156014)(81166006)(256004)(5640700003)(14444005)(66476007)(102836004)(53936002)(2616005)(476003)(52116002)(36756003)(99286004)(2906002)(50226002)(6486002)(6436002)(386003)(6506007)(8936002)(25786009)(7736002)(4326008)(6116002)(86362001)(316002)(54906003)(305945005)(478600001)(5660300002)(6916009)(3846002)(71190400001)(71200400001)(8676002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3387;
 H:DM6PR12MB3305.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3dgFQsPP2DXc0KotY8m73u2vPcTmG1h3r+HZjoyYY6kdNNUvOkfoXdPX7pgMnvZ4QPE2xqc0GjpGU5k6zBmDUAuCs3pL4k/SFdeyqCK8cypjmXAMbCfV+rKHEbynpUmh/llhyxeSzoOq2RiHi3EdSoH3VcUldOwnWfcSnyvlYKkdwMp9Alm/sMgCajsZ2MQ3K1fMx/h2+gXk3m0J2IoO/lXLXG/WAx0JpEeMI56zttYsGtO0KukpphRuz6MuqfvTJovZqrhoqaHgjvI2v7YhknQnlDs+qx6Y3SbpoAE8A2CZnprWNO7npqjkJd9/FVgqX0UDfBkBrwKhXeC0vQoiDibH+0Ta5YQwJUx+h6+qF6wkv/LcZ9EBT2C7rWGceqMXPFLfqKLf68mQtSHXOa7o1mVYutcSyzbkMLcybiC0Kr4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f93eb02-a303-4435-5d15-08d71439c86d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 15:31:10.7134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jcornwal@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3387
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpZlxnNNGO1rKcvjL4+oU/EdwniX2uSTUM1q5odJkek=;
 b=iRYKi8mVzyt8WgUcvv/E3bwxbcUNJZbwKK86BhW4cw319B7jUTGmW+Rd/DKtfEaKjKDyKKvLXGw8hshrV/HUSB7IrkynNGG16Mjv0n7OCb0nKjejPRJrf4GewmcIOO2l7J3d4owLAk9TLDyo9kY+AFlj5wcOSy5m1SumlQoOKa8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jay.Cornwall@amd.com; 
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
Cc: "Cornwall, Jay" <Jay.Cornwall@amd.com>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q29weS9wYXN0ZSBlcnJvciwgZmlyc3QgNCBWR1BScyBhcmUgc2VwYXJhdGVkIGJ5IDY0IGR3b3Jk
cyAoMjU2IGJ5dGVzKS4KCkNjOiBTaGFveXVuIExpdSA8c2hhb3l1bi5saXVAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogSmF5IENvcm53YWxsIDxqYXkuY29ybndhbGxAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlci5oICAgICAgICAgfCA2ICsr
Ky0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQvY3dzcl90cmFwX2hhbmRsZXJfZ2Z4MTAu
YXNtIHwgNiArKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJh
cF9oYW5kbGVyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxl
ci5oCmluZGV4IDJiM2Q3MDEuLmMxMGU0MjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQvY3dzcl90cmFwX2hhbmRsZXIuaApAQCAtOTgyLDkgKzk4Miw5IEBAIHN0YXRpYyBjb25z
dCB1aW50MzJfdCBjd3NyX3RyYXBfZ2Z4MTBfaGV4W10gPSB7CiAJMHgwMDAwMDA4MCwgMHhiZjBh
NmY3YywKIAkweGJmODVmZmY3LCAweGJlZmYwM2MxLAogCTB4ZTAzMDQwMDAsIDB4NzI1ZDAwMDAs
Ci0JMHhlMDMwNDA4MCwgMHg3MjVkMDEwMCwKLQkweGUwMzA0MTAwLCAweDcyNWQwMjAwLAotCTB4
ZTAzMDQxODAsIDB4NzI1ZDAzMDAsCisJMHhlMDMwNDEwMCwgMHg3MjVkMDEwMCwKKwkweGUwMzA0
MjAwLCAweDcyNWQwMjAwLAorCTB4ZTAzMDQzMDAsIDB4NzI1ZDAzMDAsCiAJMHhiOTc4MmEwNSwg
MHg4MDc4ODE3OCwKIAkweDkwN2M5OTczLCAweDg3N2M4MTdjLAogCTB4YmYwNjgxN2MsIDB4YmY4
NTAwMDIsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBf
aGFuZGxlcl9nZngxMC5hc20gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBf
aGFuZGxlcl9nZngxMC5hc20KaW5kZXggMjYxZTA1NC4uYmU2ZjdkMSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQvY3dzcl90cmFwX2hhbmRsZXJfZ2Z4MTAuYXNtCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyX2dmeDEwLmFzbQpA
QCAtNzQ3LDkgKzc0Nyw5IEBAIExfUkVTVE9SRV9TSEFSRURfVkdQUl9XQVZFNjRfTE9PUDoKIAkv
KiBWR1BSIHJlc3RvcmUgb24gdjAgKi8KIExfUkVTVE9SRV9WMDoKIAlidWZmZXJfbG9hZF9kd29y
ZAl2MCwgdjAsIHNfcmVzdG9yZV9idWZfcnNyYzAsIHNfcmVzdG9yZV9tZW1fb2Zmc2V0X3NhdmUg
c2xjOjEgZ2xjOjEKLQlidWZmZXJfbG9hZF9kd29yZAl2MSwgdjAsIHNfcmVzdG9yZV9idWZfcnNy
YzAsIHNfcmVzdG9yZV9tZW1fb2Zmc2V0X3NhdmUgc2xjOjEgZ2xjOjEgb2Zmc2V0OjEyOAotCWJ1
ZmZlcl9sb2FkX2R3b3JkCXYyLCB2MCwgc19yZXN0b3JlX2J1Zl9yc3JjMCwgc19yZXN0b3JlX21l
bV9vZmZzZXRfc2F2ZSBzbGM6MSBnbGM6MSBvZmZzZXQ6MTI4KjIKLQlidWZmZXJfbG9hZF9kd29y
ZAl2MywgdjAsIHNfcmVzdG9yZV9idWZfcnNyYzAsIHNfcmVzdG9yZV9tZW1fb2Zmc2V0X3NhdmUg
c2xjOjEgZ2xjOjEgb2Zmc2V0OjEyOCozCisJYnVmZmVyX2xvYWRfZHdvcmQJdjEsIHYwLCBzX3Jl
c3RvcmVfYnVmX3JzcmMwLCBzX3Jlc3RvcmVfbWVtX29mZnNldF9zYXZlIHNsYzoxIGdsYzoxIG9m
ZnNldDoyNTYKKwlidWZmZXJfbG9hZF9kd29yZAl2MiwgdjAsIHNfcmVzdG9yZV9idWZfcnNyYzAs
IHNfcmVzdG9yZV9tZW1fb2Zmc2V0X3NhdmUgc2xjOjEgZ2xjOjEgb2Zmc2V0OjI1NioyCisJYnVm
ZmVyX2xvYWRfZHdvcmQJdjMsIHYwLCBzX3Jlc3RvcmVfYnVmX3JzcmMwLCBzX3Jlc3RvcmVfbWVt
X29mZnNldF9zYXZlIHNsYzoxIGdsYzoxIG9mZnNldDoyNTYqMwogCiAJLyogcmVzdG9yZSBTR1BS
cyAqLwogCS8vd2lsbCBiZSAyKzgrMTYqNgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
