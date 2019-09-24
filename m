Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C483BD511
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 00:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3CD6EB04;
	Tue, 24 Sep 2019 22:46:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810083.outbound.protection.outlook.com [40.107.81.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC296EB04
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 22:46:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRH+cIo0fHK3M+iedHGBmpOX5cSwiXJAvo5Nxo786R9hiZG1b/Dp/tYeSG/dbawyoVse/dIAJ04AGExWqlbc41RT1NlTXdKyz8VLcuCWlgHRTCf6w6E4fij5LJdc9shYwMMQrT/+YBIHxBEHsqZ6lXwIz4ughDiEY6DoEKblRAFXqS3lB4arHcK6EpMODWPMmS7m1nUcrR3axxy1PmE+rQ2/6H6avPlpIOQXbHvCUtCruj+0aN7z3zP4IrtN6oh7WVF7dOJZJQ7yEwZpKU0Zn74oSfDJU9Z4sGbBBolGMlVCMspPW7+cwD2fN3TxgI5zP7Lp4uXeG7AsJ0U7j5sNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCZZygZ8xSX8fjZzqY2Kr2eGbLjPPzWgwugrd8x4WUw=;
 b=CYbCiGsoF7vlC4lF3vpADE3zHmtjklqOk5XPjRVZJB0hdkDw+lmzQk9yLbUS5koKlTgu6pji5/+L1vnuw3M993hGlBNc/RG35LiUJD9YY9ewJ7i6oP7L+VHBuZTIhIifESKox+rDdW1vXTPDWrzyFmZcKg5qTTKXuGjmli+ePUx873XIlm3nRNfw322CyZg3tOj930JM+GTBC2eX3T8Vu8iWqktatIfkmdhYdkXqenvQ0XvT1k3e5M7S2us4E6qYMWoQpg5cVJVlJXi4zr/sFHS6QMwRT43G6tkBk9TVX/iCIVYPU4jMcswdKwnGINfRCiDoMou5Z+jn4I7TMe74mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB4057.namprd12.prod.outlook.com (10.141.184.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Tue, 24 Sep 2019 22:46:10 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 22:46:10 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Add NAVI12 support from kfd side
Thread-Topic: [PATCH] drm/amdkfd: Add NAVI12 support from kfd side
Thread-Index: AQHVcyncTfCp3Uk1CEyDkKBuxMP9FQ==
Date: Tue, 24 Sep 2019 22:46:10 +0000
Message-ID: <1569365164-19955-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::19) To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b4ff8e8-eb4b-4d8e-d428-08d74140fea9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB4057; 
x-ms-traffictypediagnostic: DM6PR12MB4057:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB40578B05EDF7231CEDD3C163F4840@DM6PR12MB4057.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(189003)(199004)(6916009)(66946007)(64756008)(66556008)(66446008)(66476007)(3846002)(6116002)(186003)(2351001)(66066001)(26005)(4326008)(6512007)(99286004)(36756003)(386003)(6506007)(14454004)(52116002)(5640700003)(2906002)(102836004)(6436002)(6486002)(478600001)(50226002)(316002)(5660300002)(305945005)(25786009)(7736002)(8676002)(256004)(2616005)(476003)(8936002)(486006)(81156014)(81166006)(86362001)(71200400001)(71190400001)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4057;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l2O2j+93trMYAVl5Olo0FpP8uMHyirzbP8u628kBQvbO9sPQoxSvrW5YCUIcJabhbuvAMB56Etvv8Ndu2uKsez2rEPDNsBLztsBk8eDvddxzB8asEKMYt92deUB9iveOoXUaUOd3oiOCZSEkBaVXvzjWU26L0EubqMhIeKwc1npAefpUZ9a0AwTKyV0PMHUAfWZ7RxUvyjqOyCDdY8kBViEJeElPtvAXElhIZ6l4VghQiAMHZn/HwBd7VEUA+dGvjW+2uHhvKQKKK4nosWwXdwVSB8raZ0mZr2tkTSyzsQ0MWc3yHQq/0AWoZ9meJlUp+x8DS8tmktLWkHOyAik63ONt30xYKbpYTJ+NMpZ2DUdPgKdm+Uz/vrPdvg3xjO/frvG9eicqYFo/gUihUBPtLyEfir8cj9euxzN+EZJmEAo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4ff8e8-eb4b-4d8e-d428-08d74140fea9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 22:46:10.3968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0mHT2NHBYy9ldPWKYj2qXfzE4q0FZ4QAtJC7TE5MscqM10rRpD6UJHxVxvs4lqWgeGRTYqnoo39H/YanQVkddQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4057
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCZZygZ8xSX8fjZzqY2Kr2eGbLjPPzWgwugrd8x4WUw=;
 b=HJC8v89iGjXxLYthnadYvUe+ApaVLXHIgOUdT4ebJJnApFiLUuVJ5zbf2CFdAVYyvnXOTHauvxehyCR9mdZ73oVfGRYaA8IVDDOirlxusQVm2beCycXY06Ef2tqn5sosWT5Xv8QpxIES8LT2LN3pC08y2i0VJsAct/a7G+NdQZE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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
Cc: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGRldmljZSBpbmZvIGZvciBib3RoIG5hdmkxMiBQRiBhbmQgVkYKCkNoYW5nZS1JZDogSWZi
NDAzNWU2NWMxMmQxNTNmYzMwZTU5M2ZlMTA5ZjljN2UwNTQxZjQKU2lnbmVkLW9mZi1ieTogc2hh
b3l1bmwgPHNoYW95dW4ubGl1QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZS5jIHwgMTkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDE5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMK
aW5kZXggZjMyOWI4Mi4uMjcwMzg5YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2UuYwpAQCAtMzg3LDYgKzM4NywyNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZp
Y2VfaW5mbyBuYXZpMTBfZGV2aWNlX2luZm8gPSB7CiAJLm51bV9zZG1hX3F1ZXVlc19wZXJfZW5n
aW5lID0gOCwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkx
Ml9kZXZpY2VfaW5mbyA9IHsKKwkuYXNpY19mYW1pbHkgPSBDSElQX05BVkkxMCwKKwkuYXNpY19u
YW1lID0gIm5hdmkxMiIsCisJLm1heF9wYXNpZF9iaXRzID0gMTYsCisJLm1heF9ub19vZl9ocWQg
ID0gMjQsCisJLmRvb3JiZWxsX3NpemUgID0gOCwKKwkuaWhfcmluZ19lbnRyeV9zaXplID0gOCAq
IHNpemVvZih1aW50MzJfdCksCisJLmV2ZW50X2ludGVycnVwdF9jbGFzcyA9ICZldmVudF9pbnRl
cnJ1cHRfY2xhc3NfdjksCisJLm51bV9vZl93YXRjaF9wb2ludHMgPSA0LAorCS5tcWRfc2l6ZV9h
bGlnbmVkID0gTVFEX1NJWkVfQUxJR05FRCwKKwkubmVlZHNfaW9tbXVfZGV2aWNlID0gZmFsc2Us
CisJLnN1cHBvcnRzX2N3c3IgPSB0cnVlLAorCS5uZWVkc19wY2lfYXRvbWljcyA9IGZhbHNlLAor
CS5udW1fc2RtYV9lbmdpbmVzID0gMiwKKwkubnVtX3hnbWlfc2RtYV9lbmdpbmVzID0gMCwKKwku
bnVtX3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSA4LAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVj
dCBrZmRfZGV2aWNlX2luZm8gbmF2aTE0X2RldmljZV9pbmZvID0gewogCS5hc2ljX2ZhbWlseSA9
IENISVBfTkFWSTE0LAogCS5hc2ljX25hbWUgPSAibmF2aTE0IiwKQEAgLTQyNSw2ICs0NDMsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyAqa2ZkX3N1cHBvcnRlZF9kZXZp
Y2VzW11bMl0gPSB7CiAJW0NISVBfUkVOT0lSXSA9IHsmcmVub2lyX2RldmljZV9pbmZvLCBOVUxM
fSwKIAlbQ0hJUF9BUkNUVVJVU10gPSB7JmFyY3R1cnVzX2RldmljZV9pbmZvLCAmYXJjdHVydXNf
ZGV2aWNlX2luZm99LAogCVtDSElQX05BVkkxMF0gPSB7Jm5hdmkxMF9kZXZpY2VfaW5mbywgTlVM
TH0sCisJW0NISVBfTkFWSTEyXSA9IHsmbmF2aTEyX2RldmljZV9pbmZvLCAmbmF2aTEyX2Rldmlj
ZV9pbmZvfSwKIAlbQ0hJUF9OQVZJMTRdID0geyZuYXZpMTRfZGV2aWNlX2luZm8sIE5VTEx9LAog
fTsKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
