Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12974AFA46
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 12:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B103E6EA72;
	Wed, 11 Sep 2019 10:25:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B505F6EA72
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 10:25:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2adRZImFY4sTkOgGi4geXurc3y7oALhk0bq5L27Z5LX2OBcgfT6BBnFix6HzPVUwzFT/Uz0SlbrJZRbXkOIE7wUX9h4gh8UYs+AVrpP02jyuy/xKpgSTaZxq3YqTsfZ6drqy5NwHYCLtmCzPh2YrdC96Rvxmtim0IXIcfqn9gj2LV1GInM6jlam+TNDgELy2UJ5JoohB7XDNUfv1TnUtIr5KWkL3dRdgUyq/WLgZom/tsUg4rz3I++4JPu1m6clezZJ/VOKDfLDxwZOZctW+up5msoPA2JnCrX/j/1o8+nMLrsjkjOPFxhi2H5j2rymMGmEFqb5U7i43hysuIZSuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7K8Kzzp0K5VIW2N2A2LsMz4Q/fM6v/s6h1eKpFnOw8=;
 b=HohkFbPW0frvgo43GTJaVWkDIWyVd14skxAUHhcfstgyRjL8HejjMBvBFr1HyYmvqPd+tqpZipg51rKNrbUcZfz3cELCIbkGlBaE1T5EL+D86BhIPwH36zDwANpPLjqEBZ2N9dQ7NMSZ6pVXz5QBL4HUTpiKmbODch0rVRvGJ6sOywW/W8fLZKJ3BFDCSc+xghxtFBocL/F3vVegCjGXzvGy0a/0LarP7SygKUMhjwBn4d/6WwpBf2hpdVScX61U5Y5f3BoUwEzOvkw88efYtWpZTsMnDwG/fceXQISlMgZijUYtf9L1Y8Oh0QbJV8uzrvb2O6vWC+zWiVEv+87dNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3056.namprd12.prod.outlook.com (20.178.242.143) by
 MN2PR12MB3805.namprd12.prod.outlook.com (10.255.237.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 10:25:29 +0000
Received: from MN2PR12MB3056.namprd12.prod.outlook.com
 ([fe80::10e6:34bc:237d:3bd5]) by MN2PR12MB3056.namprd12.prod.outlook.com
 ([fe80::10e6:34bc:237d:3bd5%4]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 10:25:29 +0000
From: <jianzh@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: For Navi12 SRIOV VF, register mailbox functions
Thread-Topic: [PATCH] drm/amdgpu: For Navi12 SRIOV VF, register mailbox
 functions
Thread-Index: AQHVaIs71/Jv2lsjmkqBRP7gzXFheQ==
Date: Wed, 11 Sep 2019 10:25:29 +0000
Message-ID: <20190911102505.5480-1-jianzh@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::18) To MN2PR12MB3056.namprd12.prod.outlook.com
 (2603:10b6:208:ca::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59555904-5375-4796-7ee2-08d736a25e24
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3805; 
x-ms-traffictypediagnostic: MN2PR12MB3805:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB38058701B8F7447ACBB6672BE1B10@MN2PR12MB3805.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(199004)(189003)(305945005)(7736002)(66946007)(6916009)(99286004)(52116002)(14454004)(36756003)(2616005)(6506007)(386003)(5640700003)(102836004)(186003)(26005)(6512007)(53936002)(25786009)(478600001)(4326008)(50226002)(6116002)(3846002)(81166006)(8936002)(2906002)(66476007)(66556008)(64756008)(15650500001)(81156014)(8676002)(6486002)(6436002)(2501003)(66066001)(66446008)(54906003)(2351001)(71200400001)(71190400001)(316002)(1076003)(256004)(476003)(14444005)(486006)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3805;
 H:MN2PR12MB3056.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QSmdoaKN0su3lPAO1B//Wrx8S5e1ICeh+a9+c8kq8JGgosC0iX6PlgyiSLW7pnhezNUZ1C8tOlmtw8s/4kQxEnib35Qdbf9S719sV+2aXv93Y/Xn9i7Ir7GNZeildR7x0dlm5G/VhSFA3tIX4Nxfc4U4xr0ZKV3hp1lRGK5XWxPqi4MWidK3ShS4/YIrnQO6LiYma5RXf+uduy+FZPC5Ex8dpa3J/ozDOHUnW/MOgGDadBKQ+B+1M3srba174PhhGcPEhDe8blGFwWWEvo7aXHqq1eb51nynQm3OhRoos9xIqEzz+MFWTWs49jWEHfcK3dbzuCOeLP/knaV9GsEK3Robm1ONkFF7vzBjAzANU5Jy+MR1UbScX6C+6+hJ2YpnjrJ3/PFSDJ+d5jPPU5BcP6N+y0o8EC0ARgGugZtDTLE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59555904-5375-4796-7ee2-08d736a25e24
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 10:25:29.1034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u2OdFSqlHvjgok6NVb3CRJLNJCtEKO85Oq5djXTKnbGTzI2QGC7cUoMPN/Zbqxrk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3805
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7K8Kzzp0K5VIW2N2A2LsMz4Q/fM6v/s6h1eKpFnOw8=;
 b=J9JClXD0XCtWoJw98L0A5hZU/tBW1lhVbyW/1oB4Y1xJe8O2ZewssX72DFvpgkRzLchXVQUHSGutjbgjcljMRbm5x8SxAG+OBuwhSVcm9DYM9F1Q3nJdaOe1ztOV0TZKtuI1Zs4IRRBRUfpNwOMce1X0xb8P8jSW3twkdZBAh0o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jiange.Zhao@amd.com; 
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>, "Zhao,
 Jiange" <Jiange.Zhao@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Nieto, David M" <David.Nieto@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmlhbmdlIFpoYW8gPEppYW5nZS5aaGFvQGFtZC5jb20+CgpNYWlsYm94IGZ1bmN0aW9u
cyBhbmQgaW50ZXJydXB0cyBhcmUgb25seSBmb3IgTmF2aTEyIFZGLgoKUmVnaXN0ZXIgZnVuY3Rp
b25zIGFuZCBpcnFzIGR1cmluZyBpbml0aWFsaXphdGlvbi4KClNpZ25lZC1vZmYtYnk6IEppYW5n
ZSBaaGFvIDxKaWFuZ2UuWmhhb0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L252LmMgfCAxOSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCmluZGV4IGE2MWY0M2MwYzlkZi4uNGMy
NDY3MmJlMTJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTUzLDYgKzUzLDcgQEAKICNp
bmNsdWRlICJ2Y25fdjJfMC5oIgogI2luY2x1ZGUgImRjZV92aXJ0dWFsLmgiCiAjaW5jbHVkZSAi
bWVzX3YxMF8xLmgiCisjaW5jbHVkZSAibXhncHVfbnYuaCIKIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBhbWRfaXBfZnVuY3MgbnZfY29tbW9uX2lwX2Z1bmNzOwogCkBAIC00MjYsNiArNDI3LDkgQEAg
aW50IG52X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAlhZGV2
LT5uYmlvLmZ1bmNzLT5kZXRlY3RfaHdfdmlydChhZGV2KTsKIAorCWlmIChhbWRncHVfc3Jpb3Zf
dmYoYWRldikpCisJCWFkZXYtPnZpcnQub3BzID0gJnhncHVfbnZfdmlydF9vcHM7CisKIAlzd2l0
Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJY2FzZSBDSElQX05B
VkkxNDoKQEAgLTY2NiwxNiArNjcwLDMxIEBAIHN0YXRpYyBpbnQgbnZfY29tbW9uX2Vhcmx5X2lu
aXQodm9pZCAqaGFuZGxlKQogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKKwlpZiAoYW1kZ3B1X3Ny
aW92X3ZmKGFkZXYpKSB7CisJCWFtZGdwdV92aXJ0X2luaXRfc2V0dGluZyhhZGV2KTsKKwkJeGdw
dV9udl9tYWlsYm94X3NldF9pcnFfZnVuY3MoYWRldik7CisJfQorCiAJcmV0dXJuIDA7CiB9CiAK
IHN0YXRpYyBpbnQgbnZfY29tbW9uX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiB7CisJc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CisK
KwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQorCQl4Z3B1X252X21haWxib3hfZ2V0X2lycShh
ZGV2KTsKKwogCXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IG52X2NvbW1vbl9zd19pbml0KHZv
aWQgKmhhbmRsZSkKIHsKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqKWhhbmRsZTsKKworCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCisJCXhn
cHVfbnZfbWFpbGJveF9hZGRfaXJxX2lkKGFkZXYpOworCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
