Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456231B27FB
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Apr 2020 15:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C607A6E962;
	Tue, 21 Apr 2020 13:34:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805296E962
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Apr 2020 13:34:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5c4wfhUqH+fpEtauAgGEt7agn0FxevoP3IzXlBaTV/ZdkjC2MObdU5OFRMMeB9E67MSRqBHwqmfdW1Ez4f62mwM4TjRZZiSnXPnCnEIvMkyRUgVe9oZT/RWDXQ+xmcjMf0Zrp9rHV+eH6r2OfrOCeBxZwZdjQAiXgYU2BuLj+Xd09KxRrLBePB+ohWSuSZo0novyujBZhXpfAUC+yThBNdFN8vlu8wk6f7tDtZyOT4J/Xe0bTmiRNnXRiW5yjobLmInq7dQHm+vnlCyZTIKGsa7dLnBQDFp3002YmZE8O9JAiil+/PHtZFmlEwGBriPq1Aon2ZLM32iyYCVKVf2Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEhcWi89qNEr4dzFe/c7rPb7OSgYfqp//dMsX1EI9o8=;
 b=KCNcGnL1RRu9Uo9Usxv3f0PPjkTTofZ9CV3WMMzXSUQNzd9CfYi3QF+mdlgry/rg29l0XlzSlldD9IvxpHFJxuduEsXwrmwStVNgpSnLwIT5oqW2pBjYjK2ZUciM65auWaL1X+qSoCrA7CmFXVgMtdmoZowr2JFD7vAQDcJTMmJyj6x6r28+gPkHoZZfBLeBH/enFnqmO4G9INw9X0OJUh51sOPjAgDqLa3zoLbZ6fwZZSw3hCjMzQNWmqeRupMdSq/4DpNIYxnpHDGBl/IzPmqdgLBTQerM4A84xeVIlDvCgGP6pfMBYylprKjX7dV2aJaQ1gUAujSX4fsAgytOXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEhcWi89qNEr4dzFe/c7rPb7OSgYfqp//dMsX1EI9o8=;
 b=gytT+FH580ZbVj5g/XTxVD//4xpg6mKQybhLezNCUYIk+LHMnfDihJBz4KLI9TpGzyBxd6L9Pw64BB4Zfty71aN8DoL6XzGjTCAkEukX/i1f7wt5DZ2gLwDXPBNU801f6/yMbc4+D62zDyvWtbWsx37dOsWkSyjRNTkE816EHE8=
