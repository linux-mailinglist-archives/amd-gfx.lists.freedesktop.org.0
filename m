Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF17C70F23
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 04:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9C389D61;
	Tue, 23 Jul 2019 02:28:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800050.outbound.protection.outlook.com [40.107.80.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3313489D61
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 02:28:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nO0BcendueKGuNtymUbvTLM+NmGBl+TjvBsQnLgyNQPeX8nsxepx/mVtIJ3I27H0eisYAd2N7QjrcJN2/Dn3W/2AmIpLpLb1wEOmLV3O3np+jylK54iqR44F8JIIvqCZyfEbkv+HhkaQHPHf/p9VUl3MIzUFO4AiGafV3gY3bOe69zPIZ3XRWGY2AU5el1R4vxD2KtETKOtDM/+3b36Av53pFZ2u0AGkaUCqgS/XLFdEq4Qdc2Gx7e6mx/uMHdvZXNnQZ3iJ8QqsZxFxrBiaEUJr0HB75DnN93xSEMB7ai2YQdCeQrhalraoGpQaYYjVzf87zl5HDv63bKiAQDX+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDVtZbUbvHDAy7W2DEgTFcSWwpRRRyekDVP/csbA3yw=;
 b=UVCo5Rt7NXr1tp1IGZ3tPyvaGLYiMN6xCke9+H1r5p/dnFOdndf/ZKemFHGnbDfpEle+AlDm6QZpLzl3BDYyHQErtLOeIIAjNtHTDT+BSdHvcBXNU/8bswlLSJaW1RZIlBJqtywGNkBBYOtaKliBsOTH81OLthY69w4hSK2pPNcpfkgSU7faBt9bojm1gGRbfLLoIz6DctFPd7Dqr2VJ9AXDcAFmXspD69GG5VXOraC/Ob4DSU1Hlru+0ePWpr3Wfq80EGVLAVsWUs2KR7tottKLP88cl8JaUeY7B7vzYL/7B7x79PMPAUpXKkd3C1Egb09IVNu3BEV+c3SVJQ43Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3895.namprd12.prod.outlook.com (52.132.245.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 02:28:24 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::e4cc:7652:364c:d471]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::e4cc:7652:364c:d471%3]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 02:28:24 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Cui, Flora" <Flora.Cui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH libdrm] tests/amdgpu: disable reset test for now
Thread-Topic: [PATCH libdrm] tests/amdgpu: disable reset test for now
Thread-Index: AQHVQPqvpDscuraMakmKsVwn7HrqdKbXepBA
Date: Tue, 23 Jul 2019 02:28:24 +0000
Message-ID: <CH2PR12MB3767980971376888614F6F5CFEC70@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <1563847335-29017-1-git-send-email-flora.cui@amd.com>
In-Reply-To: <1563847335-29017-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d5b17cb-6f51-41ff-9bce-08d70f15700b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3895; 
x-ms-traffictypediagnostic: CH2PR12MB3895:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR12MB3895A6DE8885D9255B93B0C7FEC70@CH2PR12MB3895.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:118;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(189003)(199004)(13464003)(53546011)(71200400001)(66066001)(110136005)(316002)(5660300002)(8936002)(71190400001)(9686003)(6436002)(66446008)(6306002)(55016002)(8676002)(33656002)(64756008)(68736007)(4326008)(99286004)(305945005)(52536014)(7736002)(74316002)(76116006)(66556008)(66476007)(66946007)(2906002)(3846002)(256004)(446003)(76176011)(14444005)(86362001)(2501003)(6246003)(186003)(476003)(25786009)(26005)(229853002)(81156014)(102836004)(81166006)(14454004)(966005)(6116002)(6506007)(53936002)(7696005)(486006)(478600001)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3895;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yK51ift2R0bpbce736D4FtYbC8gIvKCYZRU+qWEgCHILqF05cpr/LLjM1LlqphuVXTexvgJ6jYwfM7VDmxAw0UC4sxpcRFeJNZ9cQ4u3aaPIrGyj8FkUYHzFjMsqSZts8t9itNhDSp4i17BTsc89wT/g1VmZkkkhZTlt66yakyorjNT4n4bfB2V0YZsr33LvyyW8S4CBR1HnEyfAq8yPWGN5v0fZLw+PHh13yOSBHDEt25/iFh0QIPU8DJqaPowchG1YZxKxJZNYkPSsjedciYGBCVn0QumedMthj7hYgdUSVkO4yyGLhXnUyi4Wh2PAcJ5O4g8/wR65itU+HDZhRHHAhKTVaqEdjFdWkMtEUhJEqYRTVUYWk2i01jWU+fdfPRmlBo7fypLgC7EcJfOZsSEloFK4UAWGjPIgCm0IGjA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5b17cb-6f51-41ff-9bce-08d70f15700b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 02:28:24.2754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3895
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDVtZbUbvHDAy7W2DEgTFcSWwpRRRyekDVP/csbA3yw=;
 b=xqnOpjCRecs/9eZK86UW+SQGyuyMC+Vy4wqkwBbCIkYp4/O0dklUfAoyHHr150R7QT0Us4tE2XUBfquHMtenOJctfQ9YIEDRmSLClFv09kQCIIEvYcpyslCi37o2I9CvGVdIByu6nP9rMk3hvJXwfieJpmJhXWLL9iZAKRcc4+4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNClJldmlld2VkLWJ5OiBGZWlmZWkgWHUgPEZlaWZlaS5YdUBhbWQuY29tPg0KDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ3VpLCBGbG9yYQ0KU2VudDogVHVlc2Rh
