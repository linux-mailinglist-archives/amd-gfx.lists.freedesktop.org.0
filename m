Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6517082BF5
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 08:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E758089E3E;
	Tue,  6 Aug 2019 06:46:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750078.outbound.protection.outlook.com [40.107.75.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5488289E3E
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 06:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Py8hYS6aJyzhotOSha9vXb631qqduWZgCzT2339orV3gylB7Sc/+EzonpD1/EDM4z6//7Vt/qzUM/QPX0jSQRRbFtHgV1Y8iXBAc4rcQqWYWy5RqE/l/FaOxvrEOgyQ1fJhzIoV9S7z9ga9fRvjgK12iK2B1HFw/a5jxkbWnfCaYc3kTdTrwAWWv/B/O29ulxA2ClW8kY3Gqz+/rR4cIRchgmXp2ZMc5QVYMlMIoHBOXibEF6C1LYQ7iQF/YjPd0UgjY+nADFnNuWTCNjSzJm6SK1SpvgpakEHcVqyxJ8UyCx3nAEbMtqb1N7kg3/AML+O49LTK+MHYf9jO5vlbvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQQzm2gIGQMDuwBeFMjkmimU2QQI7PYjn2pDuqHMCC8=;
 b=N82/iHnlm+4a34NHn2BsWblWfRezb5oWHYLBYZHP0YUJlXa/RzQmJk/5rb4xQGxM4liv944dVtHEh4YPLjU4n9iNHgIx9TGQp8Vui7a9F6AXbJbACgFfD/QdSa7GEPEbexPCrE8tdTn6tsVsc5tV/SFLNIP2QQt4zXPysL7Afl1PhkygMCN210OZ9njnR09KLFuza6hhfuKncKUPbkK/GjnZI9dryQxtIo9ysAh1G97cP9R4bnvbRc74FinIBugHq7dlbwugpBlOktf4PHv9UFCcjC9w2go6wmsUsWIBfYdr+hpAgHRsEOui7KBCJQYNhtMScpVqjLSdf6hOrKgmMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3540.namprd12.prod.outlook.com (20.179.67.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 06:46:39 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 06:46:39 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/10] drm/amdgpu/athub2: set clock gating for navi12
Thread-Topic: [PATCH 08/10] drm/amdgpu/athub2: set clock gating for navi12
Thread-Index: AQHVTCKzbHRe/UzNMEm9Fy7hsFMsMg==
Date: Tue, 6 Aug 2019 06:46:39 +0000
Message-ID: <20190806064546.19434-9-xiaojie.yuan@amd.com>
References: <20190806064546.19434-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190806064546.19434-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0001.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::13) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f94dbaa-8483-4d1e-2a18-08d71a39d565
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3540; 
x-ms-traffictypediagnostic: BN8PR12MB3540:
x-microsoft-antispam-prvs: <BN8PR12MB354045E252586872ADCF8D4789D50@BN8PR12MB3540.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(189003)(199004)(5660300002)(50226002)(8676002)(71190400001)(71200400001)(8936002)(6512007)(81166006)(6916009)(86362001)(25786009)(53936002)(316002)(4326008)(81156014)(54906003)(446003)(26005)(76176011)(11346002)(2616005)(68736007)(14444005)(66066001)(2501003)(102836004)(186003)(3846002)(99286004)(52116002)(6506007)(2351001)(256004)(486006)(1076003)(14454004)(36756003)(476003)(66476007)(305945005)(5640700003)(386003)(478600001)(6486002)(64756008)(66446008)(66556008)(6116002)(2906002)(4744005)(66946007)(6436002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3540;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KQtTmnv+xuqpiFCgWUiPGh9Lt7o53oTKpxlmXRpk4lAAHllEaGIcHY94eX8r0eE2xKK9ZIvbOcLXQdId+4kzKftsZ1I9BhYPwAT8cylrkoLVA0PIp6BkgpqAjf7wTtk00kN6P7zZE8r1XMTwF30XPdIUGGxeyHjJ4VFDJXfZdJA7ifBzufzHR4C6X0zh+BrX8vcSQofP1nx0tpvhAYFV3jKEZBTXckZRKmVVcI1SVG/pf+AEJUteCB3MZzkhs4yTqXQY2wtl9niDQyXqm3CE077RFvRLiyfyUpaZfQU0meabLg832tjfdJkRSxwjGhsX26A/ZzuBzNHThVQd/Xi5D96Gan0PTaCSz0iJGyfJpRr4F8tl7bX0aJNy9Bd0qSpMDwiOFYp5jvj9OZFm1lW935ehzYU1w3PLNMlYRB3uyC4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f94dbaa-8483-4d1e-2a18-08d71a39d565
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 06:46:39.6856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQQzm2gIGQMDuwBeFMjkmimU2QQI7PYjn2pDuqHMCC8=;
 b=ubjWgQTyCIXFf/8Vi7G8gxHbGshYspqAHH+jBz5pFaXet9jajzntC5xOu1JEdRpehjTCQBuhI4ntDncxyJHLQQqLpfs+CaET40TfqElWpW6LUw0EEMIe6jAhPTb/TmGpA/00cmAZG+eO16cUhTPffhCWZcoLJMleiQoRdilsNrw=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIG5hdmkxMiBkZWZpbmUKClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55
dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRodWJfdjJfMC5jIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hdGh1Yl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hdGh1Yl92Ml8wLmMKaW5kZXggZDNkN2MyMTc2OTMzLi40NWYyNjJjNmM2MGYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0aHViX3YyXzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdGh1Yl92Ml8wLmMKQEAgLTc0LDYgKzc0LDcgQEAgaW50
IGF0aHViX3YyXzBfc2V0X2Nsb2NrZ2F0aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAog
CiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2Ug
Q0hJUF9OQVZJMTI6CiAJCWF0aHViX3YyXzBfdXBkYXRlX21lZGl1bV9ncmFpbl9jbG9ja19nYXRp
bmcoYWRldiwKIAkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUgOiBmYWxzZSk7
CiAJCWF0aHViX3YyXzBfdXBkYXRlX21lZGl1bV9ncmFpbl9saWdodF9zbGVlcChhZGV2LAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
