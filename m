Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592DBD14FE
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 19:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9786F6EA1E;
	Wed,  9 Oct 2019 17:09:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720086.outbound.protection.outlook.com [40.107.72.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35A789FAD
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 17:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7ObeRTjYA+DxRnqc5MPbkTIqFDMADgjvhGYrs5ps8uKZIr0ewhQJXVp4Zjsyy57/eeclLU0e1LSoSvJ64HMyzbKMBEeK6+exQJ5IyTVWZUFdAyoVVvdsT5UC1ih978HUpYAp3J0Oh2XOKRUAesoUgbEUjoh7TX+X8tqdaYaRvzIFMGKUGGik0ZUbkSv/ObNflb+/APmdVw/y2WvMsOb2H2Tejiqq0L78RTf4My8a6ve7xeg133ZEB5KUedTWJIVOPCfJhprANz+jlJPpU/0fPIk1d6QBBMQ3S8SEKPd/PrwHw7LkWPwp6bB6pOUl929s3dwfsbgnVuj6FIz+aVg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBbYWxBcdzfh96EwwFjvewIzopBO8SEICCvCAor/kqg=;
 b=HdqtWg7MPADkb8hvbWqMGF78FvdQLSaqa0CDiLE0Lcpgx6pVt/ZxZYooClBLgP5MQJ7fz5qgiUMpKsMTWPFUE+kROUvnjKaUHDSx+ocH38pF/qJzF9glPPBQMo9eptKC19ZPmLRzu9wX9pjDq+tYPwOP6QRVY0SE0aetzeP8InFb5jtEGX8EzYfh9kbOcA8pVuqNRCjV8cZ2pWvjieFq3TRipWmbuvHK/ldyMeoD2JX9qQaiOOQ39JW506m+hW5+fKWEm9bNPblu7lRjEyhTEoiuQoWNvBAhABz2MYUj2F5El1Tq2bLLbZMNl71xNgUJu15DwNqyNQN3JJnsbOKQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3394.namprd12.prod.outlook.com (20.178.212.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 17:09:48 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c%7]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 17:09:48 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/sdma5: fix mask value of POLL_REGMEM packet for
 pipe sync
Thread-Topic: [PATCH] drm/amdgpu/sdma5: fix mask value of POLL_REGMEM packet
 for pipe sync
Thread-Index: AQHVfsRas4mauYmmH0ePetGizjISXw==
Date: Wed, 9 Oct 2019 17:09:48 +0000
Message-ID: <20191009170923.15479-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0188.apcprd02.prod.outlook.com
 (2603:1096:201:21::24) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e284e4a-7be4-4986-b617-08d74cdb7d33
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3394:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3394347E9ECE49CC679DD89F89950@BN8PR12MB3394.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:428;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(189003)(199004)(6506007)(6116002)(102836004)(2906002)(186003)(3846002)(386003)(81166006)(99286004)(81156014)(6486002)(66066001)(8676002)(52116002)(5640700003)(6916009)(36756003)(6436002)(26005)(486006)(476003)(2616005)(1076003)(6512007)(54906003)(478600001)(50226002)(71190400001)(71200400001)(5660300002)(8936002)(14454004)(2501003)(4326008)(25786009)(305945005)(7736002)(64756008)(256004)(66446008)(316002)(66476007)(66946007)(2351001)(14444005)(86362001)(4744005)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3394;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WACChbl7dZBqh4o5meGycBclRmoCP3S12ec6Bg0R2e1TO5goDVgLMIW09k8eXVmBjnbqfdiEN2kpyoDuuYjNsTinJeIbzVhbUQvR/854asiqO5U7HrG+7n49OMjvpqYrJV3L+PJW1lrhlwiiKyqNJpidJWALi2RivvsivRYzF6KrjErMIYlouNv8UCRdWyx731F1lSnCkF8htJiUuKyvPGA61KX6j68U5/+IqK7sTERAbV8Pj3Bl15aH5YP6b+NX6LU+5fupATrK3YEb7S/GuS1hqg2IGj7WBiv3eabAcQgbuzRjHNHECOdIwA8zc5JwglTm2/Csr2hhd9XL3SuEDx5O+uGSztLeIUpv99cB11l4CWoSjXjdzYlwyqjKWEwcEOV8H7sxCxRSE6gzde6DH79P5vcfZAIOZ01XDKC7kio=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e284e4a-7be4-4986-b617-08d74cdb7d33
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 17:09:48.1992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qBKDNx+8KS4qH/XO6rwjBFaFIsBYEt7732vqYhZmSQZpKVm42vZrUhq0Oztk5shH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3394
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBbYWxBcdzfh96EwwFjvewIzopBO8SEICCvCAor/kqg=;
 b=S29KmDULIf1HagiAXK9g2olnnHN3NeE9Y6Abil0we/IF4PC7s4RBYVWVSpR3LpY3cWWHEY8mlqjsvGGJjr4I3+hgQmuO1y9Qf31ykuEOmbEfFFZlCV8v1P62eUHR1K96oNt3eCc66zOnW538pJXyIc1SDbwTFmrehrXHO9QLWWI=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c2RtYSB3aWxsIGhhbmcgb25jZSBzZXF1ZW5jZSBudW1iZXIgdG8gYmUgcG9sbGVkIHJlYWNoZXMg
MHgxMDAwXzAwMDAKClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jCmluZGV4IGFkNWMzNTY2MzM3Yy4uMzQ2MGMwMGYz
ZWFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwpAQCAtMTEyNiw3ICsx
MTI2LDcgQEAgc3RhdGljIHZvaWQgc2RtYV92NV8wX3JpbmdfZW1pdF9waXBlbGluZV9zeW5jKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBhZGRyICYg
MHhmZmZmZmZmYyk7CiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgdXBwZXJfMzJfYml0cyhhZGRy
KSAmIDB4ZmZmZmZmZmYpOwogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIHNlcSk7IC8qIHJlZmVy
ZW5jZSAqLwotCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDB4ZmZmZmZmZik7IC8qIG1hc2sgKi8K
KwlhbWRncHVfcmluZ193cml0ZShyaW5nLCAweGZmZmZmZmZmKTsgLyogbWFzayAqLwogCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIFNETUFfUEtUX1BPTExfUkVHTUVNX0RXNV9SRVRSWV9DT1VOVCgw
eGZmZikgfAogCQkJICBTRE1BX1BLVF9QT0xMX1JFR01FTV9EVzVfSU5URVJWQUwoNCkpOyAvKiBy
ZXRyeSBjb3VudCwgcG9sbCBpbnRlcnZhbCAqLwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
