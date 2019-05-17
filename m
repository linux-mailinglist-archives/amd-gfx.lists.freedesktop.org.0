Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 253132138D
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 07:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC7D8982F;
	Fri, 17 May 2019 05:53:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690079.outbound.protection.outlook.com [40.107.69.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4E68982F
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 05:53:40 +0000 (UTC)
Received: from BYAPR12MB3048.namprd12.prod.outlook.com (20.178.53.221) by
 BYAPR12MB2616.namprd12.prod.outlook.com (20.176.255.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Fri, 17 May 2019 05:53:38 +0000
Received: from BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::3cb3:69b4:ec3e:db29]) by BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::3cb3:69b4:ec3e:db29%4]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 05:53:38 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Cui, Flora" <Flora.Cui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: keep stolen memory on picasso
Thread-Topic: [PATCH] drm/amdgpu: keep stolen memory on picasso
Thread-Index: AQHVDGNfqErXdbkrAEqfy6rTDm0GVaZu0ONQ
Date: Fri, 17 May 2019 05:53:38 +0000
Message-ID: <BYAPR12MB304850E04D2A3F9FC2AEBD84FE0B0@BYAPR12MB3048.namprd12.prod.outlook.com>
References: <1558064879-32517-1-git-send-email-flora.cui@amd.com>
In-Reply-To: <1558064879-32517-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23f1184e-9f74-46c5-7f72-08d6da8c0222
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2616; 
x-ms-traffictypediagnostic: BYAPR12MB2616:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB26160677964259425C1582AEFE0B0@BYAPR12MB2616.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:33;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(376002)(136003)(396003)(346002)(189003)(13464003)(199004)(110136005)(2906002)(3846002)(6116002)(99286004)(486006)(73956011)(186003)(76176011)(53546011)(6506007)(7696005)(476003)(11346002)(66066001)(446003)(5660300002)(86362001)(26005)(66946007)(76116006)(66446008)(66476007)(64756008)(71200400001)(71190400001)(25786009)(256004)(7736002)(102836004)(478600001)(966005)(55016002)(33656002)(6306002)(53936002)(4326008)(52536014)(66556008)(229853002)(68736007)(14454004)(6246003)(316002)(9686003)(2501003)(305945005)(6436002)(72206003)(81156014)(8676002)(81166006)(74316002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2616;
 H:BYAPR12MB3048.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xai3rQNP+2xpCawcdoPHl1NrZGpZw9YOhnBlrM4/8YgEDQ1soMobolXBntiTaOAdxw1ovFokC+ZCndNBtlYZs7GNeo8ft2/dvgp7XGGb8L13O9/wwpzxq+nfA7F5nBbvapbUfsSWLvh3xTc36Js0aHJ8ZllJzGlLjvjJB+kcXM6f7F9hhiNdt7JdXixDlKBBsAkki/7yDS9z3Rs19CIEX2sOhMmskwDj/je3sJoAtdeKMESKnqCai/U8kPN5UZbUtjtQIqGAozwl2IK9g83hUpHCJ2jDc9emuyotYxV/YkR4zut9948JpJRRGMAErPbQkIJSicNyOLE+7kAMAcM2aYX+KmXwAOmPamBoL3oof1hxCGnj7SWnFACX1+uThkHGwhEvfS/JIZPe6MOBmQ6HGdKwp5LBlN4BJiG/nbitvds=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f1184e-9f74-46c5-7f72-08d6da8c0222
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 05:53:38.3726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Us3hNrVUJzheOJfE4m17h4MFTYYGG80iI3PXcS/NnDg=;
 b=t8cwIO60znULLzQckfboaFyeFCcZIkxqFg2VzXzy9lK/HKJrzjma0jk3ADNjAWMHIiCqzvKapzPxEBn/b34R0foUy5LTO98iTdcN3FuiRncvwQLKZOd5EJVLrCzXnpiwFHJewmHnu6jehYZsTsPF4Z4Qyppom6NJN3zCiIb04e4=
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

UmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ3VpLCBGbG9yYQ0KU2VudDogRnJpZGF5LCBNYXkg
MTcsIDIwMTkgMTE6NDggQU0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6
IEN1aSwgRmxvcmEgPEZsb3JhLkN1aUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1k
Z3B1OiBrZWVwIHN0b2xlbiBtZW1vcnkgb24gcGljYXNzbw0KDQpbQ0FVVElPTjogRXh0ZXJuYWwg
RW1haWxdDQoNCm90aGVyd2lzZSBzY3JlZW4gY29ycnVwdHMgZHVyaW5nIG1vZHByb2JlLg0KDQpD
aGFuZ2UtSWQ6IEk3M2JjZjNhYjBjNjY2MDc3ZGZlODU0MzZhMzQ1N2EwMzc5MzgyMzA0DQpTaWdu
ZWQtb2ZmLWJ5OiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCmluZGV4IGMy
MjE1NzAuLjVhZmJiNTkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQpA
QCAtNjI2LDYgKzYyNiw3IEBAIHN0YXRpYyBib29sIGdtY192OV8wX2tlZXBfc3RvbGVuX21lbW9y
eShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAgICAgICAgY2FzZSBDSElQX1ZFR0ExMDoN
CiAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCiAgICAgICAgY2FzZSBDSElQX1JBVkVOOg0K
KyAgICAgICAgICAgICAgIHJldHVybiAoYWRldi0+cGRldi0+ZGV2aWNlID09IDB4MTVkOCk7DQog
ICAgICAgIGNhc2UgQ0hJUF9WRUdBMTI6DQogICAgICAgIGNhc2UgQ0hJUF9WRUdBMjA6DQogICAg
ICAgIGRlZmF1bHQ6DQotLQ0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
