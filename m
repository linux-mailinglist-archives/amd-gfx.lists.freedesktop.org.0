Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA2C07E9
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 16:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8D36EF07;
	Fri, 27 Sep 2019 14:49:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780053.outbound.protection.outlook.com [40.107.78.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B766EF07
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 14:49:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIbWZSuDpoZfJ2jB6Vxr4usquXdZDi4Y8IsFhkcbbbaJWAkvF6ne1NgytoBHwA/Yw/AzGMg9eUo57uZGaJK/75O2fAtX59OOJH+ViFkW8VkYxvaE2cvrzNcespEf37QM9OAbA0JNVIVfprZGBfQZvPo6vMZ381Xn/YjwQXD81VVcf6BLWFswBGeM+Xregae6RnEdjzm8gbzDQ97nRXWlDQm8Kzna0qxLMquX8vYLusfSvnRWuvw6juAob7pf8K65nuggS8+AtV6sB1yy6+sWM3MLC0TT2vcIVjd/qTd3062d0b0iKkjAoTofkjTdv9e33g4AuSTkMKbSWLUQGOY1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9l+MyM9Cr8LzgJmzLzcoBkbxxBHzvZEX19RI+Mdykrg=;
 b=OKzABJEWfYzC5PD4bFehsa60YvICgEbXVij3PT7RO1g1UdviTkd/ZUx4zFPUZMe0bdV30DVuG0mAxk3EHYIFf2fhk6aINlVL6VgaLe9u9VC5BWoIbjqI7MoxR2OyBZFQGvK4Pe1SwF04iV37RBgwhEKgH599lOgdYyLzxOhJR37TR+L/9YDUFSAPZpBX6TG5anulnLnoUP3WZgRpMx5ra9AepVZHLjgtlSfTBFtL0m/sO6VdFLbIohLnvNoE5nWqjXEpuJgJzc3cvEpFRYLFvHpcOU6bDpzUzZf6gO7o1bVnPL8utE1D13oXYhTyEZWEZZPX5jIXwB0qoBs1ZmXwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) by
 MN2PR12MB3999.namprd12.prod.outlook.com (10.255.239.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Fri, 27 Sep 2019 14:49:04 +0000
Received: from MN2PR12MB2911.namprd12.prod.outlook.com
 ([fe80::c8cf:fab8:48c1:8cee]) by MN2PR12MB2911.namprd12.prod.outlook.com
 ([fe80::c8cf:fab8:48c1:8cee%7]) with mapi id 15.20.2284.028; Fri, 27 Sep 2019
 14:49:04 +0000
From: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Liang, Prike"
 <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: fix kgd2kfd_device_init() definition conflict
 error
Thread-Topic: [PATCH] drm/amdkfd: fix kgd2kfd_device_init() definition
 conflict error
Thread-Index: AQHVdOy5Gdeati0HikqkW7SHta/wu6c/kw6AgAAHCfA=
Date: Fri, 27 Sep 2019 14:49:04 +0000
Message-ID: <MN2PR12MB2911B358339AF86E955FD7E88C810@MN2PR12MB2911.namprd12.prod.outlook.com>
References: <1569558805-30951-1-git-send-email-Prike.Liang@amd.com>
 <c7587938-62b1-e050-5d0f-073f94827e51@amd.com>
In-Reply-To: <c7587938-62b1-e050-5d0f-073f94827e51@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:3c60:3bc1:ff:6afc:4296:b9f6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 499f2ec0-af3a-4bd2-cfd1-08d74359d7a0
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3999:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3999C98589ADC462234E28648C810@MN2PR12MB3999.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(199004)(189003)(13464003)(229853002)(25786009)(52536014)(186003)(7736002)(74316002)(46003)(486006)(476003)(71200400001)(446003)(2906002)(53546011)(6506007)(14454004)(86362001)(76176011)(71190400001)(11346002)(99286004)(7696005)(33656002)(110136005)(305945005)(478600001)(6116002)(66476007)(66556008)(102836004)(66946007)(66446008)(64756008)(316002)(6246003)(8936002)(2501003)(76116006)(8676002)(55016002)(81156014)(81166006)(4326008)(9686003)(14444005)(5660300002)(256004)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3999;
 H:MN2PR12MB2911.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qqEWsRJ8IrtvEOoLTQi2HtBD9wciu3UcCFOi20C+f727q7Ht6UhyKCeDF9csUMMLTibwIP7+iucWMEJwRhu3aU1fNf3zEJ4PxXC5a4YAYPsLgK86fDik8NJBHuZ2lz+RVeO6oVqSaapr1F11Am7lPDKLGnX/pHDusiqCM/lleKWoCDXprHnk7F/RnaW2q3p1f/QKqrlKloMEbDsRRh3GyUZs9vL7XZPh1QmAMCVLfAWJ4zWz4+nKXkJKi8bSCeVHNFO7BWNp99kCUPYSGZwD+RstrollmA4RMi2cE7yUo3IdPUvRsNkHLOJpyo53C236wUtkNKfvJnGe5OoU2NPJVbvmOa1/e6mjfu1tLcf5jCpKsYhXDVZutwIESXbuMjHI30Cj2NMoAsvyBMLDcrsAsQ1rrGpuNuaos0vswtFRkUw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499f2ec0-af3a-4bd2-cfd1-08d74359d7a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 14:49:04.3955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gL2+E6D4Ncn1jcd8nyKt+8fmFlZpes/aO311gSFB05mhk3B5TeI9Zcrx2a5sGgzE32614UoJX9PYHJWDEIjhPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9l+MyM9Cr8LzgJmzLzcoBkbxxBHzvZEX19RI+Mdykrg=;
 b=MqsygLJGc5iLnzlIhlsUyiGBqNhjbRL23o++Gcz2u42CFjfvzhJtKzHVZ+FPAejTpZD4JYFnHm2IEHsaqIN9kXivtxXtGsv/++KK7EDh9E9qEDODY2q8CEpbLa3QMUaWIaDoyQuXPg3S0jSCgawyQDtKx7wcVSJwEl/paCIWUs8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harish.Kasiviswanathan@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U29ycnkgbWlzc2VkIGl0IHRvby4gVGhhbmtzIGZvciBmaXhpbmcgaXQuDQoNCkJlc3QgUmVnYXJk
cywNCkhhcmlzaA0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLdWVobGlu
ZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+IA0KU2VudDogRnJpZGF5LCBTZXB0ZW1i
ZXIgMjcsIDIwMTkgMTA6MTkgQU0NClRvOiBMaWFuZywgUHJpa2UgPFByaWtlLkxpYW5nQGFtZC5j
b20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEthc2l2aXN3YW5hdGhhbiwg
SGFyaXNoIDxIYXJpc2guS2FzaXZpc3dhbmF0aGFuQGFtZC5jb20+OyBIdWFuZywgUmF5IDxSYXku
SHVhbmdAYW1kLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRrZmQ6IGZpeCBrZ2Qy
a2ZkX2RldmljZV9pbml0KCkgZGVmaW5pdGlvbiBjb25mbGljdCBlcnJvcg0KDQpPbiAyMDE5LTA5
LTI3IDA6MzMsIExpYW5nLCBQcmlrZSB3cm90ZToNCj4gVGhlIHBhdGNoIGM2NzA3MDcgZHJtL2Ft
ZDogUGFzcyBkcm1fZGV2aWNlIHRvIGtmZCBpbnRyb2R1Y2VkIHRoaXMgaXNzdWUgYW5kDQo+IGZp
eCB0aGUgZm9sbG93aW5nIGNvbXBpbGVyIGVycm9yLg0KPg0KPiAgICBDQyBbTV0gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1Ly8uLi9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLm8NCj4g
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvL2FtZGdwdV9hbWRrZmQuYzo3NDY6NjogZXJyb3I6
IGNvbmZsaWN0aW5nIHR5cGVzIGZvciDigJhrZ2Qya2ZkX2RldmljZV9pbml04oCZDQo+ICAgYm9v
bCBrZ2Qya2ZkX2RldmljZV9pbml0KHN0cnVjdCBrZmRfZGV2ICprZmQsDQo+ICAgICAgICBeDQo+
IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8vYW1kZ3B1
X2FtZGtmZC5jOjIzOjA6DQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly9hbWRncHVfYW1k
a2ZkLmg6MjUzOjY6IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKAmGtnZDJrZmRfZGV2
aWNlX2luaXTigJkgd2FzIGhlcmUNCj4gICBib29sIGtnZDJrZmRfZGV2aWNlX2luaXQoc3RydWN0
IGtmZF9kZXYgKmtmZCwNCj4gICAgICAgIF4NCj4gc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNzM6
IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8vYW1kZ3B1X2Ft
ZGtmZC5vJyBmYWlsZWQNCj4gbWFrZVsxXTogKioqIFtkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS8vYW1kZ3B1X2FtZGtmZC5vXSBFcnJvciAxDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFByaWtlIExp
YW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPg0KDQpUaGlzIGZpeCBpcyBmb3IgdGhlIGNhc2UgdGhh
dCBDT05GSUdfSFNBX0FNRCBpcyBkaXNhYmxlZC4gU29ycnkgZm9yIA0KbWlzc2luZyB0aGF0IHdo
ZW4gcmV2aWV3aW5nIEhhcmlzaCdzIGNvZGUuDQoNClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGlu
ZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZC5jDQo+IGluZGV4IDIyMTA0N2QuLjkyNjY2YjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMNCj4gQEAgLTc0NCw2ICs3NDQsNyBAQCBzdHJ1
Y3Qga2ZkX2RldiAqa2dkMmtmZF9wcm9iZShzdHJ1Y3Qga2dkX2RldiAqa2dkLCBzdHJ1Y3QgcGNp
X2RldiAqcGRldiwNCj4gICB9DQo+ICAgDQo+ICAgYm9vbCBrZ2Qya2ZkX2RldmljZV9pbml0KHN0
cnVjdCBrZmRfZGV2ICprZmQsDQo+ICsJCQkgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYsDQo+ICAg
CQkJIGNvbnN0IHN0cnVjdCBrZ2Qya2ZkX3NoYXJlZF9yZXNvdXJjZXMgKmdwdV9yZXNvdXJjZXMp
DQo+ICAgew0KPiAgIAlyZXR1cm4gZmFsc2U7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