eSwgSnVseSAyMywgMjAxOSAxMDowMyBBTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQpDYzogQ3VpLCBGbG9yYSA8RmxvcmEuQ3VpQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0gg
bGliZHJtXSB0ZXN0cy9hbWRncHU6IGRpc2FibGUgcmVzZXQgdGVzdCBmb3Igbm93DQoNCkFTSUMg
aGFuZyByYW5kb21seS4NCg0KU2lnbmVkLW9mZi1ieTogRmxvcmEgQ3VpIDxmbG9yYS5jdWlAYW1k
LmNvbT4NCi0tLQ0KIHRlc3RzL2FtZGdwdS9hbWRncHVfdGVzdC5jIHwgMiArLQ0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvdGVz
dHMvYW1kZ3B1L2FtZGdwdV90ZXN0LmMgYi90ZXN0cy9hbWRncHUvYW1kZ3B1X3Rlc3QuYyBpbmRl
eCA2ZjFlMzcyLi5hNGNlOGNlIDEwMDY0NA0KLS0tIGEvdGVzdHMvYW1kZ3B1L2FtZGdwdV90ZXN0
LmMNCisrKyBiL3Rlc3RzL2FtZGdwdS9hbWRncHVfdGVzdC5jDQpAQCAtNDgyLDcgKzQ4Miw3IEBA
IHN0YXRpYyB2b2lkIGFtZGdwdV9kaXNhYmxlX3N1aXRlcygpDQogCQkJZnByaW50ZihzdGRlcnIs
ICJ0ZXN0IGRlYWN0aXZhdGlvbiBmYWlsZWQgLSAlc1xuIiwgQ1VfZ2V0X2Vycm9yX21zZygpKTsN
CiANCiAJLyogVGhpcyB0ZXN0IHdhcyByYW4gb24gR0ZYOSBvbmx5ICovDQotCWlmIChmYW1pbHlf
aWQgPCBBTURHUFVfRkFNSUxZX0FJIHx8IGZhbWlseV9pZCA+IEFNREdQVV9GQU1JTFlfUlYpDQor
CS8vaWYgKGZhbWlseV9pZCA8IEFNREdQVV9GQU1JTFlfQUkgfHwgZmFtaWx5X2lkID4gQU1ER1BV
X0ZBTUlMWV9SVikNCiAJCWlmIChhbWRncHVfc2V0X3Rlc3RfYWN0aXZlKEJBU0lDX1RFU1RTX1NU
UiwgIkdQVSByZXNldCBUZXN0IiwgQ1VfRkFMU0UpKQ0KIAkJCWZwcmludGYoc3RkZXJyLCAidGVz
dCBkZWFjdGl2YXRpb24gZmFpbGVkIC0gJXNcbiIsIENVX2dldF9lcnJvcl9tc2coKSk7ICB9DQot
LQ0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
