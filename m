Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D826DDD0A6
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 22:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D488089165;
	Fri, 18 Oct 2019 20:52:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790041.outbound.protection.outlook.com [40.107.79.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F153889165
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 20:52:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmGdjRRMxGRArf807VRMGwxnwLUAVfaPRLgHXZfQoIHhLMdal6kypcAVgqURyq09yke5WcIJM/SxPumir7swjv4rhU/5IP4u9REaZ0M2Yd8r0yOfIMBMxAzx8MyLf2aTD5Fean+20AWPcojHOlpqN+HCIFIyBvqC2cXZ6ef/74IfLIorvvRz4WP7Am5yCgSmi4XChyrkTpPnp57pmqKojBIl/zRPRjcivjoeY7bP9SiHjbw0X4Xj6M3rvbTCPybQIB3QFfrjZdznNzhv8x6w799WyyHKzeF5EiXi8Q2VUe/u43wS3Rkhb24HTAgciey+1XQOfou/HEP0WuXMyFPbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBv4NcRskNGu4ka7CmKTapdFkT+3C3Q0J3gE7+TYF5A=;
 b=gRfzbvycKOUOlPfXb6+XynnPoCQyZguYJi27ZbEnsd9/bym5hszr6zMMngdbMNZ/ZIC5h4nDN037gYakIZuE9uEqI5qpfhUyDZ5IVGRi4yQatwWogS+QI8F5cnYkAhIe2XvWDa36TD+OAZBDbnq3rLVief7vARWKZgRWhoz8LvoMtDPxdAmRXro8s626FgUMU8yp7mbrtB+0xndccH0guiJOJySM1+ZeEeMIvhffC44WSz1t8VgzbPJMlZQ4k5ehISQGX08Vs/r54GOXvbuuql9VnWIKyVZ5oOseA+3ACNuY6VqadCFm4ZmKnX/ZOwbKuheuYly0qhzESTqnYkH8ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3755.namprd12.prod.outlook.com (10.255.172.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Fri, 18 Oct 2019 20:52:39 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034%4]) with mapi id 15.20.2367.019; Fri, 18 Oct 2019
 20:52:39 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: revert calling smu msg in df callbacks
Thread-Topic: [PATCH] drm/amdgpu: revert calling smu msg in df callbacks
Thread-Index: AQHVhfKwmfqAaOJhNUK7Z6bWDJR296dg4A4A
Date: Fri, 18 Oct 2019 20:52:39 +0000
Message-ID: <32330969-5069-e578-2b82-1a5d04ff2ea9@amd.com>
References: <20191018202856.27133-1-jonathan.kim@amd.com>
In-Reply-To: <20191018202856.27133-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTOPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::14) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 996e7276-7e0c-4537-0bd4-08d7540d1cf6
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3755DC9132C259049ED68F07926C0@DM6PR12MB3755.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(199004)(189003)(26005)(31686004)(2501003)(53546011)(81156014)(66446008)(6506007)(81166006)(71190400001)(71200400001)(3846002)(66946007)(102836004)(6116002)(66476007)(5660300002)(66556008)(86362001)(58126008)(64756008)(110136005)(6486002)(316002)(186003)(229853002)(305945005)(6436002)(478600001)(476003)(76176011)(11346002)(446003)(14454004)(8936002)(2906002)(7736002)(31696002)(386003)(6512007)(14444005)(36756003)(256004)(2616005)(25786009)(486006)(66066001)(52116002)(65806001)(65956001)(4001150100001)(6246003)(99286004)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3755;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OKjorjsjXaJ6deGMq7v8mlreC5DVbV6oxOpksjXHdu6HX5o8YvctvHxe1+yTk9Zx8D8sMVqmlWJBls4LzQWm1zT/d4BSnltfpwS9NrRiUjWIXZiOsU0NXhePEOAWcOd5rihSmraEBiy3nLRbszlXbB3ZdXiVtAhzVTalHaIuUlBUZFFDpFvy8CpUQIuxWLbJgtt6d1dqaagHJPrWXwzrHOhYh+AQHsfuc2dZMCUhRNj9Bq+NOoJV/VMtBYuIT3iVNKZr+5odaN6CJ6BkSWtX6E4XLHjLNbR796ByCiGtCQZFWY4F+753yM6UgM0e8/zCA6KXJl21zNm1JBskgmAnzqaRvV5O6TW5E4QEE9IlNZ+q1DEB/JEfHiUe44w/C8vREQ3wb+E4W5HtW725b2AjzK7wEIOBOxk7+9/t9slAgCo=
Content-ID: <57A0253F5D59D74CBE1EBFA52D710DF2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 996e7276-7e0c-4537-0bd4-08d7540d1cf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 20:52:39.5508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ja69UGEEaFBXn3kq2nAerwDorrP0Thxovy0SFXv9Oahi7wG50b1N6dsd4SgdF3lFR3Jc+yQfY9Hjws4VXCgikA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3755
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBv4NcRskNGu4ka7CmKTapdFkT+3C3Q0J3gE7+TYF5A=;
 b=xJtR94JWrr2gnEgD01PVrv5cP+rAGY36y3mcRSDNgQ+D7VEr8MNTJkyW3vHZiScAovwz8zgsukK6ahxHTayDAacNxIAG7LDzfVHTEtkg4MQ38k6eVv/4ZT+iHBtwUWBI/Z3+mBm0IKNCYcowlZnQGhHy8xc8Erd5L48Hqw1Pkv0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xOCA0OjI5IHAubS4sIEtpbSwgSm9uYXRoYW4gd3JvdGU6DQo+IHJldmVydGlu
