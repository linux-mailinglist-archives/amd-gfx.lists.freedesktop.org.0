Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437FDD8CA9
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 11:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15A86E909;
	Wed, 16 Oct 2019 09:38:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740080.outbound.protection.outlook.com [40.107.74.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A346E909
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 09:38:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpxjCDR2kRPZrcmvPHdZbvWGHBlRtLqPJieHlHJvtBX14n1BHPPVgWblI0PXZ+lWZbwQUJwUeSp1a8jC25G9xx9a9VJXzQtnylI+EEiT8AAfaicyMbIpi03+sy/9/HsCNrOzccNLRZaFgUeBkKo0CyakU6O2hkS6AsjsXZdokDZ/LHoLhndQG8fNO+2aw7f4xWCDvr5no3uTqvHdXplpxnO0Cc6wC3AAXiEkJGXmMSUhYwIekLdgOE++xkj0RuChoM8KuRvqzKq4t52IP+jMM90DKpmsJ1qnixpiKizsrPILyLwv7dLUuGsc5q7C19lLcSwU/pKGLIBw1wP6M7RLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hhmn6SGva1sh7Q5sIdNfOl5FaJ5U6NKMWwDkfLYv7x8=;
 b=IfXdBceHZTPlg4Q4DycETwwzyc40fn8tR0EJP8XNjhriqw7LqQHIf65hjd2vABKHD0q6A3nS3W/nd/TDggdo7QF33FIVDIunmRGca21uA139AcuxGCfBBfSnf5lEZ2vVIyFO4S9UX2caFFLh1aoDSMu7cn23tUsaXLNlOKqhuTb3OW03l+Ob4USPRpgjA5ugG5CJOMejZ1YbQ64oZ+mX/oe4ntcbFjaaqcNQZ5+3qf04H4K/qdWJIj0EuxJarhlfWngalUUl52hLmJ+98hKwEDWq1F/Q3EyC8u/Mud+wd5g5USRkNZZnyEGuIZuJTXwM0j6KZXwkqq9sb5QwsQ0K4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3246.namprd12.prod.outlook.com (20.179.81.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 09:38:40 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d%5]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 09:38:40 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/powerplay: implement interface
 pp_power_profile_mode
Thread-Topic: [PATCH] drm/amdgpu/powerplay: implement interface
 pp_power_profile_mode
Thread-Index: AQHVg/sb7yrg+xOrbkSyVUPY/J9tsqddAvTg
Date: Wed, 16 Oct 2019 09:38:39 +0000
Message-ID: <MN2PR12MB33443373E9DD3168DDB98D5CE4920@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1571214251-410-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1571214251-410-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f260b2c0-a0a8-4f0b-10ab-08d7521ca08d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3246:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3246BD562E79EB75599EA217E4920@MN2PR12MB3246.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:901;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(189003)(199004)(13464003)(3846002)(229853002)(446003)(8936002)(11346002)(9686003)(55016002)(5660300002)(6116002)(14454004)(71200400001)(52536014)(71190400001)(478600001)(76176011)(66556008)(66946007)(186003)(2906002)(6436002)(4326008)(256004)(33656002)(305945005)(66446008)(6506007)(81156014)(26005)(81166006)(8676002)(66476007)(74316002)(25786009)(86362001)(6246003)(66066001)(7736002)(486006)(53546011)(316002)(64756008)(7696005)(102836004)(2501003)(110136005)(99286004)(476003)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3246;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P1JBFTVywxh2xlDGEzz6Q2IWjoH1PE2r8U9a7+r/IOnCrwmCsW4DzWZq65xVCaYjiJLrF2rbrXTFHcABP4+LRslcxEsg55gnRKBGtOLeYxX7u41LVYUZ8iSnOYA0jHjBTBLFSr05RKDM6PDj7HEUg7gZxBlHxm5nrqlHdOs6u6Heq05x8lCkYXGQJrb0bfzZZ95Q09aBumPLHDmYOVCxlBspDJmYolh28CkeMvZv9hsVPB9rP55FQKyigz0b8gDQ72b7DoxONaXyv2GI03k6e1CuUAy/O7BXsn2lK/rueiQhF5G7I7NAFRSKMus2OmJEzpWwC35lQAFOIXTtpdHtFExSnvhL1SRba2VRlzz4ioHS1Mkor/mg1HG3VW8aXGBauY2HZKQlWlFNIYmfgPaayieakKl9ZXgZUT1Xwjgwpvo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f260b2c0-a0a8-4f0b-10ab-08d7521ca08d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 09:38:40.0656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4JRUKVoWrx15KxQZuYISKRMz0v5QxAYf3fi56RM9xy28eeSWDlJna2Ipypgvz3jI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3246
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hhmn6SGva1sh7Q5sIdNfOl5FaJ5U6NKMWwDkfLYv7x8=;
 b=RoisgU5z91hW5r1GJ7jtnB+Xq9JMFeagtA17MwHLQ0tlUgQqce/bP7CL77ITke7fEvZ4EKQVXpmEUMf8K998SMl3VVXiSuc5Gcmu4KISoU0144Xb2veNkgKBqxjEv6xkqxva9YGt4rtZQGGCqtTw+vcUEly1T8heAqwym1MVn78=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGlhbmcsIFByaWtlIDxQcmlrZS5MaWFuZ0BhbWQu
Y29tPg0KPiBTZW50OiAyMDE55bm0MTDmnIgxNuaXpSAxNjoyNA0KPiBUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsg
SHVhbmcsIFJheQ0KPiA8UmF5Lkh1YW5nQGFtZC5jb20+OyBMaWFuZywgUHJpa2UgPFByaWtlLkxp
YW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdS9wb3dlcnBsYXk6IGlt
cGxlbWVudCBpbnRlcmZhY2UNCj4gcHBfcG93ZXJfcHJvZmlsZV9tb2RlDQo+IA0KPiBpbXBsZW1l
bnQgZ2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZSBmb3IgZ2V0dGluZyBwb3dlciBwcm9maWxlIG1vZGUg
c3RhdHVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFt
ZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3Bw
dC5jIHwgMzQNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMzQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3Jlbm9pcl9wcHQuYw0KPiBpbmRleCBmYTMxNGMyLi45NTNlMzQ3IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jDQo+IEBAIC02NDAsNiAr
NjQwLDM5IEBAIHN0YXRpYyBpbnQgcmVub2lyX3NldF93YXRlcm1hcmtzX3RhYmxlKA0KPiAgCXJl
dHVybiByZXQ7DQo+ICB9DQo+IA0KPiArc3RhdGljIGludCByZW5vaXJfZ2V0X3Bvd2VyX3Byb2Zp
bGVfbW9kZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCj4gKwkJCQkJICAgY2hhciAqYnVmKQ0K
PiArew0KPiArCXN0YXRpYyBjb25zdCBjaGFyICpwcm9maWxlX25hbWVbXSA9IHsNCj4gKwkJCQkJ
IkJPT1RVUF9ERUZBVUxUIiwNCj4gKwkJCQkJIjNEX0ZVTExfU0NSRUVOIiwNCj4gKwkJCQkJIlBP
V0VSX1NBVklORyIsDQo+ICsJCQkJCSJWSURFTyIsDQo+ICsJCQkJCSJWUiIsDQo+ICsJCQkJCSJD
T01QVVRFIiwNCj4gKwkJCQkJIkNVU1RPTSJ9Ow0KPiArCXVpbnQzMl90IGksIHNpemUgPSAwOw0K
PiArCWludDE2X3Qgd29ya2xvYWRfdHlwZSA9IDA7DQo+ICsNCj4gKwlpZiAoIXNtdS0+cG1fZW5h
YmxlZCB8fCAhYnVmKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCWZvciAoaSA9IDA7
IGkgPD0gUFBfU01DX1BPV0VSX1BST0ZJTEVfQ1VTVE9NOyBpKyspIHsNCj4gKwkJLyoNCj4gKwkJ
ICogQ29udiBQUF9TTUNfUE9XRVJfUFJPRklMRSogdG8NCj4gV09SS0xPQURfUFBMSUJfKl9CSVQN
Cj4gKwkJICogTm90IGFsbCBwcm9maWxlIG1vZGVzIGFyZSBzdXBwb3J0ZWQgb24gYXJjdHVydXMu
DQo+ICsJCSAqLw0KPiArCQl3b3JrbG9hZF90eXBlID0gc211X3dvcmtsb2FkX2dldF90eXBlKHNt
dSwgaSk7DQo+ICsJCWlmICh3b3JrbG9hZF90eXBlIDwgMCkNCj4gKwkJCWNvbnRpbnVlOw0KPiAr
DQo+ICsJCXNpemUgKz0gc3ByaW50ZihidWYgKyBzaXplLCAiJTJkICUxNHMlc1xuIiwNCj4gKwkJ
CWksIHByb2ZpbGVfbmFtZVtpXSwgKGkgPT0gc211LT5wb3dlcl9wcm9maWxlX21vZGUpID8NCj4g
IioiIDogIiAiKTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gc2l6ZTsNCj4gK30NCj4gKw0KPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHJlbm9pcl9wcHRfZnVuY3MgPSB7DQo+
ICAJLmdldF9zbXVfbXNnX2luZGV4ID0gcmVub2lyX2dldF9zbXVfbXNnX2luZGV4LA0KPiAgCS5n
ZXRfc211X3RhYmxlX2luZGV4ID0gcmVub2lyX2dldF9zbXVfdGFibGVfaW5kZXgsIEBAIC02NTgs
Ng0KPiArNjkxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHJlbm9pcl9w
cHRfZnVuY3MgPSB7DQo+ICAJLnNldF9wZXJmb3JtYW5jZV9sZXZlbCA9IHJlbm9pcl9zZXRfcGVy
Zm9ybWFuY2VfbGV2ZWwsDQo+ICAJLmdldF9kcG1fY2xvY2tfdGFibGUgPSByZW5vaXJfZ2V0X2Rw
bV9jbG9ja190YWJsZSwNCj4gIAkuc2V0X3dhdGVybWFya3NfdGFibGUgPSByZW5vaXJfc2V0X3dh
dGVybWFya3NfdGFibGUsDQo+ICsJLmdldF9wb3dlcl9wcm9maWxlX21vZGUgPSByZW5vaXJfZ2V0
X3Bvd2VyX3Byb2ZpbGVfbW9kZSwNCj4gIH07DQo+IA0KPiAgdm9pZCByZW5vaXJfc2V0X3BwdF9m
dW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkNCj4gLS0NCj4gMi43LjQNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
