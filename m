Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 304B0BFB4B
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 00:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CBE6EE15;
	Thu, 26 Sep 2019 22:21:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760054.outbound.protection.outlook.com [40.107.76.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EEE6EE15
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 22:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksGmx7ahBFmcNCB/jQRplLUrtDzoPMhfz9jdoB/VtAlUGsERGK/PDJSeaYTMoj9lPYIy1nTdSB+AuXqIXp3/MFt38RnUNyDdfeby3FF54lGxIoZkYzAm0Zh1WA4eV3munUGQ6HC5csOWaWWZUYw5hYPuklVwnp3SgBXp4EO2S8Fi/G+D/fadWqxjnL7AKlB85NFnD6ODNXXAy5AtNS2oq97ogFXYvJIadU7ZxL0kscBEf9dRFwjuzezpuZObbZXWFirXL3+2SIlgupY1JGHU2mP3HzdLeEqPUljth6CcaDFD6gQ53YSZz1y7fTvWiXFbvDJbydZfQfTN3cOUyMMFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCNRlPR9hIzBGKsa5gitSGFEMjUW685UGuJH+7B6cGk=;
 b=bJVSqnCa0wIR/OaQquLQVXGBSll6nR8hneG55enKxT8mNu8f4XoyBRpY1a3Gnyf/kdWd4rz9TpBkVVJRkGnnaw96VAq6B6Ti4gzXRShTvaeLEySr4oSEWAaUXAjd32weP5Yc5FDBP+qBQ2Orv4W/3duz9C2VKCyhk6d7yZxcx11iSF8TRnnpFFuYFvC0wvW5dMV+Ih/YkpxRoP0BpHVaHs6kSevsw+cl6H0y2eAhR73zR0gCTTdjAzCrMl/ystXOCPSRerpR3aQfpV3DwLtvpaGrjTTMU9z1zYgSqPIVicz2IJfR9ynsxxS4/gM54QdoDCw+iIPFgukJk5AmTS1T6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3497.namprd12.prod.outlook.com (20.178.199.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 22:21:04 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 22:21:04 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
 for non HWS mode
Thread-Topic: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
 for non HWS mode
Thread-Index: AQHVdLEqfaqrBCzjNUSyTJI1+qxGEac+e3SA///Dd4CAAEe9gIAAAVKA
Date: Thu, 26 Sep 2019 22:21:04 +0000
Message-ID: <883deafc-096c-ca1b-f454-7f32eeae7c1b@amd.com>
References: <20190926212640.28989-1-Yong.Zhao@amd.com>
 <d1129739-2f34-4bc3-96f7-a9a9c999313a@amd.com>
 <397a92e1-a5cc-0607-43c6-2922273a1459@amd.com>
 <02740fdf-0bfe-9f42-600f-aa4a491cdc46@amd.com>
In-Reply-To: <02740fdf-0bfe-9f42-600f-aa4a491cdc46@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::25) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2866483-55ca-43b1-aeff-08d742cfd1ee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3497; 
x-ms-traffictypediagnostic: DM6PR12MB3497:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB34975D066F745D20BF1DC0B3F0860@DM6PR12MB3497.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(189003)(199004)(486006)(99286004)(256004)(8936002)(446003)(2501003)(52116002)(229853002)(2616005)(31686004)(476003)(2906002)(186003)(36756003)(86362001)(14454004)(6486002)(66556008)(66446008)(64756008)(11346002)(6512007)(6436002)(66946007)(3846002)(6116002)(31696002)(66476007)(81166006)(316002)(25786009)(66066001)(5660300002)(71190400001)(71200400001)(7736002)(102836004)(8676002)(26005)(6246003)(81156014)(6506007)(386003)(53546011)(110136005)(478600001)(76176011)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3497;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jPykXeoTnbf6pudX7ae1VEGTsyPmy5e6Q0kGCnx87xzFs5b1iI25Woye+mGelaMSSnCBE4F3CYtEfk1T+gvwJLDtG8fM3/ZkSG5hWDLVI+GsI4hZevyYEAh1jGTX41k0FOrLpR4CG2j3znOiPCKdgiB9roy3459P+UV1DI4N8wExGtAUeYPhss936dvEhv49AePT6d4coYRAsQbN6YYufIiFc2tEL33HfF57Yz0XwmbihtaSakk9FpbIA4z/G39PPldHlOElSSfJ07UtnGRcN1aZegFzOpbOF0ZuLwB922JTusHigBwbdqIgLdESwCasDdbi9oGjyl2AKuxNI1lXSwA/zr7xEyGr9yINjqLfB7O8qzcbpeeuZ8rHCzd7bt8ChEn3eTjrfXKycykFIZuRAsoeQN3BsvvvL5Yq77lYc+k=
Content-ID: <B8C0CC8C17F31E4BA8F108A0938D15D9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2866483-55ca-43b1-aeff-08d742cfd1ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 22:21:04.6397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UsxoVr0G7RxgJh2eJxvtjNVNd9L9xnkShgvLuGwqv8PcIvPktKxXbOFEyw0UnFKB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3497
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCNRlPR9hIzBGKsa5gitSGFEMjUW685UGuJH+7B6cGk=;
 b=23PVT6VN2aANyckicIyUl8JOnCHCVU9HEaqnrz31RRhg19xMXzUyK0P9cCIyixJNHnchIhPimMX82kSuKzOL9buo3a3cgtfK1OdErndF3tPIRw9mxgZUuw6ujCuKOpJ080Fn39F1nvDsFbS9GzT7OTSkAjTVs+73iCntuRabuD4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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

DQpPbiAyMDE5LTA5LTI2IDY6MTYgcC5tLiwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOg0KPiBPbiAy
MDE5LTA5LTI2IDU6NTkgcC5tLiwgWmhhbywgWW9uZyB3cm90ZToNCj4+IE9uIDIwMTktMDktMjYg
NTozNiBwLm0uLCBLdWVobGluZywgRmVsaXggd3JvdGU6DQo+Pj4gTWlub3Igbml0LXBpY2sgaW5s
aW5lLiBPdGhlcndpc2UgdGhpcyBwYXRjaCBpcw0KPj4+DQo+Pj4gUmV2aWV3ZWQtYnk6IEZlbGl4
IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPj4+DQo+Pj4gT24gMjAxOS0wOS0y
NiA1OjI3IHAubS4sIFpoYW8sIFlvbmcgd3JvdGU6DQo+Pj4+IFRoaXMgbWFrZXMgcG9zc2libGUg
dGhlIHZtaWQgcGFzaWQgbWFwcGluZyBxdWVyeSB0aHJvdWdoIHNvZnR3YXJlLg0KPj4+Pg0KPj4+
PiBDaGFuZ2UtSWQ6IEliNTM5YWFlMjc3YTIyN2NjMzlmNjQ2OWFlMjNjNDZjNGQyODliODdiDQo+
Pj4+IFNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+DQo+Pj4+IC0t
LQ0KPj4+PiAgICAgIC4uLi9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIu
YyB8IDMzICsrKysrKysrKysrKy0tLS0tLS0NCj4+Pj4gICAgICAuLi4vZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmggfCAgMyArLQ0KPj4+PiAgICAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAgICB8ICAyICsrDQo+Pj4+ICAgICAgMyBm
aWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4+Pj4NCj4g
W3NuaXBdDQo+Pj4+ICAgICAgDQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oDQo+Pj4+IGluZGV4IGVlZDhmOTUwYjY2
My4uOTljOGIzNjMwMWVmIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaA0KPj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaA0KPj4+PiBAQCAtMTg4LDcg
KzE4OCw4IEBAIHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciB7DQo+Pj4+ICAgICAgCXVuc2ln
bmVkIGludAkJKmFsbG9jYXRlZF9xdWV1ZXM7DQo+Pj4+ICAgICAgCXVpbnQ2NF90CQlzZG1hX2Jp
dG1hcDsNCj4+Pj4gICAgICAJdWludDY0X3QJCXhnbWlfc2RtYV9iaXRtYXA7DQo+Pj4+IC0JdW5z
aWduZWQgaW50CQl2bWlkX2JpdG1hcDsNCj4+Pj4gKwkvKiB0aGUgcGFzaWQgbWFwcGluZyBmb3Ig
ZWFjaCBrZmQgdm1pZCAqLw0KPj4+PiArCXVpbnQxNl90CQl2bWlkX3Bhc2lkW1ZNSURfTlVNXTsN
Cj4+Pj4gICAgICAJdWludDY0X3QJCXBpcGVsaW5lc19hZGRyOw0KPj4+PiAgICAgIAlzdHJ1Y3Qg
a2ZkX21lbV9vYmoJKnBpcGVsaW5lX21lbTsNCj4+Pj4gICAgICAJdWludDY0X3QJCWZlbmNlX2dw
dV9hZGRyOw0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3ByaXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4+Pj4gaW5k
ZXggMGQyYzdmYTFmYTQ2Li5hMDgwMTU3MjA4NDEgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KPj4+PiBAQCAtNDMsNiArNDMsOCBAQA0KPj4+PiAgICAg
IA0KPj4+PiAgICAgICNpbmNsdWRlICJhbWRfc2hhcmVkLmgiDQo+Pj4+ICAgICAgDQo+Pj4+ICsj
ZGVmaW5lIFZNSURfTlVNIDE2DQo+Pj4+ICsNCj4+PiBBbnkgZ29vZCByZWFzb24gd2h5IHRoaXMg
aXMgbm90IGRlZmluZWQgaW4ga2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmg/DQo+Pj4gSXQncyBv
bmx5IHVzZWQgdGhlcmUuDQo+PiBbeXpdIEl0IGNvdWxkIGJlIHVzZWQgYnkgb3RoZXIgcGxhY2Vz
IGluIHRoZSBmdXR1cmUsIGFzIHRoZXkgdXNlIDE2DQo+PiBkaXJlY3RseSBub3cuDQo+IENhbiB5
b3UgcG9pbnQgb3V0IHRob3NlIHBsYWNlcz8gQSBxdWljayBncmVwIGZvciBoYXJkLWNvZGVkIDE2
IGluIGtmZA0KPiBkb2Vzbid0IHNob3cgdXAgYW55dGhpbmcgVk1JRC1yZWxhdGVkIG9uIGEgZmly
c3QgZ2xhbmNlLg0KPg0KPiBSZWdhcmRzLA0KPiAgIMKgIEZlbGl4DQo+DQpPaCwgdGh5ZSBhcmUg
aW4gYW1kZ3B1X2FtZGtmZF9nZngqIGZpbGVzLiBJIGhhdmUgcHV0IHRoZSBkZWZpbmUgaW4gDQpr
ZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaCAuIFdpdGggdGhhdCwgSSB3aWxsIGRpcmVjdGx5IHB1
c2ggbGF0ZXIuDQo+Pj4+ICAgICAgI2RlZmluZSBLRkRfTUFYX1JJTkdfRU5UUllfU0laRQk4DQo+
Pj4+ICAgICAgDQo+Pj4+ICAgICAgI2RlZmluZSBLRkRfU1lTRlNfRklMRV9NT0RFIDA0NDQNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