Received: from DM5PR12MB1708.namprd12.prod.outlook.com (2603:10b6:3:10e::22)
 by DM5PR12MB2536.namprd12.prod.outlook.com (2603:10b6:4:b3::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 13:34:25 +0000
Received: from DM5PR12MB1708.namprd12.prod.outlook.com
 ([fe80::a8d8:ad45:3232:f8bd]) by DM5PR12MB1708.namprd12.prod.outlook.com
 ([fe80::a8d8:ad45:3232:f8bd%8]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 13:34:23 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Tao, Yintian"
 <Yintian.Tao@amd.com>, "He, Jacob" <Jacob.He@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: cleanup SPM VMID update
Thread-Topic: [PATCH] drm/amdgpu: cleanup SPM VMID update
Thread-Index: AQHWF7ynCIwJx8CEhk+r7oFgdDlF66iDU8OAgAAB0ACAAABnMIAAIQWAgAAbrqA=
Date: Tue, 21 Apr 2020 13:34:23 +0000
Message-ID: <DM5PR12MB17084F56C0844DD8976904A084D50@DM5PR12MB1708.namprd12.prod.outlook.com>
References: <20200421091004.130041-1-christian.koenig@amd.com>
 <MN2PR12MB30398FD163EB6424F5E8E502E5D50@MN2PR12MB3039.namprd12.prod.outlook.com>
 <3c1996ea-82a6-7962-7ef9-d6b5b1a4e6e1@gmail.com>
 <DM5PR12MB1708CD99E8C25337A7766CA584D50@DM5PR12MB1708.namprd12.prod.outlook.com>
 <00fa934b-9859-05ca-0b7e-8408aba2a500@gmail.com>
In-Reply-To: <00fa934b-9859-05ca-0b7e-8408aba2a500@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
x-originating-ip: [101.87.149.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dc37c4ac-e541-4f91-a72f-08d7e5f8b475
x-ms-traffictypediagnostic: DM5PR12MB2536:|DM5PR12MB2536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2536391AA26594823076ED8084D50@DM5PR12MB2536.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1708.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(316002)(45080400002)(83080400001)(76116006)(110136005)(966005)(8676002)(66446008)(33656002)(66476007)(64756008)(52536014)(478600001)(186003)(53546011)(6506007)(66556008)(66946007)(26005)(7696005)(81156014)(71200400001)(66574012)(2906002)(5660300002)(8936002)(15650500001)(55016002)(9686003)(86362001);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GnfK7cx0NHqOxWtAt7mJjFNq26oU4Aoks2tX7Xv0w2X1ngIl2nzD/Xdjlfuwca+PGXFyEyE7fRORJP7ilpOB14GzNXskvr59X6JSzvq9vbSufxuIAVOGAt/WvTHVqsxCt8RSfJ+CEWYKCx+uB1exXrvqGqdl2OshvFN9nA5QeGErcB+Bq1e8B7mY23KXY3Z9vhsKbeESOCqqsBAI1Qp3klxv/dv5m/jEyQb2MVU76XSG6kB0XDe+7GgqnjuopAtCdJ5o1PE8B8HhqUhej0aGS1pR1SgGt66c5M/T3cbDHq1Ng7o+Mvgoyw6yt6eUqg/lYug7JgkUZlESB5grCBYr1wZPBwjA1QmMvQeOEvYCAkRQ+asRYga+fj3Jn7nV9MXl+obOeXBC4tkNM90USocyCdzHXn6+VUvR62tTHzZlVbcpB6dMQzi5aS+roH/q5aR3pmnryBDcZPdqrhw/DVL5blmbq7HNTKdYASQGS4vDQXnGmrHJNtzrNITIbN5XHxo0
x-ms-exchange-antispam-messagedata: H5jWuJz8e0kSfLHDngNJQPCasOqp22qLDHrlPBl0pTOYVcn8AFQwhCbBeiVtLWDvoKY9Pj9/I8GhNaXgV7Iz2uclTmriLwyGKYure50ktC7WHJqaituFuh9G7qh2KbTjqTez+FYTEzksiSQEKPxzlw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc37c4ac-e541-4f91-a72f-08d7e5f8b475
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 13:34:23.7284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bkzpO9qxCaZAeJ/9l0gFhsfS7Tkk+8x4QtPif+NhBkhDWw4Y/g4+fvyIbkI3HN/m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2536
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

VGhlIHByb2JsZW0gaXMgc29tZSBmaWVsZHMgYXJlIGluY3JlYXNlZCBieSBoYXJkd2FyZSwgYW5k
IFJMQyBzaW1wbHkgcmVhZCBpdHMgdmFsdWUsIHdlIGNhbm5vdCBzZXQgdGhvc2UgZmllbGQgdG9n
ZXRoZXIgd2l0aCBWTUlEIA0KDQpDaHJpc3RpYW4sIHdlIHNob3VsZCBzdG9wIGFyZ3Vpbmcgb24g
dGhpcyBzbWFsbCBmZWF0dXJlLCAgdGhlcmUgaXMgbm8gd2F5IHRvIGhhdmUgYSB3b3JzZSBzb2x1
dGlvbiBjb21wYXJlZCB3aXRoIGN1cnJlbnQgbG9naWMgLi4uLiANCg0KSSB0aGluayBhdCBsZWFz
dCB3ZSBzaG91bGQgYXBwbHkgb25lIGNoYW5nZTogIHdlIHVzZSBOT19LSVEgZm9yIFNSSU9WIHBw
X29uZV92Zl9tb2RlIGNhc2UgdG8gYWNjZXNzIHRoaXMgU1BNIHJlZ2lzdGVyIHRvIGF2b2lkIFNS
SU9WIEtJUSBmbG9vZCANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
TW9uayBMaXV8R1BVIFZpcnR1YWxpemF0aW9uIFRlYW0gfEFNRA0KDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ2hyaXN0aWFuIEs/bmlnDQpTZW50OiBUdWVzZGF5LCBB
cHJpbCAyMSwgMjAyMCA3OjUyIFBNDQpUbzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPjsg
S29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFRhbywgWWludGlh
biA8WWludGlhbi5UYW9AYW1kLmNvbT47IEhlLCBKYWNvYiA8SmFjb2IuSGVAYW1kLmNvbT47IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3UsIEZyYW5zIDxGcmFucy5HdUBhbWQu
Y29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogY2xlYW51cCBTUE0gVk1JRCB1
cGRhdGUNCg0KSGkgTW9uaywNCg0KYXQgbGVhc3Qgb24gVmVnYSB0aGF0IHNob3VsZCBiZSBmaW5l
LiBJZiB0aGUgUkxDIHNob3VsZCB1c2UgYW55dGhpbmcgZWxzZSB0aGFuIDAgaGVyZSB3ZSBzaG91
bGQgdXBkYXRlIHRoYXQgdG9nZXRoZXIgd2l0aCB0aGUgVk1JRC4NCg0KUmVnYXJkcywNCkNocmlz
dGlhbi4NCg0KQW0gMjEuMDQuMjAgdW0gMTE6NTQgc2NocmllYiBMaXUsIE1vbms6DQo+Pj4+IENv
dWxkIG9ubHkgYmUgdGhhdCB0aGUgZmlybXdhcmUgdXBkYXRlcyB0aGUgYml0cyB0byBzb21ldGhp
bmcgbm9uIGRlZmF1bHQsIEknbSBnb2luZyB0byBkb3VibGUgY2hlY2sgdGhhdCBvbiBhIFZlZ2Ex
MC4NCj4gSSB0aGluayB0aGF0IHdpbGwgYmUgYSBzdXJlIGFuc3dlciwgb3RoZXJ3aXNlIHdoeSB3
ZSBuZWVkIHRob3NlIGZpZWxkIGlmIHdlIGFsd2F5cyB3cml0ZSAwIHRvIHRoZW0gYW5kIHJlYWRl
ciBhbHdheXMgZXhwZWN0IDAgcmVhZGluZyBiYWNrIGZyb20gdGhlbSA/Pw0KPg0KPiBUaG9zZSBm
aWVsZHMgYXJlIGtpbmQgb2YgcGVyZm9ybWFuY2UgY291bnRlcnMNCj4NCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBNb25rIExpdXxHUFUgVmlydHVhbGl6YXRpb24g
VGVhbSB8QU1EDQo+DQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENo
cmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KPiBTZW50
OiBUdWVzZGF5LCBBcHJpbCAyMSwgMjAyMCA1OjUyIFBNDQo+IFRvOiBUYW8sIFlpbnRpYW4gPFlp
bnRpYW4uVGFvQGFtZC5jb20+OyBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+OyANCj4gSGUs
IEphY29iIDxKYWNvYi5IZUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IEd1LCBGcmFucyA8RnJhbnMuR3VAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gZHJtL2FtZGdwdTogY2xlYW51cCBTUE0gVk1JRCB1cGRhdGUNCj4NCj4gQW0gMjEuMDQuMjAg
dW0gMTE6NDUgc2NocmllYiBUYW8sIFlpbnRpYW46DQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBn
bWFpbC5jb20+DQo+PiBTZW50OiAyMDIw5bm0NOaciDIx5pelIDE3OjEwDQo+PiBUbzogTGl1LCBN
b25rIDxNb25rLkxpdUBhbWQuY29tPjsgVGFvLCBZaW50aWFuIDxZaW50aWFuLlRhb0BhbWQuY29t
PjsgDQo+PiBIZSwgSmFjb2IgPEphY29iLkhlQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPj4gQ2M6IEd1LCBGcmFucyA8RnJhbnMuR3VAYW1kLmNvbT4NCj4+IFN1Ympl
Y3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogY2xlYW51cCBTUE0gVk1JRCB1cGRhdGUNCj4+DQo+PiBU
aGUgUkxDIFNQTSBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIGNvbnRhaW5zIHRoZSBpbmZvcm1hdGlv
biBob3cgdGhlIG1lbW9yeSBhY2Nlc3MgaXMgbWFkZSAoVk1JRCwgTVRZUEUsIGV0Yy4uLi4pIHdo
aWNoIHNob3VsZCBhbHdheXMgYmUgY29uc2lzdGVudC4NCj4+DQo+PiBTbyBpbnN0ZWFkIG9mIGEg
cmVhZCBtb2RpZnkgd3JpdGUgY3ljbGUgb2YgdGhlIFZNSUQgYWx3YXlzIHVwZGF0ZSB0aGUgd2hv
bGUgcmVnaXN0ZXIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYyB8IDcgKy0tLS0tLSAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y3XzAuYyAgfCA3ICstLS0tLS0gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OF8wLmMgIHwgNyArLS0tLS0tICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jICB8IDcgKy0tLS0tLQ0KPj4gICAgNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDI0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYw0KPj4gaW5kZXggMGEwM2UyYWQ1ZDk1Li4yYTY1NTYzNzEwNDYgMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYw0KPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCj4+IEBAIC03MDMwLDEyICs3MDMw
LDcgQEAgc3RhdGljIGludA0KPj4gZ2Z4X3YxMF8wX3VwZGF0ZV9nZnhfY2xvY2tfZ2F0aW5nKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPj4gICAgDQo+PiAgICBzdGF0aWMgdm9pZCBnZnhf
djEwXzBfdXBkYXRlX3NwbV92bWlkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25l
ZCB2bWlkKSAgew0KPj4gLQl1MzIgZGF0YTsNCj4+IC0NCj4+IC0JZGF0YSA9IFJSRUczMl9TT0Mx
NShHQywgMCwgbW1STENfU1BNX01DX0NOVEwpOw0KPj4gLQ0KPj4gLQlkYXRhICY9IH5STENfU1BN
X01DX0NOVExfX1JMQ19TUE1fVk1JRF9NQVNLOw0KPj4gLQlkYXRhIHw9ICh2bWlkICYgUkxDX1NQ
TV9NQ19DTlRMX19STENfU1BNX1ZNSURfTUFTSykgPDwgUkxDX1NQTV9NQ19DTlRMX19STENfU1BN
X1ZNSURfX1NISUZUOw0KPj4gKwl1MzIgZGF0YSA9IFJFR19TRVRfRklFTEQoMCwgUkxDX1NQTV9N
Q19DTlRMLCBSTENfU1BNX1ZNSUQsIHZtaWQpOw0KPj4gW3l0dGFvXTogVGhlIG9yaWdfdmFsIGlz
IDAgd2hpY2ggbWVhbnMgZXhjZXB0IFZNSUQgZmllbGQgb3RoZXIgcmVzZXQgZmllbGRzIHdpbGwg
YmUgc2V0IHRvIDAuIFdoZXRoZXIgaXQgaXMgbGVnYWw/DQo+IEFjY29yZGluZyB0byB0aGUgcmVn
aXN0ZXIgc3BlY2lmaWNhdGlvbiB0aGF0IGlzIHRoZSBkZWZhdWx0IHZhbHVlIGZvciB0aG9zZSBi
aXRzIG9uIGdmeDkvMTAuDQo+DQo+IENvdWxkIG9ubHkgYmUgdGhhdCB0aGUgZmlybXdhcmUgdXBk
YXRlcyB0aGUgYml0cyB0byBzb21ldGhpbmcgbm9uIGRlZmF1bHQsIEknbSBnb2luZyB0byBkb3Vi
bGUgY2hlY2sgdGhhdCBvbiBhIFZlZ2ExMC4NCj4NCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0K
Pg0KPj4gICAgDQo+PiAgICAJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVJMQ19TUE1fTUNfQ05UTCwg
ZGF0YSk7ICB9IGRpZmYgLS1naXQgDQo+PiBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92N18wLmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYw0KPj4g
aW5kZXggYjJmMTBlMzllZmYxLi5hOTI0ODZjZDAzOGYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjdfMC5jDQo+PiBAQCAtMzU3MCwxMiArMzU3MCw3IEBAIHN0YXRpYyBp
bnQgZ2Z4X3Y3XzBfcmxjX3Jlc3VtZShzdHJ1Y3QgDQo+PiBhbWRncHVfZGV2aWNlICphZGV2KQ0K
Pj4gICAgDQo+PiAgICBzdGF0aWMgdm9pZCBnZnhfdjdfMF91cGRhdGVfc3BtX3ZtaWQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVuc2lnbmVkIHZtaWQpICB7DQo+PiAtCXUzMiBkYXRhOw0K
Pj4gLQ0KPj4gLQlkYXRhID0gUlJFRzMyKG1tUkxDX1NQTV9WTUlEKTsNCj4+IC0NCj4+IC0JZGF0
YSAmPSB+UkxDX1NQTV9WTUlEX19STENfU1BNX1ZNSURfTUFTSzsNCj4+IC0JZGF0YSB8PSAodm1p
ZCAmIFJMQ19TUE1fVk1JRF9fUkxDX1NQTV9WTUlEX01BU0spIDw8IFJMQ19TUE1fVk1JRF9fUkxD
X1NQTV9WTUlEX19TSElGVDsNCj4+ICsJdTMyIGRhdGEgPSBSRUdfU0VUX0ZJRUxEKDAsIFJMQ19T
UE1fVk1JRCwgUkxDX1NQTV9WTUlELCB2bWlkKTsNCj4+ICAgIA0KPj4gICAgCVdSRUczMihtbVJM
Q19TUE1fVk1JRCwgZGF0YSk7DQo+PiAgICB9DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjhfMC5jDQo+PiBpbmRleCBmYzZjMmYyYmM3NmMuLjQ0ZmRkYTY4ZGI5OCAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMNCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMNCj4+IEBAIC01NjEzLDEyICs1
NjEzLDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y4XzBfdW5zZXRfc2FmZV9tb2RlKHN0cnVjdCANCj4+
IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+PiAgICANCj4+ICAgIHN0YXRpYyB2b2lkIGdmeF92OF8w
X3VwZGF0ZV9zcG1fdm1pZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgdm1p
ZCkgIHsNCj4+IC0JdTMyIGRhdGE7DQo+PiAtDQo+PiAtCWRhdGEgPSBSUkVHMzIobW1STENfU1BN
X1ZNSUQpOw0KPj4gLQ0KPj4gLQlkYXRhICY9IH5STENfU1BNX1ZNSURfX1JMQ19TUE1fVk1JRF9N
QVNLOw0KPj4gLQlkYXRhIHw9ICh2bWlkICYgUkxDX1NQTV9WTUlEX19STENfU1BNX1ZNSURfTUFT
SykgPDwgUkxDX1NQTV9WTUlEX19STENfU1BNX1ZNSURfX1NISUZUOw0KPj4gKwl1MzIgZGF0YSA9
IFJFR19TRVRfRklFTEQoMCwgUkxDX1NQTV9WTUlELCBSTENfU1BNX1ZNSUQsIHZtaWQpOw0KPj4g
ICAgDQo+PiAgICAJV1JFRzMyKG1tUkxDX1NQTV9WTUlELCBkYXRhKTsNCj4+ICAgIH0NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4+IGluZGV4IDU0ZWRlZDlhNmFj
NS4uYjM2ZmJmOTkxMzEzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5
XzAuYw0KPj4gQEAgLTQ5NTAsMTIgKzQ5NTAsNyBAQCBzdGF0aWMgaW50DQo+PiBnZnhfdjlfMF91
cGRhdGVfZ2Z4X2Nsb2NrX2dhdGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+ICAg
IA0KPj4gICAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfdXBkYXRlX3NwbV92bWlkKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCB2bWlkKSAgew0KPj4gLQl1MzIgZGF0YTsNCj4+IC0N
Cj4+IC0JZGF0YSA9IFJSRUczMl9TT0MxNShHQywgMCwgbW1STENfU1BNX01DX0NOVEwpOw0KPj4g
LQ0KPj4gLQlkYXRhICY9IH5STENfU1BNX01DX0NOVExfX1JMQ19TUE1fVk1JRF9NQVNLOw0KPj4g
LQlkYXRhIHw9ICh2bWlkICYgUkxDX1NQTV9NQ19DTlRMX19STENfU1BNX1ZNSURfTUFTSykgPDwg
UkxDX1NQTV9NQ19DTlRMX19STENfU1BNX1ZNSURfX1NISUZUOw0KPj4gKwl1MzIgZGF0YSA9IFJF
R19TRVRfRklFTEQoMCwgUkxDX1NQTV9NQ19DTlRMLCBSTENfU1BNX1ZNSUQsIHZtaWQpOw0KPj4g
ICAgDQo+PiAgICAJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVJMQ19TUE1fTUNfQ05UTCwgZGF0YSk7
ICB9DQo+PiAtLQ0KPj4gMi4xNy4xDQo+Pg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9u
Lm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0DQo+IHMuZnJlZWRlc2t0b3Aub3Jn
JTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wMiU3QzAxJTdDbW8NCj4g
bmsubGl1JTQwYW1kLmNvbSU3QzJlZmEyNTQxYTU2ZjQ3MTZiOWJkMDhkN2U1ZWE2MzBkJTdDM2Rk
ODk2MWZlNDg4NGU2MA0KPiA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcyMzA2NjcxNTg5
NjA4MTImYW1wO3NkYXRhPXVvSEl1ZkF0U0Z6Q2Y0DQo+IFA4VnB4d0JpMCUyQnlkZElhMFFWdzMy
VzNaQ0pBbWslM0QmYW1wO3Jlc2VydmVkPTANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRs
b29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1h
biUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wMiU3QzAxJTdDbW9uay5saXUlNDBhbWQu
Y29tJTdDMmVmYTI1NDFhNTZmNDcxNmI5YmQwOGQ3ZTVlYTYzMGQlN0MzZGQ4OTYxZmU0ODg0ZTYw
OGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MjMwNjY3MTU4OTYwODEyJmFtcDtzZGF0YT11
b0hJdWZBdFNGekNmNFA4VnB4d0JpMCUyQnlkZElhMFFWdzMyVzNaQ0pBbWslM0QmYW1wO3Jlc2Vy
dmVkPTANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
