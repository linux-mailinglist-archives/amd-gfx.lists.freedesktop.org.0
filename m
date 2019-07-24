Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FAD7318D
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6A46E5B1;
	Wed, 24 Jul 2019 14:25:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700077.outbound.protection.outlook.com [40.107.70.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18006E5B1
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:25:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwhX0f3cWCIn7NiTHFOAGCVKl7TlqXK99OIJt3ZSbL5JWSf3xPIQr+QB5lUk3s9oyxA8Or2wmTTBFkosoit0IjXxd5eFsBCg8Y/DijZMEe/PZcaJul5vRoEiJL27YcQ6dW6YV1CWPoPcV7QEE+nPg+qa0EKrGuOscAZXs3tOvT7qKZ+AV7276OVSZgecAgcpH7lahhy6fBYp+j7q9CR4ktMPFDYBPzMIh2OgTArdSLIdqj7Au2OWIJNLD/yZYpvZtdLN2ENc0L8s7zGPpiO+V+qogRKFHiXIdoAIHeFUeUjEAVfE1DljtQHN9d7mtfODYL1x2RLtf+lYACiViKnZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQtgJmwHcAG1/pM8dD9zWAxp6+0bjnUho1AeaZ+5Ti4=;
 b=k2da2rWrvSTxQBWbzJnwlY1y13JgP9w55gE+aYlcsOoLe5ck5SMmKmX/BmiIXloFX8yoLzemXhPgmsvRFNQzc3nzN0l79SsTSc1qGhISzapjnMPRFeYPiNkeC5xiNITrs0R/0rprQdKG1wV9JlBQhtpSWeB7okllo2eONjAauOthzhBsoiNAxkcBueCZV2M7bxu86RUOSqvDVU/qctJC7zONErr3XBO9kCu+Um2OaX/Xug1/+Kx9KxJ64raDbh9V0mgRWqifF5DdZRM2euGkpI/kbNq/8/ly4YMCk1Dksh5fTG9McFcp0Xca+XhV8nTKFAX71G8i8khZuZv33T8c/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2581.namprd12.prod.outlook.com (52.132.141.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 14:25:01 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.013; Wed, 24 Jul
 2019 14:25:01 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Thread-Topic: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
Thread-Index: AQHVQinFl8obpZfKfUm+Yt/IH6AjmabZ0skA
Date: Wed, 24 Jul 2019 14:25:01 +0000
Message-ID: <492b52b5-36e0-f957-88e1-c2479f8c56c4@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563977442-4809-4-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1563977442-4809-4-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0005.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::17)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15e7067d-4a1f-4eb5-e30f-08d71042b66a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2581; 
x-ms-traffictypediagnostic: DM5PR12MB2581:
x-microsoft-antispam-prvs: <DM5PR12MB25815C23AE93B3A3D80C3E5C83C60@DM5PR12MB2581.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(199004)(189003)(65956001)(65806001)(7736002)(66946007)(71200400001)(2501003)(71190400001)(46003)(31686004)(99286004)(76176011)(305945005)(11346002)(5660300002)(66446008)(476003)(446003)(2616005)(4326008)(229853002)(65826007)(52116002)(478600001)(68736007)(8676002)(66476007)(64756008)(14444005)(6116002)(53936002)(2906002)(6486002)(31696002)(64126003)(86362001)(6512007)(66556008)(6436002)(14454004)(25786009)(8936002)(6246003)(486006)(54906003)(386003)(110136005)(6506007)(58126008)(36756003)(81156014)(81166006)(316002)(186003)(102836004)(256004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2581;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7e36ONJ9OFtgav3ulXLBOLvuOkuvro70M4B+7QXH1iiHmuX/zAgshxqKuyFFb+B//4xBDTR/VV3Nozh6tvAAO5095uPyoOdLFUA8sif4W7aFOZUYVvKP36MaAb6O1ddOXXhr6tkagBlsi23Jm+lQqG9TR4/rf6gP4opAZEi7nXORIeKI83gq4xHemg4uvwu4B7ZIuZlEcT+OflTeR8r0NHpCnJkfyaTDwEc5uuMD7vq/jN6pOiX/FykgeTBRKZMX2ihscE7kuqMd9+s5HMeWmu5zpEQmDa3MYSylANl+xiIIwQhCiVvsaJYBAG2ksRmK3Lo/FJLkALm2IH+dsmsTUfXS4Gn1nZXuHX/lxrk+hsmAVckTwFJZBs9hIws165xqwxYelAp001ZTMFgBSsj8x59ZMuFMP7uBl5yL5x5lFhY=
Content-ID: <F189C3A11193704094248E1F93F63207@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e7067d-4a1f-4eb5-e30f-08d71042b66a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 14:25:01.3861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2581
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQtgJmwHcAG1/pM8dD9zWAxp6+0bjnUho1AeaZ+5Ti4=;
 b=kWZ5CrIAoyZ9SJJrTfBWWOahScH7XU5PFz/3/tiHZuN+4WVMc/dgq2knuA6EG6V8qwSXo4/nu0LjxoZ/dSduD2+pM0gQXsqCb1tthvaAdfzCrRIrez4O0aP9aPZRJx1R+Cr9xXhdO1+9tQd4YdNATDtt8LydjwEjaIbdsygTeo8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wu,
 Hersen" <hersenxs.wu@amd.com>, "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjQuMDcuMTkgdW0gMTY6MTAgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToNCj4gRnJvbTog
U2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4NCj4NCj4gZW5hYmxlcyBncHVfdm1fc3VwcG9y
dCBpbiBkbSBhbmQgYWRkcw0KPiBBTURHUFVfR0VNX0RPTUFJTl9HVFQgYXMgc3VwcG9ydGVkIGRv
bWFpbg0KPg0KPiB2MjoNCj4gTW92ZSBCTyBwbGFjZW1lbnQgbG9naWMgaW50byBhbWRncHVfZGlz
cGxheV9zdXBwb3J0ZWRfZG9tYWlucw0KPg0KPiB2MzoNCj4gVXNlIGFtZGdwdV9ib192YWxpZGF0
ZV91c3djIGluIGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zLg0KPg0KPiBDaGFuZ2Ut
SWQ6IElmMzQzMDBiZWFhNjBiZTJkMzYxNzBiN2I1YjA5NmVjNjQ0NTAyYjIwDQo+IFNpZ25lZC1v
ZmYtYnk6IFNoaXJpc2ggUyA8c2hpcmlzaC5zQGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KDQpBY3R1YWxseSB0
aGF0IGRvZXNuJ3QgbG9vayBsaWtlIGEgZ29vZCBpZGVhIHRvIG1lLg0KDQpJdCBpcyBzdGlsbCBw
ZXJmZWN0bHkgcG9zc2libGUgKGFuZCB3YW50ZWQhKSB0aGF0IHRoZSBVU1dDIGZsYWcgd2FzIG5v
dCANCnNldCBpbiB0aGUgZmlyc3QgcGxhY2UgYnkgdXNlcnNwYWNlLg0KDQpJcyB0aGF0IHN0aWxs
IGNoZWNrZWQgc29tZXdoZXJlPw0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+IC0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMgICAgICAgfCAxNiAr
KysrKysrKysrKysrKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYyB8ICAyICstDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kaXNwbGF5LmMNCj4gaW5kZXggNzY3ZWU2OTkuLjIzYjgwNDYgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYw0KPiBAQCAtMzcsNiArMzcs
NyBAQA0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2VkaWQuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2Ry
bV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fZmJfaGVs
cGVyLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9jYWNoZS5oPg0KPiAgIA0KPiAgIHN0YXRpYyB2
b2lkIGFtZGdwdV9kaXNwbGF5X2ZsaXBfY2FsbGJhY2soc3RydWN0IGRtYV9mZW5jZSAqZiwNCj4g
ICAJCQkJCSBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYikNCj4gQEAgLTQ5NiwxMCArNDk3LDIxIEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzIGFtZGdwdV9mYl9mdW5j
cyA9IHsNCj4gICB1aW50MzJfdCBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICB7DQo+ICAgCXVpbnQzMl90IGRvbWFpbiA9IEFN
REdQVV9HRU1fRE9NQUlOX1ZSQU07DQo+ICsJdTY0IHVzd2NfZmxhZyA9IEFNREdQVV9HRU1fQ1JF
QVRFX0NQVV9HVFRfVVNXQzsNCj4gICANCj4gICAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9E
QykNCj4gLQlpZiAoYWRldi0+YXNpY190eXBlID49IENISVBfQ0FSUklaTyAmJiBhZGV2LT5hc2lj
X3R5cGUgPCBDSElQX1JBVkVOICYmDQo+IC0JICAgIGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSAm
Jg0KPiArCS8qDQo+ICsJICogaWYgYW1kZ3B1X2JvX3ZhbGlkYXRlX3Vzd2MgY2xlYXJzIEFNREdQ
VV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQyBpdA0KPiArCSAqIG1lYW5zIHRoYXQgVVNXQyBtYXBw
aW5ncw0KPiArCSAqIGlzIG5vdCBzdXBwb3J0ZWQgZm9yIHRoaXMgYm9hcmQuIEJ1dCB0aGlzIG1h
cHBpbmcgaXMgcmVxdWlyZWQNCj4gKwkgKiB0byBhdm9pZCBoYW5nIGNhdXNlZCBieSBwbGFjZW1l
bnQgb2Ygc2Nhbm91dCBCTyBpbiBHVFQgb24gY2VydGFpbg0KPiArCSAqIEFQVXMuIFNvIGZvcmNl
IHRoZSBCTyBwbGFjZW1lbnQgdG8gVlJBTSBpbiBjYXNlIHRoaXMgYXJjaGl0ZWN0dXJlDQo+ICsJ
ICogd2lsbCBub3QgYWxsb3cgVVNXQyBtYXBwaW5ncy4NCj4gKwkgKi8NCj4gKwlhbWRncHVfYm9f
dmFsaWRhdGVfdXN3YygmdXN3Y19mbGFnKTsNCj4gKw0KPiArCWlmIChhZGV2LT5hc2ljX3R5cGUg
Pj0gQ0hJUF9DQVJSSVpPICYmIGFkZXYtPmFzaWNfdHlwZSA8PSBDSElQX1JBVkVOICYmDQo+ICsJ
ICAgIGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSAmJiB1c3djX2ZsYWcgJiYNCj4gICAJICAgIGFt
ZGdwdV9kZXZpY2VfYXNpY19oYXNfZGNfc3VwcG9ydChhZGV2LT5hc2ljX3R5cGUpKQ0KPiAgIAkJ
ZG9tYWluIHw9IEFNREdQVV9HRU1fRE9NQUlOX0dUVDsNCj4gICAjZW5kaWYNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IGluZGV4
IDQ5MjI1ODkuLmYwMzg3Y2UxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gQEAgLTY4Niw3ICs2ODYsNyBAQCBzdGF0
aWMgaW50IGFtZGdwdV9kbV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIAkg
Ki8NCj4gICAJaWYgKGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSAmJg0KPiAgIAkgICAgYWRldi0+
YXNpY190eXBlID49IENISVBfQ0FSUklaTyAmJg0KPiAtCSAgICBhZGV2LT5hc2ljX3R5cGUgPCBD
SElQX1JBVkVOKQ0KPiArCSAgICBhZGV2LT5hc2ljX3R5cGUgPD0gQ0hJUF9SQVZFTikNCj4gICAJ
CWluaXRfZGF0YS5mbGFncy5ncHVfdm1fc3VwcG9ydCA9IHRydWU7DQo+ICAgDQo+ICAgCWlmIChh
bWRncHVfZGNfZmVhdHVyZV9tYXNrICYgRENfRkJDX01BU0spDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
