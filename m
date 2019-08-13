Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9DD8AD28
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 05:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F286C6E619;
	Tue, 13 Aug 2019 03:38:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740081.outbound.protection.outlook.com [40.107.74.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E87B6E619
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 03:38:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aw8AahPf2ziWDlNyOLkxyPwkNG69doEvs5Rxkafbm7h2q5tU/kE6LwcoNDSF784hWKSeJVu92UyyLJ8Ve2lcnp1zupg4BrSYH+5+KEChBj+WihX7/fVdbcMq7hO4dhk09MEihIK/Cv0puXDil2YKFinvPzMZiLEjhokBuyKETqE7YwnXqwFtb1dtUes6qvfsi/948ZAsAUXNLsuQGhcIX43lSRg8NYNQsOS8duOxykP7ZVIDguz16TErLG93fwrO09A4DeVQOLQYP//hlXQdSNSSutjiPXlQSzHJLFrqUSK4hGrtMtLlovue+yTuiSYYhVU4427uOSNJbHn9qPcyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nz05vTjy4N6Ll56UOq8khXyAZIAgNDT795qkbFTwiRk=;
 b=VpbNSqWNkAZk8hhTAhniWZn0PNvr6W8gT4o0y3OmERyH1sDa98k8l7FAYiJxW+RBsPumgLBFQFYYCP2HY6yXtGWSBXhLc7sr4F8weiKMlyIo93q7zquODgPj32ceNKM3AdahwmMbRTVYcH6h2W2veWf00VSO/8DS4DKdI1ic5lhTpjtIArtYUwE1efyvYeYINmq/gdlU2A8ZT9l9AZOJGCwsIBZrefHh5Ppc/oyrOWlXw/V2eaVtWYB3rXKbU0phJ+oiSdaNduuQqUE+2uZFpOVEt3o0ckytCf5mt89RNRYVyMwlrEOlfkx7HCIF2cW3VlchIshuHdwFiwfRrD03Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2861.namprd12.prod.outlook.com (20.179.81.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Tue, 13 Aug 2019 03:38:28 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2157.011; Tue, 13 Aug 2019
 03:38:28 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, dl.srdc_lnx_nv10
 <dl.srdc_lnx_nv10@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: fix message of SetHardMinByFreq failed
 when feature is disabled
Thread-Topic: [PATCH] drm/amd/powerplay: fix message of SetHardMinByFreq
 failed when feature is disabled
Thread-Index: AQHVUX+Uhc4UEmlSG0m/A3GeFpkTLqb4bgsQ
Date: Tue, 13 Aug 2019 03:38:28 +0000
Message-ID: <MN2PR12MB3344F707640F4E656C27191DE4D20@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190813023347.8666-1-kevin1.wang@amd.com>
In-Reply-To: <20190813023347.8666-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2915c45-4758-44d1-9613-08d71f9fb47f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2861; 
x-ms-traffictypediagnostic: MN2PR12MB2861:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2861C01D63FB16063AC4A3B3E4D20@MN2PR12MB2861.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6029001)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(199004)(13464003)(189003)(15650500001)(66446008)(66476007)(5660300002)(66946007)(74316002)(446003)(66556008)(6636002)(33656002)(64756008)(8676002)(476003)(52536014)(2906002)(305945005)(256004)(11346002)(6306002)(316002)(6436002)(9686003)(229853002)(110136005)(7736002)(99286004)(8936002)(55016002)(54906003)(14444005)(486006)(6246003)(53936002)(3846002)(86362001)(14454004)(66066001)(186003)(76176011)(6506007)(102836004)(7696005)(966005)(53546011)(478600001)(81156014)(81166006)(6116002)(71200400001)(71190400001)(76116006)(25786009)(26005)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2861;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NLjpOHaqInbt8RgDmQJGhOob+ZM+K6zsvjJ9SIKWeLPhyLZEJ/ZzWjYMDuqorh5YjDccBDhZa5W+WwUUXUUMsCSLYVGuc/aDn89EF2EVwxr4zIZgE/CzTrPCRuTj6EuziXsNNbYOcqkGXWZbZ36qiK9qiSZJyUxMpOzC8lbeUsH9+1n7os1FIKY/MNsOLzcajpQCOeGx1SxkGI5Ic4yfITwHYQHoaTdNQvRNqVGUO7JVNfdndT6+DXYVRoQ9/mhLPxJnwhkp1UmW6VecnJ3OVkv4fQRLwXPLH4vtxntp36uKYtDjGr2Sr4TBaJ/bp7HrhEmsh9qdoTTev/IIZCxz6zxC1sEueqDw5liJsXy5wwVCAgEiefunitkrLgsBZC5smMGkhG/kNwDl8wiursrrZ46rR55CzV5GnJCYcHpyKdQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2915c45-4758-44d1-9613-08d71f9fb47f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 03:38:28.2807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3QZeK8eYxhJvBIdLQ/H2V+o/2NT5hojThP26nST+G6gT9MVOt0kNVCK6psij19qi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2861
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nz05vTjy4N6Ll56UOq8khXyAZIAgNDT795qkbFTwiRk=;
 b=DynxtCbnXHFdqeIzVqBA0Ac8rDDM47db/2AYAvr4B272+jwnKE22uQYEgBAFKHuPWoS2UDRe1CAJaf+VzFxPvwpoElaMw9JDDlrrzEQdC+whW2G+PJJ83zMzWhimRjFuLGMTIbiB0rNYrRHogZOMYFEZFcSXrTN+cAbX8tghUPg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IFdhbmcsIEtldmluKFlhbmcpDQo+IFNl
bnQ6IFR1ZXNkYXksIEF1Z3VzdCAxMywgMjAxOSAxMDozNCBBTQ0KPiBUbzogZGwuc3JkY19sbnhf
bnYxMCA8ZGwuc3JkY19sbnhfbnYxMEBhbWQuY29tPg0KPiBDYzogV2FuZywgS2V2aW4oWWFuZykg
PEtldmluMS5XYW5nQGFtZC5jb20+OyBIdWFuZywgUmF5DQo+IDxSYXkuSHVhbmdAYW1kLmNvbT47
IEZlbmcsIEtlbm5ldGggPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgYW1kLQ0KPiBnZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IGZp
eCBtZXNzYWdlIG9mIFNldEhhcmRNaW5CeUZyZXENCj4gZmFpbGVkIHdoZW4gZmVhdHVyZSBpcyBk
aXNhYmxlZA0KPiANCj4gdGhlIGRpcmVjdCBzZW5kIG1lc3NhZ2UgdG8gc21jIHRvIHNldCBoYXJk
IGNsb2tjIHdpbGwgZmFpbGVkDQo+IHdoZW4gc21jIGNsb2NrIGRwbSBmZWF0dXJlIGlzIGRpc2Fi
bGVkLg0KPiBzbyB1c2UgZnVuY3Rpb24gb2Ygc211X3NldF9oYXJkX2ZyZXFfcmFuZ2UgdG8gcmVw
bGFjZSBpdC4NCj4gdGhlIGZ1bmN0aW9uIHdpbGwgY2hlY2sgZmVhdHVyZSBlbmFibGVtZW50Lg0K
PiANCj4gZWc6IHdoZW4gdWNsayAobWNsaykgZHBtIGZlYXR1cmUgaXMgZGlzYWJsZWQgb24gbmF2
aTEwDQo+IFvCoCAzMDAuNjc1OTAxXSBhbWRncHU6IFtwb3dlcnBsYXldIGZhaWxlZCBzZW5kIG1l
c3NhZ2U6DQo+IFNldEhhcmRNaW5CeUZyZXEoMjgpDQo+IMKgwqAgcGFyYW06IDB4MDAwMjAwNjQg
cmVzcG9uc2UgMHhmZmZmZmZmYg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2
aW4xLndhbmdAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfdjExXzAuYyB8IDEwICstLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdV92MTFfMC5jDQo+IGluZGV4IDNhMDgxYWNkZjFhOC4uM2E0OWNhYmY3MjZmIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KPiBAQCAt
MTMwNiwxNiArMTMwNiw4IEBAIHNtdV92MTFfMF9kaXNwbGF5X2Nsb2NrX3ZvbHRhZ2VfcmVxdWVz
dChzdHJ1Y3QNCj4gc211X2NvbnRleHQgKnNtdSwNCj4gIAkJaWYgKGNsa19zZWxlY3QgPT0gU01V
X1VDTEsgJiYgc211LT5kaXNhYmxlX3VjbGtfc3dpdGNoKQ0KPiAgCQkJcmV0dXJuIDA7DQo+IA0K
PiAtCQljbGtfaWQgPSBzbXVfY2xrX2dldF9pbmRleChzbXUsIGNsa19zZWxlY3QpOw0KPiAtCQlp
ZiAoY2xrX2lkIDwgMCkgew0KPiAtCQkJcmV0ID0gLUVJTlZBTDsNCj4gLQkJCWdvdG8gZmFpbGVk
Ow0KPiAtCQl9DQo+IC0NCj4gLQ0KPiAgCQltdXRleF9sb2NrKCZzbXUtPm11dGV4KTsNCj4gLQkJ
cmV0ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwNCj4gU01VX01TR19TZXRIYXJk
TWluQnlGcmVxLA0KPiAtCQkJKGNsa19pZCA8PCAxNikgfCBjbGtfZnJlcSk7DQo+ICsJCXJldCA9
IHNtdV9zZXRfaGFyZF9mcmVxX3JhbmdlKHNtdSwgY2xrX3NlbGVjdCwgMCwgY2xrX2ZyZXEpOw0K
PiAgCQltdXRleF91bmxvY2soJnNtdS0+bXV0ZXgpOw0KPiANCj4gIAkJaWYoY2xrX3NlbGVjdCA9
PSBTTVVfVUNMSykNCj4gLS0NCj4gMi4yMi4wDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