ZyB0aGUgZm9sbG93aW5nIGNoYW5nZXM6DQo+IGNvbW1pdCA3ZGQyZWIzMWZjZDUgKCJkcm0vYW1k
Z3B1OiBmaXggY29tcGlsZXIgd2FybmluZ3MgZm9yIGRmIHBlcmZtb25zIikNCj4gY29tbWl0IDU0
Mjc1Y2QxNjQ5ZiAoImRybS9hbWRncHU6IGRpc2FibGUgYy1zdGF0ZXMgb24geGdtaSBwZXJmbW9u
cyIpDQo+DQo+IHBlcmYgZXZlbnRzIHVzZSBzcGluLWxvY2tzLiAgZW1iZWRkZWQgc211IG1lc3Nh
Z2VzIGhhdmUgcG90ZW50aWFsIGxvbmcNCj4gcmVzcG9uc2UgdGltZXMgYW5kIHBvdGVudGlhbGx5
IGRlYWRsb2NrcyB0aGUgc3lzdGVtLg0KPg0KPiBDaGFuZ2UtSWQ6IEljMzZjMzVhNjJkZWMxMTZk
MGEyZjViNjljMjJhZjRkNDE0NDU4Njc5DQo+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIEtpbSA8
Sm9uYXRoYW4uS2ltQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVs
aXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KU2VlIG9uZSBtb3JlIGNvbW1lbnQgaW5saW5lIGJlbG93
IC4uLg0KDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5j
IHwgMzggKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZGZfdjNfNi5jDQo+IGluZGV4IGUxY2Y3ZTljNjE2YS4uMTZmYmQyYmM4YWQxIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jDQo+IEBAIC05MywyMSArOTMsNiBAQCBj
b25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwICpkZl92M182X2F0dHJfZ3JvdXBzW10gPSB7DQo+
ICAgCQlOVUxMDQo+ICAgfTsNCj4gICANCj4gLXN0YXRpYyBpbnQgZGZfdjNfNl9zZXRfZGZfY3N0
YXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgYWxsb3cpDQo+IC17DQo+IC0JaW50
IHIgPSAwOw0KPiAtDQo+IC0JaWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKSB7DQo+IC0JCXIg
PSBzbXVfc2V0X2RmX2NzdGF0ZSgmYWRldi0+c211LCBhbGxvdyk7DQo+IC0JfSBlbHNlIGlmIChh
ZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MNCj4gLQkJCSYmIGFkZXYtPnBvd2VycGxheS5wcF9mdW5j
cy0+c2V0X2RmX2NzdGF0ZSkgew0KPiAtCQlyID0gYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5z
ZXRfZGZfY3N0YXRlKA0KPiAtCQkJYWRldi0+cG93ZXJwbGF5LnBwX2hhbmRsZSwgYWxsb3cpOw0K
PiAtCX0NCj4gLQ0KPiAtCXJldHVybiByOw0KPiAtfQ0KPiAtDQo+ICAgc3RhdGljIHVpbnQ2NF90
IGRmX3YzXzZfZ2V0X2ZpY2Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCQkJCSB1
aW50MzJfdCBmaWNhYV92YWwpDQo+ICAgew0KPiBAQCAtMTE3LDkgKzEwMiw2IEBAIHN0YXRpYyB1
aW50NjRfdCBkZl92M182X2dldF9maWNhKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAg
IAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYp
Ow0KPiAgIAlkYXRhID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfZGF0YV9vZmZzZXQoYWRl
dik7DQo+ICAgDQo+IC0JaWYgKGRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBERl9DU1RBVEVf
RElTQUxMT1cpKQ0KPiAtCQlyZXR1cm4gMHhGRkZGRkZGRkZGRkZGRkZGOw0KPiAtDQo+ICAgCXNw
aW5fbG9ja19pcnFzYXZlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7DQo+ICAgCVdSRUcz
MihhZGRyZXNzLCBzbW5ERl9QSUVfQU9OX0ZhYnJpY0luZGlyZWN0Q29uZmlnQWNjZXNzQWRkcmVz
czMpOw0KPiAgIAlXUkVHMzIoZGF0YSwgZmljYWFfdmFsKTsNCj4gQEAgLTEzMiw4ICsxMTQsNiBA
QCBzdGF0aWMgdWludDY0X3QgZGZfdjNfNl9nZXRfZmljYShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwNCj4gICANCj4gICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+cGNpZV9pZHhf
bG9jaywgZmxhZ3MpOw0KPiAgIA0KPiAtCWRmX3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBERl9D
U1RBVEVfQUxMT1cpOw0KPiAtDQo+ICAgCXJldHVybiAoKChmaWNhZGhfdmFsICYgMHhGRkZGRkZG
RkZGRkZGRkZGKSA8PCAzMikgfCBmaWNhZGxfdmFsKTsNCj4gICB9DQo+ICAgDQo+IEBAIC0xNDUs
OSArMTI1LDYgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9zZXRfZmljYShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgdWludDMyX3QgZmljYWFfdmFsLA0KPiAgIAlhZGRyZXNzID0gYWRldi0+bmJp
by5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYpOw0KPiAgIAlkYXRhID0gYWRldi0+
bmJpby5mdW5jcy0+Z2V0X3BjaWVfZGF0YV9vZmZzZXQoYWRldik7DQo+ICAgDQo+IC0JaWYgKGRm
X3YzXzZfc2V0X2RmX2NzdGF0ZShhZGV2LCBERl9DU1RBVEVfRElTQUxMT1cpKQ0KPiAtCQlyZXR1
cm47DQo+IC0NCj4gICAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZs
YWdzKTsNCj4gICAJV1JFRzMyKGFkZHJlc3MsIHNtbkRGX1BJRV9BT05fRmFicmljSW5kaXJlY3RD
b25maWdBY2Nlc3NBZGRyZXNzMyk7DQo+ICAgCVdSRUczMihkYXRhLCBmaWNhYV92YWwpOw0KPiBA
QCAtMTU3LDkgKzEzNCw4IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfc2V0X2ZpY2Eoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGZpY2FhX3ZhbCwNCj4gICANCj4gICAJV1JFRzMy
KGFkZHJlc3MsIHNtbkRGX1BJRV9BT05fRmFicmljSW5kaXJlY3RDb25maWdBY2Nlc3NEYXRhSGkz
KTsNCj4gICAJV1JFRzMyKGRhdGEsIGZpY2FkaF92YWwpOw0KPiAtCXNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsNCj4gICANCj4gLQlkZl92M182X3Nl
dF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0FMTE9XKTsNCj4gKwlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7DQo+ICAgfQ0KPiAgIA0KPiAgIC8q
DQo+IEBAIC0xNzcsMTcgKzE1MywxMiBAQCBzdGF0aWMgdm9pZCBkZl92M182X3BlcmZtb25fcnJl
ZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAJYWRkcmVzcyA9IGFkZXYtPm5iaW8u
ZnVuY3MtPmdldF9wY2llX2luZGV4X29mZnNldChhZGV2KTsNCj4gICAJZGF0YSA9IGFkZXYtPm5i
aW8uZnVuY3MtPmdldF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYpOw0KPiAgIA0KPiAtCWlmIChkZl92
M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZfQ1NUQVRFX0RJU0FMTE9XKSkNCj4gLQkJcmV0dXJu
Ow0KPiAtDQo+ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFn
cyk7DQo+ICAgCVdSRUczMihhZGRyZXNzLCBsb19hZGRyKTsNCj4gICAJKmxvX3ZhbCA9IFJSRUcz
MihkYXRhKTsNCj4gICAJV1JFRzMyKGFkZHJlc3MsIGhpX2FkZHIpOw0KPiAgIAkqaGlfdmFsID0g
UlJFRzMyKGRhdGEpOw0KPiAgIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5wY2llX2lk
eF9sb2NrLCBmbGFncyk7DQo+IC0NCj4gLQlkZl92M182X3NldF9kZl9jc3RhdGUoYWRldiwgREZf
Q1NUQVRFX0FMTE9XKTsNCj4gICB9DQo+ICAgDQo+ICAgLyoNCj4gQEAgLTIwNCwxNyArMTc1LDEy
IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfcGVyZm1vbl93cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LCB1aW50MzJfdCBsb19hZGRyLA0KPiAgIAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5j
cy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYpOw0KPiAgIAlkYXRhID0gYWRldi0+bmJpby5m
dW5jcy0+Z2V0X3BjaWVfZGF0YV9vZmZzZXQoYWRldik7DQo+ICAgDQo+IC0JaWYgKGRmX3YzXzZf
c2V0X2RmX2NzdGF0ZShhZGV2LCBERl9DU1RBVEVfRElTQUxMT1cpKQ0KPiAtCQlyZXR1cm47DQo+
IC0NCj4gICAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsN
Cj4gICAJV1JFRzMyKGFkZHJlc3MsIGxvX2FkZHIpOw0KPiAgIAlXUkVHMzIoZGF0YSwgbG9fdmFs
KTsNCj4gICAJV1JFRzMyKGFkZHJlc3MsIGhpX2FkZHIpOw0KPiAgIAlXUkVHMzIoZGF0YSwgaGlf
dmFsKTsNCj4gICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+cGNpZV9pZHhfbG9jaywg
ZmxhZ3MpOw0KPiAtDQo+IC0JZGZfdjNfNl9zZXRfZGZfY3N0YXRlKGFkZXYsIERGX0NTVEFURV9B
TExPVyk7DQo+ICAgfQ0KPiAgIA0KPiAgIC8qIGdldCB0aGUgbnVtYmVyIG9mIGRmIGNvdW50ZXJz
IGF2YWlsYWJsZSAqLw0KPiBAQCAtNTQ2LDcgKzUxMiw3IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZf
cG1jX2dldF9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAJCQkJICB1aW50
NjRfdCBjb25maWcsDQo+ICAgCQkJCSAgdWludDY0X3QgKmNvdW50KQ0KPiAgIHsNCj4gLQl1aW50
MzJfdCBsb19iYXNlX2FkZHIsIGhpX2Jhc2VfYWRkciwgbG9fdmFsID0gMCwgaGlfdmFsID0gMDsN
Cj4gKwl1aW50MzJfdCBsb19iYXNlX2FkZHIsIGhpX2Jhc2VfYWRkciwgbG9fdmFsLCBoaV92YWw7
DQoNClRoaXMgcGFydCBsb29rcyBsaWtlIGl0IHdhcyB1bnJlbGF0ZWQgdG8gdGhlIERGIENzdGF0
ZSBjaGFuZ2VzLiBJZiB0aGlzIA0KYWRkcmVzc2VkIGEgcmVhbCBwcm9ibGVtLCBtYXliZSBpdCBj
YW4gYmUgcmVpbnRyb2R1Y2VkIHdpdGggYSBzZXBhcmF0ZSANCmNvbW1pdCBhZnRlciB0aGlzIHJl
dmVydC4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4gICAJKmNvdW50ID0gMDsNCj4gICAN
Cj4gICAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
