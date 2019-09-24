Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663D5BC091
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 05:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD266E9E6;
	Tue, 24 Sep 2019 03:00:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790077.outbound.protection.outlook.com [40.107.79.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1528D6E9E6
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 03:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLs3NFDjeTOpqQxoOA65XFbokj/7Xu8z+EBxc56laSXquuYjmz+V87D0WkqsObzhqXgh+FKBuoQ/FNBN4HpxHgJ6sY8aP23ElnY79rXGIe7KEW+pM9c9UnpspOkC8Nj7I/A2q/5Zl1cAcuK8j/8NylLNogmtjD3aIkC7x8lXNt9JqZsVlTekRPAj7w4vlmAdL5KSicdlCsKR891xEsmellPkdwVe7Scuvk+NG6h8f5iicdUBfwbLyuwn+gYnP5CCwOS7g8Qb9UeJJ6nfSrfgWm4aOVY99fCkkyr/X7+ztWu/XzSqx9rN464UmmClfT/tTve5yuxPrDRCulVcL15bCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSOh9hmhVugdyyyVmzYYyt1R89sXRD+8hs8QiezARig=;
 b=Xtx5oEml8ue3MaWWmBYFkRYR9yUhWXIuBedFqiz4PyB0fQ3gehzYIYRRy6OuGgSUFq2k0Dv/o6M0fMFDT6dj13o8/2CnBAlfNmARdm7uP2UcEhVHtUuxUFN7Gc1Bby6MvISJp6bXKF/s6JC1qkXFpubNj72/wbi5sjHcF4SYEL82I9UwMAruVqiY+3AuCPCxHElWOro/4h/5HvbFL3RkKkwrITcdUweu74pUtmvZb2Re3LJ+qDagJSPByg4xkznrIZLZLmUTmkEYFz3DU4jwCC4kHXH4qNn9wSCin9Tx+Y7S+ug+nj0HU+FvsdKg+O6Z9cmrvumDfdWOm4FfPRb3rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3489.namprd12.prod.outlook.com (20.178.211.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Tue, 24 Sep 2019 03:00:57 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 03:00:57 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi12
Thread-Topic: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi12
Thread-Index: AQHVcoRJ/hPL7jNvCkCPVhA00il2HA==
Date: Tue, 24 Sep 2019 03:00:56 +0000
Message-ID: <20190924030042.5545-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR0401CA0022.apcprd04.prod.outlook.com
 (2603:1096:202:2::32) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9de8a0d2-28cd-4f99-9b62-08d7409b6b84
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB3489; 
x-ms-traffictypediagnostic: BN8PR12MB3489:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB348979BDF12ACA6E1C0B9ED089840@BN8PR12MB3489.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(199004)(189003)(66946007)(8936002)(99286004)(66476007)(1076003)(36756003)(25786009)(316002)(8676002)(81156014)(2501003)(6486002)(2906002)(4326008)(5660300002)(6916009)(54906003)(81166006)(50226002)(6512007)(256004)(14444005)(305945005)(4744005)(7736002)(86362001)(5640700003)(6436002)(3846002)(64756008)(2616005)(186003)(476003)(66066001)(2351001)(486006)(66556008)(478600001)(71190400001)(386003)(14454004)(6506007)(6116002)(66446008)(71200400001)(52116002)(26005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3489;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xWUDiZ4oe22yMoXH9Ip+ZBrtVNiTgc4QrEnxwzqJh5do2mWCWqTTbm2UcnjP+xgxHUrzcYa1sqfOdkgDIhva/aZUNX7hIR4ctu1N/ZGTcBsjEscFbxsZprGSCpl2v7w/WU2YAj5eC2JuZQL81pkEcN/QJiQDStfH5FWIrmASweNJcLXz4oLteCxIoYAEkJy9eTrjCUpdug4+2Zl6EzUAEju7j7z4+4XabdC6HGExtU0Uczqjnll4Uxesdbp+tGCYMoEGmsfcchG4HwbyUnoIIUrccZbG2vk4Jo4IQT8OW7jgMvAqqYk5EuX0OyCbFWBaoV98piNXMPZmW/2H7QtozcdtKhCFpXA/VlprR8bF7ot9bp6RZzKaFPSHXEkNomA39qK+KCWnKICuwGCQ2itcGL/nBJ+rD4J1G3AxE9GGwck=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de8a0d2-28cd-4f99-9b62-08d7409b6b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 03:00:57.0781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QmYA3TTKHYp03yCgj9bcibyVag0PCvm0arAtFVTxAdbSF4n3jfLaPAvDJ//Xy5Wq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3489
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSOh9hmhVugdyyyVmzYYyt1R89sXRD+8hs8QiezARig=;
 b=3orsWOcMQTeyrHdymmm6xPDT8a+JzEtGUgMfVfQlD77+wAqdAo3U3ZuaKmZ4EfMb9GOignsAYZ0BC4gbg91Lpa+7Ky7fujJfLAK7lpGpQIBeRsrBjNDwK19IW0O2LYB8EP+h8P/c0JPrzPR0dHbo10ZBX1AHrsG1yEj2d2cSaos=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

d2hlbiBnZnhvZmYgaXMgZW5hYmxlZCwgc2RtYSBoYW5ncyB3aGlsZSBlbnRlcmluZyBkZXNrdG9w
IHdpdGhvdXQgdGhpcwp3b3JrYXJvdW5kCgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhp
YW9qaWUueXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
MTBfMC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYwppbmRleCBlZDFjM2I4ODNm
NmEuLjAzMDRjYThmZTcyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMK
QEAgLTI5MSw3ICsyOTEsNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjEwXzBfZmx1c2hfZ3B1X3RsYihz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwKIAogCWlmICghYWRldi0+
bW1hbi5idWZmZXJfZnVuY3NfZW5hYmxlZCB8fAogCSAgICAhYWRldi0+aWJfcG9vbF9yZWFkeSB8
fAotCSAgICBhZGV2LT5hc2ljX3R5cGUgPiBDSElQX05BVkkxNCB8fAorCSAgICBhZGV2LT5hc2lj
X3R5cGUgPiBDSElQX05BVkkxMiB8fAogCSAgICBhZGV2LT5pbl9ncHVfcmVzZXQpIHsKIAkJZ21j
X3YxMF8wX2ZsdXNoX3ZtX2h1YihhZGV2LCB2bWlkLCBBTURHUFVfR0ZYSFVCXzAsIDApOwogCQlt
dXRleF91bmxvY2soJmFkZXYtPm1tYW4uZ3R0X3dpbmRvd19sb2NrKTsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
